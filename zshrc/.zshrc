plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias resource="source ~/.zshrc"
alias docker-compose="docker compose"
alias cat="bat --paging=never"

#eza aliases for nicer lsing :)
alias la='eza -la --git --group-directories-first'
alias ll='eza -l --git --group-directories-first'
alias tree='eza --tree'
alias c="clear"
alias web="browsh"

export PATH="/opt/homebrew/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(zoxide init zsh)"
eval "$(pyenv init - zsh)"

[ -f ~/.zshrc.private ] && source ~/.zshrc.private

