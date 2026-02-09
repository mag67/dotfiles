return {
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      { "<leader>-", "<cmd>Yazi<cr>", desc = "Yazi: カレントファイルで開く" },
      { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Yazi: 作業ディレクトリで開く" },
    },
    opts = {
      open_for_directories = true,
    },
  },
}
