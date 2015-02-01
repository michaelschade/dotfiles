#!/bin/sh

git submodule update --init --recursive

ln -s $PWD/tmux $HOME/.tmux
ln -s $PWD/tmux/tmux.conf $HOME/.tmux.conf

ln -s $PWD/vim $HOME/.vim
ln -s $PWD/vim/vimrc $HOME/.vimrc

cp -R $PWD/zsh-custom/* $PWD/zsh
ln -s $PWD/zsh $HOME/.zsh
ln -s $PWD/zsh/zshrc $HOME/.zshrc

ln -s $PWD/Xresources $HOME/.Xresources
