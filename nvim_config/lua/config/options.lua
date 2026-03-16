local opt = vim.opt

-- Line Numbers
opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

vim.api.nvim_create_autocmd("Filetype", {
	pattern = {"svelte", "javascript", "typescript", "html", "css", "json"},
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})


-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false 
opt.incsearch = true

-- Apperance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.wrap = false

-- Splits
opt.splitright = true
opt.splitbelow = true

-- System clipboard
opt.clipboard = "unnamedplus"

opt.undofile = true

opt.updatetime = 250

opt.ruler = true

