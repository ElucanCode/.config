local current = "catppuccin"

if (current == "monokai") then
    require('monokai').setup { palette = require('monokai').pro }
elseif (current == "nord") then
    vim.cmd[[colorscheme nord]]
elseif (current == "catppuccin") then
    vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
    require("catppuccin").setup()
    vim.cmd [[colorscheme catppuccin]]
end
