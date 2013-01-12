#!/bin/sh

git submodule update --recursive

ln -s $PWD/vim $HOME/.vim
ln -s $PWD/vim/vimrc $HOME/.vimrc

cp -R $PWD/zsh-custom/* $PWD/zsh
ln -s $PWD/zsh $HOME/.zsh
ln -s $PWD/zsh/zshrc $HOME/.zshrc
