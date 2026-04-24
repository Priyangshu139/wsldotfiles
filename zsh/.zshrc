# ===============================
# ⚡ ZINIT LOAD
# ===============================
source ~/.local/share/zinit/zinit.git/zinit.zsh

# ===============================
# ⚡ COMPLETIONS FIRST
# ===============================
autoload -Uz compinit add-zsh-hook
compinit
zinit cdreplay -q

# ===============================
# ⚡ PLUGINS (LAZY LOADED)
# ===============================

# Autosuggestions
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

# Completions
zinit ice wait lucid
zinit light zsh-users/zsh-completions

# fzf-tab
zinit ice wait lucid
zinit light Aloxaf/fzf-tab

# Syntax highlighting (MUST BE LAST)
zinit ice wait lucid atload"zicompinit; zicdreplay"
zinit light zsh-users/zsh-syntax-highlighting

# ===============================
# ⚡ OMZ SNIPPETS
# ===============================
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx

# ===============================
# ⚡ HISTORY
# ===============================
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# ===============================
# ⚡ KEYBINDINGS
# ===============================
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ===============================
# ⚡ COMPLETION STYLING
# ===============================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always $realpath'

# ===============================
# ⚡ TOOLS
# ===============================
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always $realpath'

# ===============================
# ⚡ STARSHIP PROMPT
# ===============================
eval "$(starship init zsh)"

# ===============================
# ⚡ ZINIT ANNEXES
# ===============================
zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust

# ===============================
# ⚡ ALIASES
# ===============================

# eza as ls
alias ls="eza --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first"

# bat instead of cat
alias cat="bat"

# ===============================
# ⚡ SUFFIX ALIASES
# ===============================
alias -s json="bat"
alias -s md="bat"
alias -s log="bat"
alias -s txt="bat"

alias -s rs="nvim"
alias -s py="nvim"
alias -s js="nvim"
alias -s ts="nvim"
alias -s toml="nvim"
alias -s yaml="nvim"
alias -s yml="nvim"

# ===============================
# ⚡ AUTO LS ON DIRECTORY CHANGE
# ===============================
auto_ls() {
  # Avoid lag in huge folders
  if [[ $(command ls | wc -l) -lt 100 ]]; then
    eza --icons --group-directories-first
  fi
}

add-zsh-hook chpwd auto_ls

# Run once on shell start
auto_ls

# ===============================
# ⚡ PYTHON VENV AUTO ACTIVATE
# ===============================
python_hook() {
  if [[ -f ".venv/bin/activate" ]]; then
    source .venv/bin/activate
  fi
}
add-zsh-hook chpwd python_hook

# ===============================
# ⚡ ENV
# ===============================
export EDITOR="nvim"
export BAT_THEME="Dracula"
export PATH="$HOME/.tmuxifier/bin:$PATH"
DISABLE_AUTO_TITLE="true"
