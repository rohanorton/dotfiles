#!/usr/bin/env bash

set -e

PROJECT_ROOT="$(dirname "${BASH_SOURCE}")"
DOTFILES_ROOT=$PROJECT_ROOT/dots
cd "$DOTFILES_ROOT"
DOTFILES_ROOT=`pwd` # ensures absolute path
DOTS=`find "$DOTFILES_ROOT" -maxdepth 1 ! -path "$DOTFILES_ROOT" `

git pull origin master;
git submodule update;

function link_dotfiles() {
    for src in $DOTS
    do
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

    if [ ! -d ~/.vim/bundle/Vundle.vim/.git ]; then
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    vim +PluginInstall +qall

    # Extra steps in vim module installation...

    BUNDLE=$HOME/.vim/bundle

    YCM_DIR=$BUNDLE/YouCompleteMe
    # Only runs if not already compiled
    if [ -d "$YCM_DIR" ] && [ ! -f "$YCM_DIR/python/ycm/__init__.pyc" ]; then
        cd ~/.vim/bundle/YouCompleteMe
        # ubuntu may require python2.7-dev in order to build this
        ./install.sh --clang-completer
    fi

    TERN_DIR=$BUNDLE/tern_for_vim
    if [ -d "$TERN_DIR" ] && command -v npm >/dev/null; then
        cd $TERN_DIR
        npm install
    fi

    CMATCHER_DIR=$BUNDLE/ctrlp-cmatcher
    if [ -d "$CMATCHER_DIR" ]; then
        cd $CMATCHER_DIR
        ./install.sh
    fi
}

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
