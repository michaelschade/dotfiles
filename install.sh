#!/bin/sh

git submodule update --init --recursive

ln -nsf $PWD/tmux $HOME/.tmux
ln -nsf $PWD/tmux/tmux.conf $HOME/.tmux.conf

# setup vim
brew install ctags-exuberant the_silver_searcher
$PWD/vim/bundle/YouCompleteMe/install.sh --clang-completer
ln -nsf $PWD/vim $HOME/.vim
ln -nsf $PWD/vim/vimrc $HOME/.vimrc
mkdir -p $HOME/.vimswap

# setup zsh
ln -nsf $PWD/zsh-custom $HOME/.zsh-custom
ln -nsf $PWD/zsh-custom/zshrc $HOME/.zshrc
ln -nsf $PWD/zsh $HOME/.zsh

ln -nsf $PWD/Xresources $HOME/.Xresources
