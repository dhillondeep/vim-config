require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {
            {
                'mode',
                icons_enabled = true,
            }
        },
        lualine_b = {
            {
                'diff',
                colored = true, -- Displays a colored diff status if set to true
            },
            {
                'diagnostics',
                sources = { 'nvim_diagnostic', 'coc' },
                sections = { 'error', 'warn', 'info', 'hint' },
                diagnostics_color = {
                    error = 'DiagnosticError', -- Changes diagnostics' error color.
                    warn  = 'DiagnosticWarn', -- Changes diagnostics' warn color.
                    info  = 'DiagnosticInfo', -- Changes diagnostics' info color.
                    hint  = 'DiagnosticHint', -- Changes diagnostics' hint color.
                },
                symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
                colored = true, -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false, -- Show diagnostics even if there are none.
            },
        },
        lualine_c = { 'searchcount' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
            { 'branch' },
        },
        lualine_b = { '' },
        lualine_c = {
            {
                'filename',
                file_status = true,
                newfile_status = true,
                path = 3,
                shorting_target = 40,
            }
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' }
    },
    winbar = {},
    inactive_winbar = {},
    extensions = { 'fzf' }
}
