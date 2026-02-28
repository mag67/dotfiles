local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ===== OS判定 =====
local is_windows = wezterm.target_triple:find('windows') ~= nil
local is_macos = wezterm.target_triple:find('darwin') ~= nil

-- ===== WSL2連携（Windows のみ） =====
if is_windows then
  config.default_domain = 'WSL:Ubuntu-24.04'
end

-- ===== フォント =====
-- JetBrains Mono Nerd Font（Nerd Font Symbols 内蔵フォールバックあり）
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = is_macos and 14.0 or 11.0

-- ===== カラースキーム =====
-- Neovim LazyVim のデフォルトと統一
config.color_scheme = 'Tokyo Night'

-- ===== ウィンドウ =====
config.window_decorations = 'TITLE | RESIZE'
config.window_padding = { left = 4, right = 4, top = 4, bottom = 4 }
-- tmux でセッション管理するので WezTerm のタブバーは非表示
config.enable_tab_bar = false

-- ===== パフォーマンス =====
config.front_end = 'OpenGL'
config.max_fps = 120
config.scrollback_lines = 5000

-- ===== カーソル =====
config.default_cursor_style = 'SteadyBlock'

-- ===== IME（日本語入力） =====
config.use_ime = true

-- ===== Neovim互換 =====
config.use_dead_keys = false

-- ===== キーバインド =====
-- tmux prefix (Ctrl+a) との干渉を防ぐため、
-- WezTerm のデフォルトキーバインドを無効化
config.disable_default_key_bindings = true
config.keys = {
  -- コピー・ペースト（Ctrl+Shift+C/V）
  { key = 'C', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo('Clipboard') },
  { key = 'V', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom('Clipboard') },
  -- フォントサイズ調整
  { key = '+', mods = 'CTRL|SHIFT', action = wezterm.action.IncreaseFontSize },
  { key = '-', mods = 'CTRL',       action = wezterm.action.DecreaseFontSize },
  { key = '0', mods = 'CTRL',       action = wezterm.action.ResetFontSize },
  -- フルスクリーン
  { key = 'F11', action = wezterm.action.ToggleFullScreen },
}

return config
