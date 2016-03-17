# ============= #
# Rohan's Zshrc #
# ============= #

source_existing() {
    [ -f "$1" ] && source "$1";
}


# exports should probably go early on (i.e. for things like paths)
source_existing $HOME/.sh_exports

# command completion
autoload -U compinit

# ignore duplicate lines in history
setopt HIST_IGNORE_DUPS

source_existing /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source_existing /usr/local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
source_existing $HOME/.sh_aliases
source_existing $HOME/.fzf.zsh

source_existing $HOME/.zsh/prompt.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

