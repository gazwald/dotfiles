vim.g.ale_fix_on_save = 1
vim.g.ale_disable_lsp = 1
vim.g.ale_completion_enabled = 1
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'

vim.g.ale_fixers = {
  ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
  ['python'] = { 'black', 'isort' },
  ['javascript'] = {'prettier', 'eslint'},
  ['json'] = {'jq'},
  ['yaml'] = {'prettier'},
  ['css'] = {'prettier'}
}

vim.g.ale_linters_ignore = {
  ['python'] = {'flake8', 'pyright'},
}
