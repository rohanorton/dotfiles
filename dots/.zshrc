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
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS

source_existing /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source_existing /usr/local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
source_existing $HOME/.sh_aliases
source_existing $HOME/.fzf.zsh

source_existing $HOME/.shell_prompt.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# search history with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
