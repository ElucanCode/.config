local ok, tree_c = pcall(require, "nvim-tree.config")
if not ok then
  vim.notify(tree_c, vim.log.levels.ERROR)
  return
end

-- automatically close neovim when nvim-tree is the last open buffer
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

-- vim.g.nvim_tree_icons = {
--   default = "",
--   symlink = "→",
--   git = {
--     unstaged = "✗",
--     staged = "✓",
--     unmerged = "",
--     renamed = "➜",
--     untracked = "",
--     deleted = "",
--     ignored = "",
--   },
--   folder = {
--     arrow_open = "",
--     arrow_closed = "",
--     default = "",
--     open = "ﱮ",
--     empty = "",
--     empty_open = "",
--     symlink = "",
--     symlink_open = "",
--   },
-- }

require('nvim-tree').setup {
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    hide_root_folder = true,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
    float = {
        enable = false,
        quit_on_focus_loss = true,
        open_win_config = {
            relative = "editor",
            border = "rounded",
            width = 30,
            height = 30,
            row = 1,
            col = 1,
        },
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      show = {
          git = true,
          folder = true,
          file = true,
          folder_arrow = true,
      },
      glyphs = {
          default = "",
          symlink = "→",
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            deleted = "",
            ignored = "",
          },
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "ﱮ",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
      },
    },
    highlight_git = true,
    highlight_opened_files = "icon",
    add_trailing = true,
    group_empty = true,
    root_folder_modifier = ":t",
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
