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
autoload -U compinit && compinit -C

# Environment variables
export PGUSER=postgres
export PGPASSWORD=postgres
export EDITOR='code'
export GOPATH=$HOME/Dropbox/code/go
export MYGO=$GOPATH/src/github.com/michaelschade

# PATH configuration
path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$GOPATH/bin"
  "$HOME/node_modules/.bin"
  "$HOME/.rvm/bin"
  "/usr/local/opt/libpq/bin"
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  "$HOME/.yarn/bin"
  "$HOME/.config/yarn/global/node_modules/.bin"
  "/usr/local/bin"
  $path
)

# Concatenate PATHs, accounting for directories with spaces
oldIFS=$IFS
IFS=":"
export PATH="${path[*]}"
IFS=$oldIFS

# Initialize Homebrew. Some of my environments require running in an x86
# environment. ARCH_OVERRIDE="x86" *must* be set in ~/.zshrc *before* the
# dotfile zshrc is sourced.
if [ "$ARCH_OVERRIDE" = "x86" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Terminal configuration
[[ $TMUX = "" ]] && export TERM="xterm-256color"

# Aliases
alias ls='ls -G'
alias bi='bundle install'
alias be='bundle exec'
alias gg='git grep'
alias hack='nethack'
fglg () {git log --color --oneline $@ | fzf --ansi --reverse --no-sort --preview 'git show --color {1}' | pyp 'x.split()[0]'}
alias pip='python -m pip'
alias x86brew='/usr/local/bin/brew'
alias tree='tree --gitignore'
alias tp='tree |pbcopy && echo "Tree copied to clipboard"'
if [ `uname` = "Darwin" ]; then
  alias vim='nvim'
fi

# Electron configuration
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig"

#################
#   NVM SETUP   #
#################

export NVM_DIR="$HOME/.nvm"

# nvm.sh is quite slow, so we lazily invoke it in shells. But we still need
# node in the PATH for stuff like nvim plugins, so load in a default node
# then lazy load in interactive shells.

resolve_node_version() {
  local ALIAS=$(cat $NVM_DIR/alias/default)
  if [[ $ALIAS == "node" ]]; then
    NODE_VERSION=$(ls -1 $NVM_DIR/versions/node/ | sort -V | tail -n 1)
  else
    NODE_VERSION=$ALIAS
  fi
  echo $NODE_VERSION
}
NODE_VERSION=$(resolve_node_version)
NODE_DIR="$NVM_DIR/versions/node/$NODE_VERSION/bin"
export PATH="$NODE_DIR:$PATH"

# Lazy loaders

nvm() {
  unset -f nvm node npm
  . "$NVM_DIR/nvm.sh"
  nvm "$@"
}

node() {
  unset -f nvm node npm
  . "$NVM_DIR/nvm.sh"
  node "$@"
}

npm() {
  unset -f nvm node npm
  . "$NVM_DIR/nvm.sh"
  npm "$@"
}

#################
# END NVM SETUP #
#################

# SSH aliases
alias excelsior="ssh michael@excelsior"
