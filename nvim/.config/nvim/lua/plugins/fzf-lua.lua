return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader><leader>",
      function()
        require("fzf-lua").files {
          previewer = {
            snacks_image = false,
          },
        }
      end,
      desc = "find project files",
    },
    {
      "<leader>fb",
      function()
        require("fzf-lua").buffers {
          previewer = {
            snacks_image = false,
          },
        }
      end,
      desc = "[f]ind open [b]uffers",
    },
    {
      "<leader>fc",
      function()
        require("fzf-lua").files {
          previewer = {
            snacks_image = false,
          },
          cwd = vim.fn.stdpath "config",
        }
      end,
      desc = "[f]ind [c]onfig",
    },
    {
      "<leader>fk",
      function() require("fzf-lua").keymaps() end,
      desc = "[f]ind [k]eymaps",
    },
    {
      "<leader>fm",
      function() require("fzf-lua").commands() end,
      desc = "[f]ind co[m]mands",
    },
    {
      "<leader>sp",
      function()
        require("fzf-lua").live_grep {
          previewer = {
            snacks_image = false,
          },
        }
      end,
      desc = "[s]earch [p]roject",
    },
    {
      "<leader>sg",
      function()
        require("fzf-lua").git_status {
          previewer = {
            snacks_image = false,
          },
        }
      end,
      desc = "[s]earch [g]it status",
    },
    {
      "<leader>/",
      function()
        require("fzf-lua").lgrep_curbuf {
          previewer = {
            snacks_image = false,
          },
        }
      end,
      desc = "[/] with fzf",
    },
  },
  opts = {
    keymap = {
      fzf = {
        ["ctrl-q"] = "select-all+accept", -- send results to quickfix
      },
    },
    winopts = {
      height = 0.9,
      width = 0.9,
      preview = {
        scrollbar = false,
        layout = "vertical",
        vertical = "up:60%",
      },
    },
  },
}
