-- Neovim ウィンドウと Zellij ペイン間を Ctrl+hjkl でシームレスに移動
return {
  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>", { silent = true, desc = "左へ移動" } },
      { "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "下へ移動" } },
      { "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "上へ移動" } },
      { "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "右へ移動" } },
    },
    opts = {},
  },
}
