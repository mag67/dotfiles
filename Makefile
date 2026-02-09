DOTFILES_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PACKAGES := zsh git nvim zellij wezterm mise gh claude codex lazygit

.PHONY: install stow restow unstow update nvim-sync

# 初回セットアップ
install:
	./bootstrap.sh

# 全パッケージをリンク
stow:
	@for pkg in $(PACKAGES); do \
		echo "Stow: $$pkg"; \
		stow --target=$(HOME) $$pkg; \
	done

# 全パッケージを再リンク
restow:
	@for pkg in $(PACKAGES); do \
		echo "Restow: $$pkg"; \
		stow --restow --target=$(HOME) $$pkg; \
	done

# 全リンクを解除
unstow:
	@for pkg in $(PACKAGES); do \
		echo "Unstow: $$pkg"; \
		stow --delete --target=$(HOME) $$pkg; \
	done

# Brewfile からパッケージを更新
update:
	brew update && brew bundle --file=$(DOTFILES_DIR)/Brewfile

# Neovim プラグインを同期
nvim-sync:
	nvim --headless "+Lazy! sync" +qa
