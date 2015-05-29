#!/usr/bin/env bash
set -e

function link_dotfiles() {
    PROJECT_ROOT="$(dirname "${BASH_SOURCE}")"
    DOTFILES_ROOT=$PROJECT_ROOT/dots
    cd "$DOTFILES_ROOT"
    DOTFILES_ROOT=`pwd` # ensures absolute path
    DOTS=`find "$DOTFILES_ROOT" -maxdepth 1 ! -path "$DOTFILES_ROOT" `

    for src in $DOTS; do
        dst="$HOME/$(basename "$src")"
        if [ -d "$dst" ] && [ ! -L "$dst" ]; then
            # if there already is a directory, and it isn't a symlink
            # it needs to be removed before a symlink can be created
            mv $dst $dst.bak
        fi
        # if the directory still exists this means that it is already a symlink
        # or something went wrong, so we shouldn't really try and add another.
        if [ ! -d "$dst" ]; then
            ln -sf $src $dst
        fi
    done

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
}


git pull origin master;
git submodule update --init --recursive;

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    link_dotfiles
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        link_dotfiles
    fi
fi

unset link_dotfiles;
