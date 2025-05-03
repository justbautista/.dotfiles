return {
  -- colorschemes
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_style = "deep ocean"
      require("material").setup({
        plugins = {
          "gitsigns",
          "nvim-cmp",
          "nvim-tree",
          "telescope",
          "trouble",
          "which-key",
        },
        disable = {
          background = true, -- Enable transparency
        },
        contrast = {
          terminal = true,
          sidebars = true,
        },
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
    "folke/tokyonight.nvim", -- Replace with your theme plugin
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- Options: "storm", "moon", "night", "day"
        transparent = true,
      })
    end,
  },

  -- set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material", -- Replace with your colorscheme
    },
  },
}
