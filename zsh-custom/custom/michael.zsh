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
export EDITOR='vim'
export TERM='xterm-256color'
export GOPATH=$HOME/Dropbox/code/go
export MYGO=$GOPATH/src/github.com/michaelschade
export PATH="$PATH \
           :$HOME/node_modules/.bin \
           :$HOME/.rvm/bin \
           :$GOPATH/bin
           "
export PATH=`echo $PATH | sed -E 's/ *//g'`

# some nice little alias tweaks
alias ls='ls -G'
alias bi='bundle install'
alias be='bundle exec'
alias gg='git grep'
if [ `uname` = "Darwin" ]; then
  alias vim='mvim -v'
fi
