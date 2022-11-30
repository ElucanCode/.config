-- Auto compile when there are changes in plugins.lua
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- catppuchin colorscheme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function ()
            vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
            require("catppuccin").setup()
            vim.cmd [[colorscheme catppuccin]]
        end,
    }

    -- Better language parser
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = "require('config.treesitter_cfg')"
    }

    -- Better finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', }, -- for file icons
        config = "require('config.nvimtree_cfg')"
    }

    -- Statusbar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function ()
            require('lualine').setup({
                options = {
                    section_separators = '',
                    component_separators = '',
                },
                extensions = {
                    'nvim-tree',
               }
            })
        end,
    }

    use {
        'doums/oterm.nvim',
        config = function ()
            require('oterm').setup({
                layout = "center",
                keymaps = {
                    exit = "<c-q>",
                }
            })
        end
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
                enable = true,
                autoresize = true,
                treewidth = 30,
            })
        end,
    }

    -- auto close braces, ...
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end,
    }

    -- shortcut for comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    }

    -- preview colors
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
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
            require('indent_blankline').setup({
                show_current_context = true,
                -- show_current_context_start = true,
            })
        end,
    }

    -- tex support
    use 'lervag/vimtex'

    -- LSP
    -- download and manage lsp server
    use {
        'williamboman/nvim-lsp-installer',
        config = function ()
            require('nvim-lsp-installer').setup()
        end,
    }
    -- Configuration
    use {
        'neovim/nvim-lspconfig',
        config = "require('config.lspconfig_cfg')",
    }
    -- progress indication for lsp server
    use {
        'j-hui/fidget.nvim',
        config = function()
            require("fidget").setup()
        end,
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
end)
