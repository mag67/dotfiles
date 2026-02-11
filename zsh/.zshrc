export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)

# autosuggestions の表示色（Tokyo Night テーマで視認性を確保）
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#565f89'

fpath=(~/.zsh/completions $fpath)

source $ZSH/oh-my-zsh.sh

# エディタ
export EDITOR='nvim'
export VISUAL='nvim'

# Homebrew
if [[ "$(uname -s)" == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -d /home/linuxbrew/.linuxbrew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# mise (ランタイムバージョンマネージャ)
command -v mise &>/dev/null && eval "$(mise activate zsh)"

# zoxide（ディレクトリ履歴ジャンプ）
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# fzf（ファジーファインダー）
command -v fzf &>/dev/null && eval "$(fzf --zsh)"

# WezTerm Shell Integration
[ -n "$WEZTERM_EXECUTABLE" ] && [ -f ~/.config/wezterm/wezterm.sh ] && source ~/.config/wezterm/wezterm.sh

# Zellij ヘルパー関数
function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function zri () { zellij run --name "$*" --in-place -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zei () { zellij edit --in-place "$*";}
function zpipe () {
  if [ -z "$1" ]; then
    zellij pipe;
  else
    zellij pipe -p "$1";
  fi
}
