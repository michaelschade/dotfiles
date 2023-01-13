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
export EDITOR='code'
export GOPATH=$HOME/Dropbox/code/go
export MYGO=$GOPATH/src/github.com/michaelschade
export PATH="/usr/local/bin \
           :$PATH \
           :$HOME/node_modules/.bin \
           :$HOME/.rvm/bin \
           :$HOME/.cargo/bin \
           :$GOPATH/bin \
           :/usr/local/opt/libpq/bin \
           "
export PATH=`echo $PATH | sed -E 's/ *//g'`
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
eval "$(/opt/homebrew/bin/brew shellenv)"

[[ $TMUX = "" ]] && export TERM="xterm-256color"

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nvm
# export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# some nice little alias tweaks
alias ls='ls -G'
alias bi='bundle install'
alias be='bundle exec'
alias gg='git grep'
alias hack='nethack'
alias pip='pip3'
alias python='python3'
alias x86brew='/usr/local/bin/brew'
if [ `uname` = "Darwin" ]; then
  alias vim='nvim'
fi

# electron
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig"

# other
alias excelsior="ssh michael@excelsior"

