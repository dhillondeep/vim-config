function NvimTreeWidth()
    local columns = vim.fn.winwidth(0)
    return math.min((columns - 60), math.max(80, (columns - 20)))
end

function NvimTreeHeight()
    local lines = vim.fn.winheight(0)
    return math.min((lines - 4), math.max(20, (lines - 10)))
end

function NvimTreeRow()
    local lines = vim.fn.winheight(0)
    local height = NvimTreeHeight()
    return ((lines - height) / 2) - 1
end

function NvimTreeCol()
    local columns = vim.fn.winwidth(0)
    local width = NvimTreeWidth()
    return (columns - width) / 2
end

require("nvim-tree").setup {
    respect_buf_cwd = true,
    disable_netrw = true,
    select_prompts = true,
	view = {
        mappings = {
          list = {
            { key = "<CR>", action = "edit_no_picker" },
            { key = "<BS>", action = "dir_up" },
            { key = "<ESC>", action = "close" },
            { key = "N", action = "create" },
            { key = "c", action = "copy" },
            { key = "x", action = "cut" },
            { key = "p", action = "paste" },
            { key = "r", action = "rename" },
            { key = "y", action = "copy_absolute_path" },
            { key = ".", action = "toggle_dotfiles" },
            { key = "<C-.>", action = "toggle_git_ignored" },
            { key = "<C-k>", action = "toggle_file_info" },
            { key = "?", action = "preview" },
          },
        },
	},
	filters = {
		dotfiles = true, -- hide dot files
		custom = { ".git", "node_modules", ".cache", ".idea" }, -- custom hide
	},
	renderer = {
		root_folder_modifier = ":~",
		special_files = {
			["go.mod"] = 1,
			["Cargo.toml"] = 1,
			["README.md"] = 1,
			["Makefile"] = 1,
			["BUILD"] = 1,
			["MAKEFILE"] = 1,
			["composer.json"] = 1,
			["package.json"] = 1,
		},
		icons = {
			show = { file = true, folder = true, folder_arrow = true },
		},
		highlight_git = true,
		indent_markers = {
			enable = false,
		},
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				exclude = {
					filetype = {
						"startify",
					},
					buftype = {
						"terminal",
					},
				},
			},
		},
	},
}

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	nested = true,
	callback = function()
		if vim.fn.winnr "$" == 1 and vim.fn.bufname() == "NvimTree_" .. vim.fn.tabpagenr() then
			vim.api.nvim_command ":silent qa!"
		end
	end,
})
