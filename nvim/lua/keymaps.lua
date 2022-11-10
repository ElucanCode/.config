vim.g.mapleader = ";"

-- arguments:
-- - mode = editor mode (i=insert, n=normal)
-- - lhs  = keycombination
-- - rhs  = command or keycombination to execute
-- - opts = optional options
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- nvim-tree
map("n", "<leader>t", ":NvimTreeToggle<CR>")
map("n", "<leader>T", ":NvimTreeRefresh<CR>")

-- switch focus
map("n", "<c-j>", "<c-w>j")
map("n", "<c-h>", "<c-w>h")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- telescope
map("n", "<leader>f", ":Telescope grep_string<CR>")
map("n", "<leader>F", ":Telescope find_files<CR>")

-- copy out of nvim
map("v", "<leader>Y", "\"+y")
map("n", "<leader>Y", "\"+yy")

-- unhighlight search results
map("n", "<leader><CR>", ":noh<CR>")

-- jump to function definition
map("n", "<leader>gd", "g]")

-- open code outline
map("n", "<leader>o", ":SymbolsOutline<CR>")

map("n", "<leader>t", ":NvimTreeToggle<CR>")
map("n", "<leader>f", ":Telescope grep_string<CR>")
map("n", "<leader>F", ":Telescope find_files<CR>")
map("n", "<leader>T", ":Telescope<CR>")
