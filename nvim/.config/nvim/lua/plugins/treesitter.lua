---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- Shell & Git
      "bash",
      "comment",
      "diff",
      "dockerfile",
      "gitcommit",
      "gitignore",

      -- Lua (Neovim config)
      "lua",
      "luadoc",
      "luap",
      "vim",
      "vimdoc",
      "query",

      -- Python
      "python",

      -- Go
      "go",
      "gomod",
      "gosum",
      "gowork",

      -- JavaScript / TypeScript / React / Tailwind
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",

      -- Config formats
      "json",
      "json5",
      "jsonc",
      "yaml",
      "toml",

      -- Docs
      "markdown",
      "markdown_inline",
    },
    auto_install = true,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<cr>", -- set to `false` to disable one of the mappings
        node_incremental = "<cr>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
