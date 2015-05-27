# ============= #
# Rohan's Zshrc #
# ============= #

source_existing() {
    [ -f "$1" ] && source "$1";
}

# exports should probably go early on (i.e. for things like paths)
source_existing $HOME/.sh_exports

# Antigen Plugin Manager
# source: https://github.com/zsh-users/antigen
source_existing $HOME/.zsh/antigen/antigen.zsh

# Eventually I will wean myself off using oh-my-zsh (I'm convinced it's a bit
# bloated), but unfortunately there are a lot of plugins which rely on it..
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES

    git
    git-extras
    zsh-users/zsh-completions src
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-syntax-highlighting
    kennethreitz/autoenv
    chrissicool/zsh-256color
    colored-man
    Tarrasch/zsh-bd
    ssh-agent
    bower
    node
    npm
    tmux
    extract
    vi-mode

EOBUNDLES

antigen apply

# Vim Keybindings
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd 'k' up-line-or-search
bindkey -M vicmd 'j' down-line-or-search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

source_existing /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

source_existing $HOME/.sh_aliases
