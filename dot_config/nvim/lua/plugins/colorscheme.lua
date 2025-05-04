return {
  -- set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material", -- Replace with your colorscheme
    },
  },

  -- colorschemes
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_style = "deep ocean"
      require("material").setup({
        plugins = {
          "coc",
          "colorful-winsep",
          "dap",
          "dashboard",
          "eyeliner",
          "fidget",
          "flash",
          "gitsigns",
          "harpoon",
          "hop",
          "illuminate",
          "indent-blankline",
          "lspsaga",
          "mini",
          "neogit",
          "neotest",
          "neo-tree",
          "neorg",
          "noice",
          "nvim-cmp",
          "nvim-navic",
          "nvim-tree",
          "nvim-web-devicons",
          "rainbow-delimiters",
          "sneak",
          "telescope",
          "trouble",
          "which-key",
          "nvim-notify",
        },
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          operators = {},
          types = {},
        },
        disable = {
          background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        },
        contrast = {
          terminal = true,
          sidebars = true,
          floating_windows = true,
          cursor_line = false,
        },
        high_visibility = {
          darker = true,
        },
        lualine_style = "stealth",
      })
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
}
