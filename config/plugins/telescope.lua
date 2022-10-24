-- Telescope configuration
local map = vim.keymap.set
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

vim.cmd([[
  highlight link TelescopePromptCounter TelescopeNormal
  highlight link TelescopeSelection TelescopePromptPrefix
]])

telescope.setup({
  defaults = {
    border = true,
    prompt_title = false,
    results_title = false,
    color_devicons = true,
    layout_strategy = 'horizontal',
    layout_config = {
      bottom_pane = {
        height = 20,
        preview_cutoff = 120,
        prompt_position = 'top'
      },
      center = {
        height = 0.4,
        preview_cutoff = 40,
        prompt_position = 'top',
        width = 0.7
      },
      horizontal = {
        prompt_position = 'top',
        preview_cutoff = 40,
        height = 0.9,
        width = 0.8
      }
    },
    initial_mode = "normal",
    sorting_strategy = 'ascending',
    prompt_prefix = ' ',
    selection_caret = ' → ',
    entry_prefix = '   ',
    path_display = { 'truncate' },
    preview = {
      treesitter = {
        enable = {
          'css', 'dockerfile', 'elixir', 'erlang', 'fish',
          'html', 'http', 'javascript', 'json', 'lua', 'php',
          'python', 'regex', 'ruby', 'rust', 'scss', 'svelte',
          'typescript', 'vue', 'yaml', 'markdown', 'bash', 'c',
          'cmake', 'comment', 'cpp', 'dart', 'go', 'gomod', 'jsdoc',
          'json5', 'jsonc', 'llvm', 'make', 'ninja', 'prisma',
          'proto', 'pug', 'swift', 'todotxt', 'toml', 'tsx',
        }
      }
    },
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
      },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = 'smart_case',        -- other options: 'ignore_case' or 'respect_case'
    },
  }
})

telescope.load_extension('fzf')

local set_keymap = function(lhs, rhs)
  map('n', lhs, rhs, { noremap = true })
end

set_keymap('<Leader>b', telescope_builtin.buffers)
set_keymap('<Leader>fo', telescope_builtin.oldfiles)

set_keymap('<Leader>gb', telescope_builtin.git_branches)
set_keymap('<Leader>gs', telescope_builtin.git_status)
set_keymap('<Leader>gc', telescope_builtin.git_commits)
set_keymap('<Leader>gbc', telescope_builtin.git_bcommits)
