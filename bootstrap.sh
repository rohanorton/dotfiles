#!/usr/bin/env bash
set -e

function command_exists () {
    command -v "$1" >/dev/null;
}
function is_linux() {
    [[ $('uname') == 'Linux' ]];
}

function is_osx () {
    [[ $('uname') == 'Darwin' ]];
}

function install_ycm() {
    VIM_BUNDLE_DIR=$HOME/.vim/bundle

    if is_linux; then
        YMC_INSTALL_SUGGESTION="Some linux distros require python2.7-dev in order to build this"
    fi

    YCM_DIR=$VIM_BUNDLE_DIR/YouCompleteMe
    # Only runs if not already compiled
    if [ -d "$YCM_DIR" ] && [ ! -f "$YCM_DIR/python/ycm/__init__.pyc" ]; then
        cd $YCM_DIR
        ./install.sh --clang-completer || echo $YMC_INSTALL_SUGGESTION && exit 1
    fi
}

function install_tern_for_vim() {
    TERN_DIR=$VIM_BUNDLE_DIR/tern_for_vim
    if [ -d "$TERN_DIR" ] && command_exists npm; then
        cd $TERN_DIR
        npm install
    fi
}

function install_ctrlp_cmatcher() {
    CMATCHER_DIR=$VIM_BUNDLE_DIR/ctrlp-cmatcher
    if [ -d "$CMATCHER_DIR" ]; then
        cd $CMATCHER_DIR
        ./install.sh
    fi
}

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

    vim +PluginInstall +qall

    # Extra steps in vim module installation...
    install_ycm
    install_tern_for_vim
    install_ctrlp_cmatcher
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
unset install_ycm;
unset install_tern_for_vim;
unset install_ctrlp_cmatcher;
