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
        f = { "<cmd>Telescope live_grep<CR>", "find string" },
        g = { "<cmd>Telescope find_files<CR>", "find file" },
        t = { "<cmd>Telescope file_browser<CR>", "file browser" },
        b = { "<cmd>Telescope buffers<CR>", "all buffers" },
        s = { "<cmd>Telescope spell_suggest<CR>", "check spelling"},
    },
    ["<leader>w"] = {
        name = "create windows",
        j = { "<cmd>split<CR>", "horizontal split" },
        k = { "<cmd>split<CR>", "horizontal split" },
        h = { "<cmd>vsplit<CR>", "vertical split" },
        l = { "<cmd>vsplit<CR>", "vertical split" },
    },
    ["<leader>T"] = {
        name = "manage tabs",
        N = { "<cmd>tabnew<CR>", "create new tab" },
        n = { "<cmd>tabnext<CR>", "next tab (use TAB)" },
        p = { "<cmd>tabprevious<CR>", "previous tab (use SHIFT+TAB)" },
        c = { ":tabc<CR>", "close tab" },
    },
    ["<leader>d"] = {
        name = "diagnostics",
        a = { "<cmd>lua vim.diagnostic.setloclist()", "display all diagnostics for current file" },
        f = { "<cmd>lua vim.diagnostic.open_float()", "display floating diagnostics" },
        n = { "<cmd>lua vim.diagnostic.goto_next()", "goto next diagnostic" },
        p = { "<cmd>lua vim.diagnostic.goto_prev()", "goto previous diagnostic" },
    },
    ["<leader>m"] = {
        name = "miscellaneous",
        i = { "<cmd>IconPickerInsert<CR>", "display icon picker" },
    },
    ["<leader>Y"] = { "\"+yy", "Copy out of nvim" }
})

wk.register({ ["<leader>Y"] = { "\"+y", "Copy out of nvim" } }, { mode = "v" })

M.setup_specific = function(util)
    local lang = util.get_proj_lang()
    -- For language server specifics see config/lspconfig_cfg.lua

    if lang == "cmake" then
        wk.register({
            ["ö"] = {
                name = "project",
                g = { "<cmd>split term://cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B ./build<CR>", },
                b = { "<cmd>split term://cmake -B ./build && make -C ./build -j8<CR>", "Build project"
                }
            }
        })
    elseif lang == "make" then
        wk.register({
            ["ö"] = {
                name = "project",
                b = { "<cmd>split term://make build<CR>", "Build project", },
                r = { "<cmd>split term://make run<CR>", "Run project", }
            }
        })
    elseif lang == "rust" then
        wk.register({
            ["ö"] = {
                name = "project",
                b = { "<cmd>split term://cargo build<CR>", "debug build" },
                br = { "<cmd>split term://cargo build --release<CR>", "release build" },
                r = { "<cmd>split term://cargo run<CR>", "debug run" },
                rr = { "<cmd>split term://cargo run --release<CR>", "release run" },
                t = { "<cmd>split term://cargo test<CR>", "run tests" },
                c = { "<cmd>split term://cargo clean<CR>", "clean build dir" }
            }
        })
    elseif lang == "latex" then
        wk.register({
            ["ö"] = {
                name = "project",
                b = { "<cmd>VimtexCompile<CR>", "compile document" },
                c = { "<cmd>VimtexClean<CR>", "clean auxiliary files" }
            }
        })
    end
end

return M
