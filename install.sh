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
}

install_packages_linux() {
  sudo apt-get install vim cmake exuberant-ctags silversearcher-ag
}

create_symlinks() {
  ln -nsf $PWD/gitconfig $HOME/.gitconfig_dotfiles
  ln -nsf $PWD/tmux $HOME/.tmux
  ln -nsf $PWD/tmux/tmux.conf $HOME/.tmux.conf
  ln -nsf $PWD/vim $HOME/.vim
  ln -nsf $PWD/vim/vimrc $HOME/.vimrc
  ln -nsf $PWD/vim $HOME/.config/nvim
  ln -nsf $PWD/nvim/init.vim $HOME/.config/nvim/init.vim
  ln -nsf $PWD/zsh-custom $HOME/.zsh-custom
  ln -nsf $PWD/zsh-custom/zshrc $HOME/.zshrc_dotfiles
  ln -nsf $PWD/zsh $HOME/.zsh
  ln -nsf $PWD/Xresources $HOME/.Xresources
}

# Make a private ~/.gitconfig that sources dotfiles, so the laptop can have
# private gitconfig in the root without committing it
create_gitconfig() {
  GITCONFIG_CUSTOM='~/.gitconfig_dotfiles'
  [ -f ~/.gitconfig ] || touch ~/.gitconfig
  if ! grep -q "path = $GITCONFIG_CUSTOM" ~/.gitconfig; then
    echo "[include]" >> ~/.gitconfig
    echo "  path = $GITCONFIG_CUSTOM" >> ~/.gitconfig
  fi
}

# We want a private ~/.zshrc so we can add sensitive environment variables
# there without them being synced back to dotfiles
create_zshrc() {
  ZSHRC_CUSTOM='$HOME/.zshrc_dotfiles'
  [ -f ~/.zshrc ] || touch ~/.zshrc
  grep -qxF "source $ZSHRC_CUSTOM" ~/.zshrc || echo "source $ZSHRC_CUSTOM" >> ~/.zshrc
}

setup_vimproc() {
  pushd $PWD/vim/bundle/vimproc
  make
  popd
}

create_directories() {
  mkdir -p $HOME/.vimswap
  mkdir -p $HOME/.config
}

install_vscode_extensions() {
  code --install-extension ms-vscode.js-debug-companion
  code --install-extension esbenp.prettier-vscode
  code --install-extension spywhere.guides
  code --install-extension kamikillerto.vscode-colorize
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-vscode-remote.remote-containers
  code --install-extension msjsdiag.vscode-react-native
  code --install-extension ms-toolsai.vscode-jupyter-cell-tags
  code --install-extension ms-toolsai.jupyter-keymap
  code --install-extension ms-toolsai.vscode-jupyter-slideshow
  code --install-extension ms-toolsai.jupyter-renderers
  code --install-extension ms-toolsai.jupyter
  code --install-extension ms-python.pylint
  code --install-extension ryuta46.multi-command
  code --install-extension ms-python.isort
  code --install-extension ms-python.python
  code --install-extension ms-python.vscode-pylance
  code --install-extension usernamehw.errorlens
  code --install-extension github.copilot-chat
  code --install-extension github.copilot
  code --install-extension rust-lang.rust-analyzer
  code --install-extension eamodio.gitlens
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

# Init home dir
create_directories
create_symlinks
create_zshrc
create_gitconfig

# Setup vimproc for typescript
setup_vimproc

# Install VSCode extensions if code is setup
if type code > /dev/null 2>&1; then
  install_vscode_extensions
fi

git submodule update --recursive --remote
