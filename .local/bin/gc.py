#!/usr/bin/env python
from __future__ import annotations

import re
import sys
from pathlib import Path
from typing import TYPE_CHECKING, Literal, get_args
from urllib.parse import urlparse

from pygit2 import clone_repository
from pygit2.callbacks import RemoteCallbacks
from pygit2.credentials import Keypair
from pygit2.repository import Repository

if TYPE_CHECKING:
    from re import Match, Pattern
    from typing import Callable
    from urllib.parse import ParseResult

RepoType = Literal[
    "personal",
    "work",
    "external",
]
DOMAINS: dict[RepoType, set[str]] = {
    "personal": {"poppet.io"},
}
USERS: dict[RepoType, set[str]] = {
    "personal": {"gazwald"},
}
BASE_PATH: Path = Path.home() / "local" / "checkouts"
REPO_REGEX: Pattern = re.compile(
    r"".join(
        (
            r"^",  # Start
            r"(?:git@|ssh://git@)",  # Non-capturing 'git' or 'ssh://git@'
            r"(?P<hostname>.*)",
            r"(?::)",  # Non-capturing ':"
            r"(?P<path>.*)",
            r"(?:\.git)",  # Non-capturing '.git'
            r"$",  # End
        )
    )
)


domain_check: Callable[[RepoType, str], bool] = lambda repo_type, hostname: (
    repo_type in DOMAINS and any(domain == hostname for domain in DOMAINS[repo_type])
)
user_check: Callable[[RepoType, str], bool] = lambda repo_type, path: (
    repo_type in USERS and any(path.startswith(user) for user in USERS[repo_type])
)
repo_type_check: Callable[[RepoType, str, str], bool] = lambda repo_type, hostname, path: (
    domain_check(repo_type, hostname) or user_check(repo_type, path)
)


def _repo_type(hostname: str, path: str) -> RepoType:
    for repo_type in get_args(RepoType):
        if repo_type_check(repo_type, hostname, path):
            return repo_type

    return "external"


def _repo_path(repo_type: RepoType, repo_path: str) -> Path:
    path = Path(BASE_PATH / repo_type / repo_path)
    path.mkdir(exist_ok=True, parents=True)
    return path


from_match: Callable[[Match], tuple[str, str]] = lambda match: (
    match.group("hostname"),
    match.group("path"),
)
from_urlparse: Callable[[ParseResult], tuple[str, str]] = lambda result: (
    result.hostname or "unknown",
    result.path[1:].replace(".git", ""),
)


def _process_url(url: str) -> tuple[str, str]:
    if match := REPO_REGEX.match(url):
        return from_match(match)

    return from_urlparse(urlparse(url))


def _get_repo_path(url: str) -> Path:
    hostname, path = _process_url(url)
    return _repo_path(_repo_type(hostname, path), path)


def _key() -> Path:
    for key in ("id_rsa.pub", "id_ed25519.pub"):
        path = Path.home() / ".ssh" / key
        if path.exists():
            return path

    print("No keys?", file=sys.stderr)
    exit(1)


_clone: Callable[[str, Path, Path], Repository] = lambda url, path, key: clone_repository(
    url=url,
    path=path,
    callbacks=RemoteCallbacks(
        credentials=Keypair(
            username="git",
            pubkey=key,
            privkey=key.stem,
            passphrase="",
        ),
    ),
)


get_url: Callable[[], str | None] = lambda: sys.argv[1] if len(sys.argv) == 2 else None


def main(url: str | None):
    if url:
        print(f"Using {url}...", file=sys.stderr)
    else:
        print("No url?", file=sys.stderr)
        exit(1)

    print(_key(), file=sys.stderr)
    path = _get_repo_path(url)
    if not (path / ".git").exists():
        _clone(url, path, _key())

    # (Path.home() / "temp" / "gc.data").write_text(str(path))
    print(path, file=sys.stdout)


if __name__ == "__main__":
    main(get_url())
