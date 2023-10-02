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

-- copy out of nvim
M.vmap("<leader>Y", "\"+y")
M.nmap("<leader>Y", "\"+yy")

-- switch focus
M.nmap("<c-j>", "<c-w>j")
M.nmap("<c-h>", "<c-w>h")
M.nmap("<c-k>", "<c-w>k")
M.nmap("<c-l>", "<c-w>l")

-- tabs
M.nmap("<Tab>", ":tabn<CR>")
M.nmap("<s-Tab>", ":tabp<CR>")
M.nmap("<c-n>", ":tabnew<CR>")
M.nmap("<c-x>", ":tabc<CR>")

-- Telescope
M.nmap("<leader>f", ":Telescope live_grep<CR>")
M.nmap("<leader>g", ":Telescope find_files<CR>")
M.nmap("<leader>t", ":Telescope file_browser<CR>")
M.nmap("<leader>b", ":Telescope buffers<CR>")

-- other
M.nmap("<c-t>", ":split term://zsh<CR>")
M.nmap("<leader>i", ":IconPickerInsert<CR>")
M.nmap("<leader>o", ":SymbolsOutline<CR>")
M.nmap("<leader>j", ":split<CR>")
M.nmap("<leader>k", ":split<CR>")
M.nmap("<leader>l", ":vsplit<CR>")
M.nmap("<leader>h", ":vsplit<CR>")

M.setup_specific = function(util)
    local lang = util.get_proj_lang()
    -- For language server specifics see config/lspconfig_cfg.lua

    if lang == "cmake" then
        wk.register({ ["ö"] = {
            name = "project",
            g = {
                "<cmd>split term://cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B ./build<CR>",
            },
            b = {
                "<cmd>split term://cmake -B ./build && make -C ./build -j8<CR>",
                "Build project"
            }
        } })

    elseif lang == "make" then
        wk.register({ ["ö"] = {
            name = "project",
            b = {
                "<cmd>split term://make build<CR>",
                "Build project",
            },
            r = {
                "<cmd>split term://make run<CR>",
                "Run project",
            }
        } })

    elseif lang == "rust" then
        wk.register({ ["ö"] = {
            name = "project",
            b = {
                "<cmd>split term://cargo build<CR>",
                "debug build"
            },
            br = {
                "<cmd>split term://cargo build --release<CR>",
                "release build"
            },
            r = {
                "<cmd>split term://cargo run<CR>",
                "debug run"
            },
            rr = {
                "<cmd>split term://cargo run --release<CR>",
                "release run"
            },
            t = {
                "<cmd>split term://cargo test<CR>",
                "run tests"
            },
            c = {
                "<cmd>split term://cargo clean<CR>",
                "clean build dir"
            }
        } })

    elseif lang == "latex" then
        wk.register({ ["ö"] = {
            name = "project",
            b = {
                "<cmd>VimtexCompile<CR>",
                "compile document"
            },
            c = {
                "<cmd>VimtexClean<CR>",
                "clean auxiliary files"
            }
        } })
    end
end

return M
