#!/bin/sh

check_dependency() {
  if ! [ -x "$(command -v $1)" ]; then
    return 1
  else
    return 0
  fi
}

install_brew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

install_packages_darwin() {
  brew install cmake ctags-exuberant the_silver_searcher neovim tmux node libpq jq
  brew install pyenv pyenv-virtualenv
}

install_packages_linux() {
  sudo apt-get install vim cmake exuberant-ctags silversearcher-ag
}

create_symlinks() {
  ln -nsf $PWD/gitconfig $HOME/.gitconfig
  ln -nsf $PWD/tmux $HOME/.tmux
  ln -nsf $PWD/tmux/tmux.conf $HOME/.tmux.conf
  ln -nsf $PWD/vim $HOME/.vim
  ln -nsf $PWD/vim/vimrc $HOME/.vimrc
  ln -nsf $PWD/vim $HOME/.config/nvim
  ln -nsf $PWD/vscode/User/*.json $HOME/.vscode/User
  ln -nsf $PWD/vscode/extensions/*.json $HOME/.vscode/extensions
  ln -nsf $PWD/nvim/init.vim $HOME/.config/nvim/init.vim
  ln -nsf $PWD/zsh-custom $HOME/.zsh-custom
  ln -nsf $PWD/zsh-custom/zshrc $HOME/.zshrc
  ln -nsf $PWD/zsh $HOME/.zsh
  ln -nsf $PWD/Xresources $HOME/.Xresources
}

setup_vimproc() {
  pushd $PWD/vim/bundle/vimproc
  make
  popd
}

create_directories() {
  mkdir -p $HOME/.vimswap
  mkdir -p $HOME/.config
  mkdir -p $HOME/.vscode/User
  mkdir -p $HOME/.vscode/extensions
}

# Ensure dependencies are installed
check_dependency brew || install_brew
check_dependency git || brew install git

# Install packages based on OS
if [ "$(uname)" = "Darwin" ]; then
  install_packages_darwin
else
  install_packages_linux
fi

# Create required directories
create_directories

# Create symbolic links for configuration files
create_symlinks

# Setup vimproc for typescript
setup_vimproc

git submodule update --recursive --remote
