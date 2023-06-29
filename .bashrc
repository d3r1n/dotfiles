#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export WLR_NO_HARDWARE_CURSORS=1

[ "$(tty)" = "/dev/tty1" ] && exec sway

# Starship
eval "$(starship init bash)"

# Zoxide
eval "$(zoxide init bash)"

# pnpm
export PNPM_HOME="/home/d3r1n/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end