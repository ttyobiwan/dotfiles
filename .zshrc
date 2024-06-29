if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

# ohmyzsh
source $ZSH/oh-my-zsh.sh

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# neovim
export EDITOR="nvim"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# go
export PATH=$PATH:/usr/local/go/bin

# pyenv
eval "$(pyenv init -)"

# aliases
alias gs="git status"
alias ga="git add ."
alias gc="git commit"
alias gph="git push"
alias gpl="git pull"
alias ds="sudo systemctl start docker"
alias va="source .venv/bin/activate"
alias nv="nvim"
alias gt="go test ./..."
alias gtc="go test ./... -count=1"
alias gtcb="go test ./... -count=1 -bench=. -benchmem"
alias zel="zellij"

# fzf
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
