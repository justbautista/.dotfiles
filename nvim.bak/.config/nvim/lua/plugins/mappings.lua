return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- removes highlights on hlsearch
          ["<esc>"] = { ":nohlsearch<enter>", silent = true },

          -- select all
          ["<leader>a"] = { "ggVG", desc = "select [a]ll" },

          -- tabs
          ["<A-tab>"] = { "<C-6>", desc = "alt tab" },
          ["<tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "next buffer" },
          ["<S-tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "previous buffer" },

          -- no cutting single character
          ["x"] = { '"_x', desc = "delete char without saving in register" },
        },
        v = {
          -- paste without cutting selected
          ["<leader>p"] = { '"_dP', desc = "[p]aste over selected without saving to register" },

          -- move lines
          ["J"] = { ":m '>+1<enter>gv=gv", desc = "move selection down", silent = true },
          ["K"] = { ":m '<-2<enter>gv=gv", desc = "move selection up", silent = true },
        },
      },
    },
  },
}
