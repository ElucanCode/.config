-- Auto compile when there are changes in plugins.lua
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- catppuccin colorscheme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function ()
            vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
            require("catppuccin").setup()
            vim.cmd [[colorscheme catppuccin]]
        end,
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({})
        end,
    }

    -- Better language parser
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = "require('config.treesitter_cfg')",
    }

    -- Better finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = "require('config.telescope_cfg')",
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    }

    -- File tree
    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     requires = { 'kyazdani42/nvim-web-devicons', }, -- for file icons
    --     config = "require('config.nvimtree_cfg')"
    -- }

    -- Statusbar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function ()
            require('lualine').setup({
                options = {
                    theme = "catppuccin",
                    icons_enables = true,
                    component_separators = '|',
                    section_separators = '',
                },
                sections = {
                    lualine_a = {
                        {
                            'buffers',
                        }
                    }
                }
            })
        end,
    }

    -- Git decorations
    use {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup {
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                }
            }
        end,
    }

    -- Automatic window resizing
    use {
        'beauwilliams/focus.nvim',
        config = function ()
            require('focus').setup({
            --     enable = true,
            --     autoresize = {
            --         enable = true,
            --     },
                treewidth = 30,
            })
        end,
    }

    -- auto close braces, ...
    use {
        'windwp/nvim-autopairs',
        config = "require('nvim-autopairs').setup({})",
    }

    -- shortcut for comments
    use {
        'numToStr/Comment.nvim',
        config = "require('Comment').setup()",
    }

    -- preview colors
    use {
        'norcalli/nvim-colorizer.lua',
        config = "require('colorizer').setup()",
    }

    -- picker for icons
    use {
        'ziontee113/icon-picker.nvim',
        config = function()
            require('icon-picker').setup({
                disable_legacs_commands = true
            })
        end,
        requires = { 'stevearc/dressing.nvim' }
    }

    -- display indentations
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup()
        end,
    }

    -- tex support
    use {
        'lervag/vimtex',
        config = function()
            vim.g.vimtex_view_method = 'zathura'
        end,
    }

    -- LSP
    -- download and manage lsp server
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    -- Configuration
    use {
        'neovim/nvim-lspconfig',
        config = "require('config.lspconfig_cfg')",
    }
    -- progress indication for lsp server
    use {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        config = "require('fidget').setup()",
    }
    -- completion core
    use {
        'hrsh7th/nvim-cmp',
        config = "require('config.nvimcmp_cfg')",
    }
    -- completion source for system path
    use {
        'hrsh7th/cmp-path',
        after = 'nvim-cmp',
    }
    -- completion source for lspconfig
    use {
        'hrsh7th/cmp-nvim-lsp',
        after = 'nvim-cmp',
    }
    -- completion source for word in current buffer
    use {
        'hrsh7th/cmp-buffer',
        after = 'nvim-cmp',
    }
    -- completion source for vsnip snippet plugin
    use {
        'hrsh7th/cmp-vsnip',
        after = 'nvim-cmp',
    }
    -- snippet core
    use {
        'hrsh7th/vim-vsnip',
        after = 'nvim-cmp',
    }
    -- code outline
    use {
        'simrat39/symbols-outline.nvim',
        config = function ()
            require("symbols-outline").setup({
                auto_close = true,
                show_numbers = true,
            })
        end,
    }

    use {
        'kaarmu/typst.vim',
        ft = {'typst'}
    }
end)
