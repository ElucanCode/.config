vim.g.mapleader = "ö"

-- arguments:
-- - mode = editor mode (i=insert, n=normal)
-- - lhs  = keycombination
-- - rhs  = command or keycombination to execute
-- - opts = optional options
local function map(mode, lhs, rhs, opts)
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

-- copy out of nvim
map("v", "<leader>Y", "\"+y")
map("n", "<leader>Y", "\"+yy")

-- unhighlight search results
map("n", "<leader><space>", ":noh<CR>")

-- open code outline
map("n", "<leader>o", ":SymbolsOutline<CR>")

-- Telescope
map("n", "<c-t>", ":NvimTreeToggle<CR>")
map("n", "<c-f>", ":Telescope live_grep<CR>")
map("n", "<c-g>", ":Telescope find_files<CR>")

local function setup_specific(util)
    local lang = util.get_lang()
    -- For language server specifics see config/lspconfig_cfg.lua

    -- project specific over language specific
    if lang == "cmake" and util.is_project("poseidon_core") then
        map("n", ";gd", ":split term://cmake -DCMAKE_BUILD_TYPE=Debug -DUSE_PMDK=OFF -DUSE_PFILE=OFF -DUSE_LLVM=ON -DQOP_RECOVERY=OFF -D CMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B build/Debug<CR>")
        map("n", ";bd", ":split term://cmake --build build/Debug -j8<CR>")
        map("n", ";gr", ":split term://cmake -DCMAKE_BUILD_TYPE=Release -DUSE_PMDK=OFF -DUSE_PFILE=OFF -DUSE_LLVM=ON -DQOP_RECOVERY=OFF -D CMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B build/Debug<CR>")
        map("n", ";br", ":split term://cmake --build build/Release -j8<CR>")


    elseif lang == "make" then
        map("n", ";b", ":split term://make build<CR>")
        map("n", ";r", ":split term://make run<CR>")

    elseif lang == "rust" then
        map("n", ";rd", ":split term://cargo run<CR>")
        map("n", ";rr", ":split term://cargo run --release<CR>")
        map("n", ";bd", ":split term://cargo build<CR>")
        map("n", ";br", ":split term://cargo build --release<CR>")
        map("n", ";t",  ":split term://cargo test<CR>")
        map("n", ";c",  ":split term://cargo clean<CR>")
    end
end

return setup_specific
