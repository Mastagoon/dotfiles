return {
  -- add symbols-outline
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<C-e>", "<cmd>Telescope find_files<cr>", desc = "Find Files"
      },
      {
        "<C-f>",
        "<cmd>Telescope live_grep<cr>",
        desc = "Live Grep",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<C-a>", "<cmd>Neotree<cr>", desc = "Open neotree" },
      { "<C-b>", "<cmd>Neotree toggle<cr>", desc = "Open neotree" },
    },
  },
}
