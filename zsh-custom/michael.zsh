#!/bin/zsh

# history configuration
HISTFILE=~/.history
HISTSIZE=5000
SAVEHIST=10000
setopt incappendhistory sharehistory histsavenodups

# various little options
setopt autocd correct hashcmds autolist automenu
setopt extendedglob nomatch autoparamslash
setopt interactivecomments noclobber
unsetopt beep notify hup
bindkey -e

# fancy autocompletion
autoload -U compinit && compinit

# basic environment variables
export PGUSER=postgres
export PGPASSWORD=postgres
export EDITOR='vim'
export GOPATH=$HOME/Dropbox/code/go
export MYGO=$GOPATH/src/github.com/michaelschade
export PATH="$PATH \
           :$HOME/node_modules/.bin \
           :$HOME/.rvm/bin \
           :$HOME/.cargo/bin \
           :/usr/local/lib/python3.5/site-packages \
           :$GOPATH/bin \
           :/usr/local/opt/libpq/bin \
           "
export PATH=`echo $PATH | sed -E 's/ *//g'`
source $HOME/.ghcup/env
[[ $TMUX = "" ]] && export TERM="xterm-256color"

# Python setup
export PIPENV_VENV_IN_PROJECT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# nvm
# export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# some nice little alias tweaks
alias ls='ls -G'
alias bi='bundle install'
alias be='bundle exec'
alias gg='git grep'
alias python='python3'
alias hack='nethack'
if [ `uname` = "Darwin" ]; then
  alias vim='mvim -v'
fi

# electron
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig"

# other
alias excelsior="ssh michael@excelsior"

