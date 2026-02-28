-- Neovim ウィンドウと tmux ペイン間を Ctrl+hjkl でシームレスに移動
return {
  {
    "mrjones2014/smart-splits.nvim",
    version = ">=1.0.0",
    lazy = false,
    keys = {
      { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "左へ移動" },
      { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "下へ移動" },
      { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "上へ移動" },
      { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "右へ移動" },
      { "<A-h>", function() require("smart-splits").resize_left() end, desc = "左リサイズ" },
      { "<A-j>", function() require("smart-splits").resize_down() end, desc = "下リサイズ" },
      { "<A-k>", function() require("smart-splits").resize_up() end, desc = "上リサイズ" },
      { "<A-l>", function() require("smart-splits").resize_right() end, desc = "右リサイズ" },
    },
  },
}
