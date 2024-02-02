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

PROMPT="%{%f%b%k%} $(context) $(dir) $(status)
 %B::%{%f%b%k%} "
