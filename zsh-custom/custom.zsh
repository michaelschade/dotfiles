# History configuration
HISTFILE=~/.history
HISTSIZE=5000
SAVEHIST=10000
setopt incappendhistory sharehistory histsavenodups

# General options
setopt autocd correct hashcmds autolist automenu
setopt extendedglob nomatch autoparamslash
setopt interactivecomments noclobber
unsetopt beep notify hup
bindkey -e

# Autocompletion
autoload -U compinit && compinit

# Environment variables
export PGUSER=postgres
export PGPASSWORD=postgres
export EDITOR='code'
export GOPATH=$HOME/Dropbox/code/go
export MYGO=$GOPATH/src/github.com/michaelschade
export PYENV_ROOT="$HOME/.pyenv"

# pyenv setup
eval "$(pyenv init -)"

# PATH configuration
path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$GOPATH/bin"
  "$HOME/node_modules/.bin"
  "$HOME/.rvm/bin"
  "/usr/local/opt/libpq/bin"
  "$PYENV_ROOT/bin"
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  "$HOME/.yarn/bin"
  "$HOME/.config/yarn/global/node_modules/.bin"
  "/usr/local/bin"
  $path
)
export PATH=$(echo $path | tr ' ' ':')

# Homebrew configuration for M1 Macs
eval "$(/opt/homebrew/bin/brew shellenv)"

# Terminal configuration
[[ $TMUX = "" ]] && export TERM="xterm-256color"

# Aliases
alias ls='ls -G'
alias bi='bundle install'
alias be='bundle exec'
alias gg='git grep'
alias hack='nethack'
alias python='python3'
alias pip='python -m pip'
alias x86brew='/usr/local/bin/brew'
alias tree='tree --gitignore'
alias tp='tree |pbcopy && echo "Tree copied to clipboard"'
if [ `uname` = "Darwin" ]; then
  alias vim='nvim'
fi

# Electron configuration
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig"

# SSH aliases
alias excelsior="ssh michael@excelsior"
