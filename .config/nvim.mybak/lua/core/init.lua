local settings = require("core.settings")
local global = require("core.global")

-- Create cache dir and data dirs
local createdir = function()
	local data_dir = {
		global.cache_dir .. "backup",
		global.cache_dir .. "session",
		global.cache_dir .. "swap",
		global.cache_dir .. "tags",
		global.cache_dir .. "undo",
	}
	-- Only check whether cache_dir exists, this would be enough.
	if vim.fn.isdirectory(global.cache_dir) == 0 then
		os.execute("mkdir -p " .. global.cache_dir)
		for _, v in pairs(data_dir) do
			if vim.fn.isdirectory(v) == 0 then
				os.execute("mkdir -p " .. v)
			end
		end
	end
end

local disable_distribution_plugins = function()
	-- Disable menu loading
	vim.g.did_install_default_menus = 1
	vim.g.did_install_syntax_menu = 1

	-- Comment this if you define your own filetypes in `after/ftplugin`
	-- vim.g.did_load_filetypes = 1

	-- Do not load native syntax completion
	vim.g.loaded_syntax_completion = 1

	-- Do not load spell files
	vim.g.loaded_spellfile_plugin = 1

	-- Whether to load netrw by default
	-- vim.g.loaded_netrw = 1
	-- vim.g.loaded_netrwFileHandlers = 1
	-- vim.g.loaded_netrwPlugin = 1
	-- vim.g.loaded_netrwSettings = 1
	-- newtrw liststyle: https://medium.com/usevim/the-netrw-style-options-3ebe91d42456
	vim.g.netrw_liststyle = 3

	-- Do not load tohtml.vim
	vim.g.loaded_2html_plugin = 1

	-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all of these plugins are
	-- related to reading files inside compressed containers)
	vim.g.loaded_gzip = 1
	vim.g.loaded_tar = 1
	vim.g.loaded_tarPlugin = 1
	vim.g.loaded_vimball = 1
	vim.g.loaded_vimballPlugin = 1
	vim.g.loaded_zip = 1
	vim.g.loaded_zipPlugin = 1

	-- Do not use builtin matchit.vim and matchparen.vim because we're using vim-matchup
	vim.g.loaded_matchit = 1
	vim.g.loaded_matchparen = 1

	-- Disable sql omni completion
	vim.g.loaded_sql_completion = 1

	-- Set this to 0 in order to disable native EditorConfig support
	vim.g.editorconfig = 1

	-- Disable remote plugins
	-- NOTE:
	--  > Disabling rplugin.vim will make `wilder.nvim` complain about missing rplugins during :checkhealth,
	--  > but since it's config doesn't require python rtp (strictly), it's fine to ignore that for now.
	-- vim.g.loaded_remote_plugins = 1
end

local leader_map = function()
	vim.g.mapleader = " "
	vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
	vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

local clipboard_config = function()
	if global.is_mac then
		vim.g.clipboard = {
			name = "macOS-clipboard",
			copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
			paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
			cache_enabled = 0,
		}
	end
end

local load_core = function()
	createdir()
	disable_distribution_plugins()
	leader_map()

	clipboard_config()

	require("core.options")
	require("core.mapping")
	require("keymap")
	require("core.event")
	require("core.pack")

	local colorscheme = settings.colorscheme
	local background = settings.background
	vim.api.nvim_command("set background=" .. background)
	vim.api.nvim_command("colorscheme " .. colorscheme)
end

load_core()