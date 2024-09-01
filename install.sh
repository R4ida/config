#!/bin/bash

# link all of the files from homedir to ~/home and configdir to ~/.config

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

pushd "$SCRIPT_DIR"

./ln_dir2dir.py homedir "$HOME/"
./ln_dir2dir.py configdir "$HOME/.config/"

# install vim plugged into correct directories
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

if [[ ! -f ".git-prompt.sh" ]]; then
    curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' --output '.git-prompt.sh'
fi


popd
