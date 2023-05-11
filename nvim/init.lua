vim.opt.shiftwidth = 4          -- Length of indentations
vim.opt.tabstop = 4             -- Size of a tab in spaces
vim.opt.expandtab = true        -- Use spaces instead of tabs

vim.opt.number = true           -- Show line number
vim.opt.relativenumber = true   -- Line numbers relative to the cursor line
vim.opt.textwidth = 80          -- Maximum text width
vim.opt.colorcolumn = '80,120'  -- Base width markers

vim.opt.termguicolors = true    -- True color support

vim.opt.undofile = true         -- Enable permanent undos
vim.opt.undodir = vim.env["HOME"] .. '/.cache/nvim/undo_history' -- Permanent undos directory

vim.opt.splitright = true       -- Vertical splits to the right
vim.opt.splitbelow = true       -- Horizontal splits to the bottom

vim.opt.foldmethod = 'manual'   -- No automatic folding

vim.opt.inccommand = 'split'    -- Live preview for substitution with `:s`
vim.opt.incsearch = true        -- Highlighted case-insensitive incremental search
vim.opt.ignorecase = true       -- Ignore case for search / substitution
vim.opt.smartcase = true        -- Deactivate ignorecase when the query has an uppercase character
vim.opt.gdefault = true         -- `g` does not need to be specified in substitutions

vim.opt.spell = true            -- check spelling
vim.opt.spelllang = "en_us,de_de"

require('plugins')
local util = require('util')
require('keymaps')(util)
