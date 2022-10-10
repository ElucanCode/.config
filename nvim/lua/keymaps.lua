vim.g.mapleader = ";"

-- mode: i = insert, n = normal, v = visual
-- lhs: the custom keybind
-- rhs: the command or existing keybind
-- opts: optional options (see :h map-arguments and :h map-commands)
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>o", ":SymbolsOutline<CR>")

map("n", "<leader>t", ":NvimTreeToggle<CR>")
map("n", "<leader>f", ":Telescope grep_string<CR>")
map("n", "<leader>F", ":Telescope find_files<CR>")
map("n", "<leader>T", ":Telescope<CR>")
