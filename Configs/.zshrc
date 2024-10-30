#!/bin/zsh

QVIM="nvim -u '$HOME/.config/nvim/lua/rawinit.lua'"
alias qvim=$QVIM
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
export LESS='-R'
alias ls='ls --color=auto'
export MANPAGER="less $LESS"
export MANROFFOPT="-P -c"
alias pacman='pacman --color=auto'
export EDITOR="nvim"
export visual="vim"
alias ls="exa"
alias cat="bat"
alias car="cat"
#alias cargo="cargo mommy"
alias icat="kitten icat"

export PATH="$HOME/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$PATH:/home/logemi/.local/bin"

# pnpm
export PNPM_HOME="/home/logemi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

if [[ -o interactive ]]; then
    export STARSHIP_LOG="error"
    eval "$(starship init zsh)"

    # shell is interactive
    hyfetch

    green=$(tput setaf 2)
    white=$(tput setaf 7)
    echo -e "${green}Welcome :3${green}"
fi

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
