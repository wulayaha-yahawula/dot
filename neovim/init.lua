-- Options
vim.opt.cmdheight = 0
vim.opt.wrap = false
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Keybindings
vim.keymap.set("i", "jk", "<Esc>", { desc = "Back to normal mode" })
vim.keymap.set("v", "jk", "<Esc>", { desc = "Back to normal mode" })
vim.keymap.set("c", "jk", "<Esc>", { desc = "Back to normal mode" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to right" })
vim.keymap.set("n", "<Leader><Leader>s", ":source $MYVIMRC<CR>", { desc = "Source configuration" })
vim.keymap.set("n", "<Leader><Leader>e", ":edit $MYVIMRC<CR>", { desc = "Edit configuration" })

-- Autocmd
vim.api.nvim_create_autocmd({ "BufReadPost", "FileType" }, {
	group = vim.api.nvim_create_augroup("disable_auto_comment", { clear = true }),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = {
		-- LazyVim --
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				colorscheme = "tokyonight-night",
			},
		},
		{ import = "lazyvim.plugins.extras.coding.luasnip" },
		{ import = "lazyvim.plugins.extras.coding.nvim-cmp" },
		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.dap.nlua" },
		{ import = "lazyvim.plugins.extras.editor.illuminate" },
		{ import = "lazyvim.plugins.extras.editor.navic" },
		{ import = "lazyvim.plugins.extras.editor.neo-tree" },
		{ import = "lazyvim.plugins.extras.editor.outline" },
		{ import = "lazyvim.plugins.extras.editor.overseer" },
		{ import = "lazyvim.plugins.extras.editor.refactoring" },
		{ import = "lazyvim.plugins.extras.editor.telescope" },
		{ import = "lazyvim.plugins.extras.lang.clangd" },
		{ import = "lazyvim.plugins.extras.lsp.none-ls" },
		{ import = "lazyvim.plugins.extras.test.core" },
		{ import = "lazyvim.plugins.extras.ui.indent-blankline" },
		{ import = "lazyvim.plugins.extras.ui.treesitter-context" },

		-- AstroNvim --
		-- {
		-- 	"AstroNvim/AstroNvim",
		-- 	version = "^5",
		-- 	import = "astronvim.plugins",
		-- },
		-- { "AstroNvim/astrocommunity" },
		-- { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
		-- { import = "astrocommunity.bars-and-lines.vim-illuminate" },
		-- { import = "astrocommunity.code-runner.overseer-nvim" },
		-- { import = "astrocommunity.color.modes-nvim" },
		-- { import = "astrocommunity.color.nvim-highlight-colors" },
		-- { import = "astrocommunity.comment.ts-comments-nvim" },
		-- { import = "astrocommunity.completion.cmp-cmdline" },
		-- { import = "astrocommunity.completion.cmp-nvim-lua" },
		-- { import = "astrocommunity.completion.nvim-cmp-buffer-lines" },
		-- { import = "astrocommunity.completion.nvim-cmp" },
		-- { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
		-- { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
		-- { import = "astrocommunity.diagnostics.trouble-nvim" },
		-- { import = "astrocommunity.editing-support.bigfile-nvim" },
		-- { import = "astrocommunity.editing-support.nvim-treesitter-context" },
		-- { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
		-- { import = "astrocommunity.editing-support.todo-comments-nvim" },
		-- { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
		-- { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
		-- { import = "astrocommunity.git.diffview-nvim" },
		-- { import = "astrocommunity.git.git-blame-nvim" },
		-- { import = "astrocommunity.indent.snacks-indent-hlchunk" },
		-- { import = "astrocommunity.lsp.lsp-signature-nvim" },
		-- { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
		-- { import = "astrocommunity.pack.cpp" },
		-- { import = "astrocommunity.pack.lua" },
		-- { import = "astrocommunity.programming-language-support.csv-vim" },
		-- { import = "astrocommunity.project.project-nvim" },
		-- { import = "astrocommunity.scrolling.neoscroll-nvim" },
		-- { import = "astrocommunity.scrolling.nvim-scrollbar" },
		-- { import = "astrocommunity.snippet.nvim-snippets" },
		-- { import = "astrocommunity.test.neotest" },
		-- { import = "astrocommunity.utility.neodim" },
		-- { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
	},
})
