return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set('n', 'gb', function()
                local bufname = vim.fn.bufname('%')
                local filetype = vim.bo.filetype

                if bufname:match('.fugitiveblame$') and filetype == 'fugitiveblame' then
                    vim.cmd('quit')
                else
                    vim.cmd('G blame')
                end
            end, { noremap = true, silent = true })
        end,
    },
}
