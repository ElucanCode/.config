local M = {}
local wk = require("which-key")
vim.g.mapleader = " "

-- See lua/config/lspconfig_cfg for LSP- and diagnostic keymaps.

-- arguments:
-- - mode = editor mode (i=insert, n=normal)
-- - lhs  = key combination
-- - rhs  = command or key combination to execute
-- - opts = optional options
M.map = function(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.nmap = function(lhs, rhs, opts)
    M.map("n", lhs, rhs, opts)
end
M.imap = function(lhs, rhs, opts)
    M.map("i", lhs, rhs, opts)
end
M.vmap = function(lhs, rhs, opts)
    M.map("v", lhs, rhs, opts)
end

M.nmap("<c-j>", "<c-w>j")
M.nmap("<c-h>", "<c-w>h")
M.nmap("<c-k>", "<c-w>k")
M.nmap("<c-l>", "<c-w>l")
M.nmap("<Tab>", ":tabn<CR>")
M.nmap("<s-Tab>", ":tabp<CR>")
M.nmap("<c-t>", ":split term://zsh<CR>")

wk.register({
    ["<leader>"] = {
        f = { "<cmd>Telescope live_grep<CR>", "Find string" },
        g = { "<cmd>Telescope find_files<CR>", "Find file" },
        t = { "<cmd>Telescope file_browser<CR>", "File browser" },
        b = { "<cmd>Telescope buffers<CR>", "All buffers" },
        s = { "<cmd>Telescope spell_suggest<CR>", "Check spelling"},
    },
    ["<leader>w"] = {
        name = "create windows",
        j = { "<cmd>split<CR>", "Horizontal split" },
        k = { "<cmd>split<CR>", "Horizontal split" },
        h = { "<cmd>vsplit<CR>", "Vertical split" },
        l = { "<cmd>vsplit<CR>", "Vertical split" },
    },
    ["<leader>T"] = {
        name = "manage tabs",
        N = { "<cmd>tabnew<CR>", "Create new tab" },
        n = { "<cmd>tabnext<CR>", "Next tab (use TAB)" },
        p = { "<cmd>tabprevious<CR>", "Previous tab (use SHIFT+TAB)" },
        c = { ":tabc<CR>", "Close tab" },
    },
    ["<leader>d"] = {
        name = "diagnostics",
        a = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Display all diagnostics for current file" },
        f = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Display floating diagnostics" },
        n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Goto next diagnostic" },
        p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Goto previous diagnostic" },
    },
    ["<leader>m"] = {
        name = "miscellaneous",
        i = { "<cmd>IconPickerInsert<CR>", "Display icon picker" },
    },
    ["<leader>Y"] = { "\"+yy", "Copy out of nvim" }
})

wk.register({ ["<leader>Y"] = { "\"+y", "Copy out of nvim" } }, { mode = "v" })

M.setup_specific = function(util)
    local lang = util.get_proj_type()
    -- For language server specifics see config/lspconfig_cfg.lua

    if lang == "cmake" then
        wk.register({
            ["ö"] = {
                name = "Project",
                g = { "<cmd>split term://cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B ./build<CR>", "Export compile commands" },
                b = { "<cmd>split term://cmake -B ./build && make -C ./build -j8<CR>", "Build project"
                }
            }
        })
        vim.g.c_syntax_for_h = 1
    elseif lang == "make" then
        wk.register({
            ["ö"] = {
                name = "Project",
                m = { "<cmd>split term://make<CR>", "Run make" },
                b = { "<cmd>split term://make build<CR>", "Build project", },
                r = { "<cmd>split term://make run<CR>", "Run project", }
            }
        })
        vim.g.c_syntax_for_h = 1
    elseif lang == "rust" then
        wk.register({
            ["ö"] = {
                name = "Project",
                b = { "<cmd>split term://cargo build<CR>", "Debug build" },
                br = { "<cmd>split term://cargo build --release<CR>", "Release build" },
                r = { "<cmd>split term://cargo run<CR>", "Debug run" },
                rr = { "<cmd>split term://cargo run --release<CR>", "Release run" },
                t = { "<cmd>split term://cargo test<CR>", "Run tests" },
                c = { "<cmd>split term://cargo clean<CR>", "Clean build dir" }
            }
        })
    elseif lang == "latex" then
        wk.register({
            ["ö"] = {
                name = "Project",
                b = { "<cmd>VimtexCompile<CR>", "Compile document" },
                c = { "<cmd>VimtexClean<CR>", "Clean auxiliary files" }
            }
        })
    elseif lang == "buildscript" then
        wk.register({
            ["ö"] = {
                name = "Project",
                b = { "<cmd>split term://./build<CR>", "Run build script" },
            }
        })
    end
end

return M
