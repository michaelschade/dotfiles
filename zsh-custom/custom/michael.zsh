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
export PATH="$PATH \
           :/usr/local/sbin \
           :$HOME/.bin \
           :$HOME/Library/Haskell/bin \
           :$HOME/node_modules/.bin \
           "
export TERM='xterm-256color'

# some nice little alias tweaks
alias ls='ls -G'
alias bi='bundle install'
alias be='bundle exec'
alias gg='git grep'
if [ `uname` = "Darwin" ]; then
  alias vim='mvim -v'
fi

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH=$PATH:$HOME/.usr/bin
export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/site-packages/
export EDITOR=/usr/bin/vim

# No spaces (easy pretty printing, and I don't use spaces in dir names anyway)
export PATH=`echo $PATH | sed -E 's/ *//g'`
