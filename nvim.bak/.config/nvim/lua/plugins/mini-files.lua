return {
  "echasnovski/mini.files",
  keys = {
    {
      "<leader>e",
      function()
        local bufname = vim.api.nvim_buf_get_name(0)
        local path = vim.fn.fnamemodify(bufname, ":p")

        if path and vim.uv.fs_stat(path) then require("mini.files").open(bufname, false) end
      end,
      desc = "open [e]xplorer",
    },
  },
  opts = {
    -- Customization of shown content
    content = {
      -- Predicate for which file system entries to show
      filter = function(entry)
        local ignore_list = {
          [".DS_Store"] = true,
          [".git"] = true,
          ["__pycache__"] = true,
        }

        return not ignore_list[entry.name]
      end,
      prefix = nil,
      -- In which order to show file system entries
      sort = nil,
    },
    -- Module mappings created only inside explorer.
    -- Use `''` (empty string) to not create one.
    mappings = {
      close = "q",
      go_in = "l",
      go_in_plus = "l",
      go_out = "h",
      go_out_plus = "h",
      mark_goto = "'",
      mark_set = "m",
      reset = ".",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "<cr>",
      trim_left = "<",
      trim_right = ">",
    },

    -- General options
    options = {
      -- Whether to delete permanently or move into module-specific trash
      permanent_delete = false,
      -- Whether to use for editing directories
      use_as_default_explorer = true,
    },

    -- Customization of explorer windows
    windows = {
      -- Maximum number of windows to show side by side
      max_number = math.huge,
      -- Whether to show preview of file/directory under cursor
      preview = true,
      -- Width of focused window
      width_focus = 25,
      -- Width of non-focused window
      width_nofocus = 15,
      -- Width of preview window
      width_preview = 70,
    },
  },
}
