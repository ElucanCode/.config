require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "cpp", "lua", "rust", "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        additional_vim_regex_highlighting = false,
    },
    matchup = {
        enable = true,
    }
}
