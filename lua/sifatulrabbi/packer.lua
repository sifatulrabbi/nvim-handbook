vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        -- or                          , branch = "0.1.x",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use({
        "nvim-treesitter/nvim-treesitter-context",
        build = ":TSUpdate",
    })

    use("projekt0n/github-nvim-theme")
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    }

    use("tpope/vim-rhubarb")
    use("tpope/vim-sleuth")

    use({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    })

    use("lewis6991/gitsigns.nvim")
    use("numToStr/Comment.nvim")

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }

    -- use("lukas-reineke/indent-blankline.nvim")
end)
