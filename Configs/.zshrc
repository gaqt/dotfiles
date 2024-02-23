# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/logemi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source "$HOME/.themerc"

context() {
  if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    echo "%F{$COLOR3}%n@%m"
  fi
}

dir() {
  echo "%B%F{$COLOR1}%~%b"
}

status() {
  local -a symbols

  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && printf "$symbols"
}

# PROMPT="%{%f%b%k%}$(context) $(dir) $(status)
# %B::%{%f%b%k%} "

eval "$(starship init zsh)"

QVIM="nvim -u '$HOME/.config/nvim/lua/rawinit.lua'"
alias qvim=$QVIM

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
export LESS='-R --use-color -Dd+r$Du+b$'
alias ls='ls --color=auto'
export MANPAGER="less $LESS"
export MANROFFOPT="-P -c"
alias pacman='pacman --color=auto'
export EDITOR="nvim"
export visual="vim"



zmodload zsh/zpty

pty() {
	zpty pty-${UID} ${1+$@}
	if [[ ! -t 1 ]];then
		setopt local_traps
		trap '' INT
	fi
	zpty -r pty-${UID}
	zpty -d pty-${UID}
}

ptyless() {
	pty $@ | less
}


export PATH="$HOME/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
