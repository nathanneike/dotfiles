alias resource="source ~/.bashrc"
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

export PATH="$HOME/.local/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi

if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

[ -f ~/.bashrc.private ] && source ~/.bashrc.private
