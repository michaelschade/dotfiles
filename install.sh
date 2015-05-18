#!/bin/sh

git submodule update --init --recursive

ln -fs $PWD/tmux $HOME/.tmux
ln -fs $PWD/tmux/tmux.conf $HOME/.tmux.conf

# setup vim
brew install ctags-exuberant
$PWD/vim/bundle/YouCompleteMe/install.sh --clang-completer
ln -fs $PWD/vim $HOME/.vim
ln -fs $PWD/vim/vimrc $HOME/.vimrc

# setup zsh
cp -R $PWD/zsh-custom/* $PWD/zsh
ln -fs $PWD/zsh $HOME/.zsh
ln -fs $PWD/zsh/zshrc $HOME/.zshrc

ln -fs $PWD/Xresources $HOME/.Xresources
