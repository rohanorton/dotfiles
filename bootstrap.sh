#!/usr/bin/env bash

# based on mathiasbynens bootstrap script:
# https://github.com/mathiasbynens/dotfiles

PROJECT_ROOT="$(dirname "${BASH_SOURCE}")"
DOTFILES_ROOT=$PROJECT_ROOT/dots
cd "$DOTFILES_ROOT"
DOTFILES_ROOT=`pwd` # ensures absolute path
DOTS=`find "$DOTFILES_ROOT" ! -path "$DOTFILES_ROOT" -maxdepth 1`

git pull origin master;
git submodule update;

function link_dotfiles() {
    for src in $DOTS 
    do
        dst="$HOME/$(basename "$src")"
        ln -sf $src $dst
    done

    if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    vim +PluginInstall +qall
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    link_dotfiles;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        link_dotfiles;
    fi;
fi;
unset link_dotfiles;
