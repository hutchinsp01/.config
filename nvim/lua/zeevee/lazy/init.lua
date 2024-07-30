return {
	{
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"folke/zen-mode.nvim",
	"github/copilot.vim",
	"kyazdani42/nvim-tree.lua",
	"folke/which-key.nvim",
}
