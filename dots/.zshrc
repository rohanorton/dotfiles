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
    zsh-users/zsh-completions src
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-syntax-highlighting
    extract
    vi-mode

EOBUNDLES

antigen apply

# Vim Keybindings
export KEYTIMEOUT=1 # set key delay to 10ms
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd 'k' up-line-or-search
bindkey -M vicmd 'j' down-line-or-search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source_existing /usr/local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
source_existing $HOME/.sh_aliases
source_existing $HOME/.fzf.zsh
