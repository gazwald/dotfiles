# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH

if [ -d ~/.bashrc.d/ ]; then
  files=$(\
    find ~/.bashrc.d/ \
                    -not -iname '*.sw?' \
                    -and \
                    -not -iname '.keep' \
                    -and \
                    -not -iname '.git*' \
                    -and \
                    -not -iwholename '*/.git/*' \
  )
  for rc in ${files}; do
    if test -f "$rc"; then
      source "$rc"
    fi
  done
fi

TERRAFORM_RUNTIME="/usr/bin/terraform"
if test -f $TERRAFORM_RUNTIME; then
  complete -C $TERRAFORM_RUNTIME terraform
fi
