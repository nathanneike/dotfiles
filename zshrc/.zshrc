plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

if [[ -n "${ZSH:-}" && -f "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

alias resource="source ~/.zshrc"
alias docker-compose="docker compose"

alias c="clear"
alias web="browsh"

if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never"
fi

if command -v eza >/dev/null 2>&1; then
  alias la='eza -la --git --group-directories-first'
  alias ll='eza -l --git --group-directories-first'
  alias tree='eza --tree'
fi

if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
fi

[ -f ~/.zshrc.private ] && source ~/.zshrc.private
