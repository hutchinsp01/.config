return {
    {
	    "nvim-telescope/telescope.nvim",
        tag = '0.1.5',
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon_add_mark = function(prompt_bufnr)
                local entry = require("telescope.actions.state").get_selected_entry()
                local list = require("harpoon"):list()
                local harpoon_config = list.config
                local item = harpoon_config.create_list_item(harpoon_config, entry[1])
                list:add(item)
            end

            require('telescope').setup({
                defaults = {
                    path_display = {
                        "smart"
                    },
                    mappings = {
                        i = {
                            ["<C-r>"] = harpoon_add_mark,
                        },
                        n = {
                            ["<C-r>"] = harpoon_add_mark,
                        },
                    },
                },
            })

	    	local builtin = require('telescope.builtin')
	    	vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>pg', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
            -- vim.keymap.set('n', '<leader>pws', function()
            --     local word = vim.fn.expand("<cword>")
            --     builtin.grep_string({ search = word })
            -- end)
            -- vim.keymap.set('n', '<leader>pWs', function()
            --     local word = vim.fn.expand("<cWORD>")
            --     builtin.grep_string({ search = word })
            -- end)
	    end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
}
