# My Arch/WSL Dotfiles

A minimal, blazing-fast terminal environment. Powered by Zsh, Tmux, LazyVim, and modern CLI utilities. 

## 🚀 One-Step Setup (New Machine)

Copy and paste this single command block into a fresh Arch/WSL terminal. It will install the system packages, pull the dotfiles, symlink your LazyVim and Tmux configurations, and launch your new environment instantly:

```bash
sudo pacman -Syu --noconfirm --needed arch-install-scripts base base-devel bat eza fd fzf git github-cli jq lazydocker lazygit less nano neovim ripgrep starship stow sudo tmux vim yazi zoxide zsh zsh-completions && \
git clone [https://github.com/](https://github.com/)<your-username>/dotfiles.git ~/.dotfiles && \
cd ~/.dotfiles && \
stow zsh tmux nvim tmuxifier git starship yazi && \
chsh -s $(which zsh) && \
exec zsh
