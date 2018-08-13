#!/bin/sh

git submodule update --init --recursive

ln -nsf $PWD/tmux $HOME/.tmux
ln -nsf $PWD/tmux/tmux.conf $HOME/.tmux.conf

# setup vim
if [ `uname` = "Darwin" ]; then
  brew install cmake ctags-exuberant the_silver_searcher
else
  sudo apt-get install vim cmake exuberant-ctags silversearcher-ag
fi
if [ "$WITHOUT_YCM" != 1 ]; then
  $PWD/vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang
else
  echo "Skipping YCM"
fi
ln -nsf $PWD/vim $HOME/.vim
ln -nsf $PWD/vim/vimrc $HOME/.vimrc
mkdir -p $HOME/.vimswap

# setup zsh
ln -nsf $PWD/zsh-custom $HOME/.zsh-custom
ln -nsf $PWD/zsh-custom/zshrc $HOME/.zshrc
ln -nsf $PWD/zsh $HOME/.zsh

ln -nsf $PWD/Xresources $HOME/.Xresources
