#!/bin/bash

alias v=nvim
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
export LESS='-R'
export MANPAGER="less $LESS"
export MANROFFOPT="-P -c"
export EDITOR="nvim"
export visual="vim"
alias ls="exa"
alias mommy="cargo mommy"
alias cd="z"
export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

export RUSTC_WRAPPER="$(which sccache)"

eval "$(zoxide init bash)"

alias echo-mic="pactl load-module module-loopback latency_msec=200 source=alsa_input.pci-0000_03_00.6.analog-stereo sink=alsa_output.pci-0000_03_00.6.analog-stereo"
alias echo-mic-off="pactl unload-module module-loopback"

# pnpm
export PNPM_HOME="/home/logemi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export STARSHIP_LOG="error"
eval "$(starship init bash)"
color=$(tput setaf 4)
echo -e "${color}Welcome :3${color}"

export PATH="$HOME/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$PATH:/home/logemi/.local/bin"

