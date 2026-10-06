return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Git diff (new tab)" },
    { "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "File history (new tab)" },
    { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Close diffview tab" },
  },
}
