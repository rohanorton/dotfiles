#!/usr/bin/env bash

# based on mathiasbynens bootstrap script:
# https://github.com/mathiasbynens/dotfiles

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;
git submodule update;

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;

    if [ ! -d ~/.vim/bundle/Vundle.vim/.git ]; then
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    vim +PluginInstall +qall
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
