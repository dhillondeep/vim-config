local actions = require "fzf-lua.actions"
require'fzf-lua'.setup {
  winopts = {
    preview = {
      default = 'bat',
      scrollbar      = 'false',
      vertical       = 'down:45%',      -- up|down:size
      horizontal     = 'right:55%',     -- right|left:size
    },
  },
  fzf_opts = {
    -- options are sent as `<left>=<right>`
    -- set to `false` to remove a flag
    -- set to '' for a non-value flag
    -- for raw args use `fzf_args` instead
    ['--info']        = 'inline',
    ['--layout']      = 'reverse',
    ['--color']       = 'pointer:129,marker:010',
    ['--ansi']        = '',
  },
  previewers = {
    bat = {
      cmd             = "bat",
      args            = os.getenv("BAT_ARGS"),
      theme           = os.getenv("BAT_THEME"),
    },
  },
  files = {
    prompt            = 'Files❯ ',
    fd_opts           = os.getenv("FD_OPTS") .. " --type f --type s",
  },
  grep = {
    rg_opts           = os.getenv("RG_OPTS"),
    actions = {
      ["ctrl-e"]      = { actions.grep_lgrep }
    },
    continue_last_search = true,
  },
  file_icon_colors = {
    ["sh"] = "green",
  },
}
