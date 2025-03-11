#!/bin/zsh

QVIM="nvim -u '$HOME/.config/nvim/lua/rawinit.lua'"
alias qvim=$QVIM
alias v=nvim
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
export LESS='-R'
export MANPAGER="less $LESS"
export MANROFFOPT="-P -c"
alias pacman='pacman --color=auto'
alias paru='paru --color=auto'
export EDITOR="nvim"
export visual="vim"
alias ls="exa"
# alias cat="bat"
# alias car="cat"
alias cargo="cargo mommy"

alias echo-mic="pactl load-module module-loopback latency_msec=200 source=alsa_input.pci-0000_03_00.6.analog-stereo sink=alsa_output.pci-0000_03_00.6.analog-stereo"
alias echo-mic-off="pactl unload-module module-loopback"

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
    # hyfetch

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


# bun completions
[ -s "/home/logemi/.bun/_bun" ] && source "/home/logemi/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/zig-linux-x86_64-0.13.0:$PATH"

[ -f "/home/logemi/.ghcup/env" ] && . "/home/logemi/.ghcup/env" # ghcup-env
