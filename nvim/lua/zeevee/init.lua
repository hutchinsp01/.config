require("zeevee.remap")
require("zeevee.lazy_init")
require("zeevee.set")

local augroup = vim.api.nvim_create_augroup
local ZeeVeeGroup = augroup('ZeeVee', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePre"}, {
    group = ZeeVeeGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
