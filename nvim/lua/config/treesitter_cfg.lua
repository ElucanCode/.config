require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "cpp", "lua", "latex", "rust" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
        enable = true, -- `false` will disable the whole extension
        additional_vim_regex_highlighting = false,
    },
}
