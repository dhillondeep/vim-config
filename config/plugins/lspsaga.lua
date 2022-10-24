local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga({
    border_style = 'rounded',
    code_action_keys = {
        quit = '<esc>',
        exec = '<CR>',
    },
    finder_action_keys = {
        open = '<C-i>',
        vsplit = '<C-v>',
        split = '<C-h>',
        tabe = '<C-t>',
        quit = '<esc>',
    },
    definition_action_keys = {
        edit = '<C-i>',
        vsplit = '<C-v>',
        split = '<C-h>',
        tabe = '<C-t>',
        quit = '<esc>',
    },
    rename_action_quit = '<esc>',
    code_action_lightbulb = {
        enable = true,
        enable_in_insert = false,
        cache_code_action = true,
        sign = false,
        update_time = 150,
        sign_priority = 20,
        virtual_text = false,
    },
})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <esc> to jump back
keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
--
-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack <esc> jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Code action
keymap({"n","v"}, "<localleader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "<localleader>r", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<localleader>sd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<localleader>sd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "<localleader>[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "<localleader>]", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "<localleader>{", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "<localleader>}", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n","<localleader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
keymap("n", "<localleader>to", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- close floaterm
keymap("t", "<localleader>td", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
