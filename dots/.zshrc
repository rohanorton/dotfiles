# ============= #
# Rohan's Zshrc #
# ============= #

# if not running interactively, do nothing:
[ -z "$PS1" ] && return

source_existing() {
    [ -f "$1" ] && source "$1";
}


# exports should probably go early on (i.e. for things like paths)
source_existing $HOME/.sh_exports

# command completion
autoload -U compinit

# ignore duplicate lines in history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS

source_existing /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source_existing /usr/local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
source_existing $HOME/.sh_aliases
source_existing $HOME/.fzf.zsh

# jump to previous dir :)
setopt AUTO_PUSHD
alias 1="cd +1"
alias 2="cd +2"
alias 3="cd +3"
alias 4="cd +4"
alias 5="cd +5"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# search history with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

source_existing `brew --prefix`/etc/profile.d/z.sh

# SOURCE AT EOF!!
source_existing $HOME/.shell_prompt.sh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
