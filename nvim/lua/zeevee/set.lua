local opt = vim.opt
local o = vim.o
local g = vim.g

-- :help options

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opt.undofile = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- Clipboard
vim.api.nvim_set_option("clipboard","unnamed")
