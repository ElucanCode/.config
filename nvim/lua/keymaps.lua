vim.g.mapleader = "ö"

-- arguments:
-- - mode = editor mode (i=insert, n=normal)
-- - lhs  = key combination
-- - rhs  = command or key combination to execute
-- - opts = optional options
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nmap(lhs, rhs, opts)
    map("n", lhs, rhs, opts)
end
local function vmap(lhs, rhs, opts)
    map("v", lhs, rhs, opts)
end

-- nvim-tree
nmap("<leader>t", ":NvimTreeToggle<CR>")
nmap("<leader>T", ":NvimTreeRefresh<CR>")

-- switch focus
nmap("<c-j>", "<c-w>j")
nmap("<c-h>", "<c-w>h")
nmap("<c-k>", "<c-w>k")
nmap("<c-l>", "<c-w>l")

-- copy out of nvim
vmap("<leader>Y", "\"+y")
nmap("<leader>Y", "\"+yy")

-- unhighlight search results
nmap("<leader><space>", ":noh<CR>")

-- open code outline
nmap("<leader>o", ":SymbolsOutline<CR>")

-- Telescope
nmap("<c-t>", ":NvimTreeToggle<CR>")
nmap("<c-f>", ":Telescope live_grep<CR>")
nmap("<c-g>", ":Telescope find_files<CR>")

-- IconPicker
nmap("<leader>i", ":IconPickerInsert<CR>")

local function setup_specific(util)
    local lang = util.get_lang()
    -- For language server specifics see config/lspconfig_cfg.lua

    -- project specific over language specific
    if lang == "cmake" and util.is_project("poseidon_core") then
        nmap(";gd", ":split term://cmake -DCMAKE_BUILD_TYPE=Debug -DUSE_PMDK=OFF -DUSE_PFILE=OFF -DUSE_LLVM=ON -DQOP_RECOVERY=OFF -D CMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B build/Debug<CR>")
        nmap(";bd", ":split term://cmake --build build/Debug -j8<CR>")
        nmap(";gr", ":split term://cmake -DCMAKE_BUILD_TYPE=Release -DUSE_PMDK=OFF -DUSE_PFILE=OFF -DUSE_LLVM=ON -DQOP_RECOVERY=OFF -D CMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B build/Debug<CR>")
        nmap(";br", ":split term://cmake --build build/Release -j8<CR>")


    elseif lang == "make" then
        nmap(";b", ":split term://make build<CR>")
        nmap(";r", ":split term://make run<CR>")

    elseif lang == "rust" then
        nmap(";rd", ":split term://cargo run<CR>")
        nmap(";rr", ":split term://cargo run --release<CR>")
        nmap(";bd", ":split term://cargo build<CR>")
        nmap(";br", ":split term://cargo build --release<CR>")
        nmap(";t",  ":split term://cargo test<CR>")
        nmap(";c",  ":split term://cargo clean<CR>")

    elseif lang == "latex" then
        nmap(";b", ":VimtexCompile<CR>")
        nmap(";c", ":VimtexClean<CR>")

    end
end

return setup_specific
