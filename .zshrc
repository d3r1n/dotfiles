source $HOME/antigen.zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH

antigen use oh-my-zsh

antigen bundle git

antigen bundle reobin/typewritten@main

export PATH=$HOME/.cargo/bin:$PATH

antigen apply

eval "$(zoxide init zsh)"

alias cd='z'

alias vim='nvim'
alias vi='nvim'
alias v='nvim'

alias n='nnn'