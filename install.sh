#!/bin/sh

if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if ! [ -x "$(command -v git)" ]; then
  brew install git
fi

git submodule update --recursive --remote

ln -nsf $PWD/tmux $HOME/.tmux
ln -nsf $PWD/tmux/tmux.conf $HOME/.tmux.conf

# setup vim
if [ `uname` = "Darwin" ]; then
  brew install cmake ctags-exuberant the_silver_searcher neovim
else
  sudo apt-get install vim cmake exuberant-ctags silversearcher-ag
fi

if [ `uname` = "Darin" ]; then
  brew install pyenv pyenv-virtualenv
fi

# vimproc for typescript
pushd $PWD/vim/bundle/vimproc
make
popd

ln -nsf $PWD/vim $HOME/.vim
ln -nsf $PWD/vim/vimrc $HOME/.vimrc
mkdir -p $HOME/.vimswap
mkdir -p $HOME/.config
ln -nsf $PWD/vim $HOME/.config/nvim
ln -nsf $PWD/nvim/init.vim $HOME/.config/nvim/init.vim

# setup zsh
ln -nsf $PWD/zsh-custom $HOME/.zsh-custom
ln -nsf $PWD/zsh-custom/zshrc $HOME/.zshrc
ln -nsf $PWD/zsh $HOME/.zsh

ln -nsf $PWD/Xresources $HOME/.Xresources
