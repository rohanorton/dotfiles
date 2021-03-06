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
autoload -Uz compinit
# (brew install zsh-completions)
fpath=(/usr/local/share/zsh-completions $fpath)

# ignore duplicate lines in history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt append_history
setopt hist_ignore_dups
setopt share_history

setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt extendedglob
unsetopt caseglob

autoload -U compinit
compinit
zmodload -i zsh/complist
setopt hash_list_all            # hash everything before completion
setopt completealiases          # complete alisases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.
setopt correct # correct spelling

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # ignore case

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# jump to previous dir :)
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

# search history with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# mass filename renaming
autoload -U zmv

eval "$(thefuck --alias)"

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

source_existing $HOME/.nix-profile/etc/profile.d/nix.sh
source_existing `brew --prefix`/etc/profile.d/z.sh
source_existing $HOME/.zsh/k/k.sh
source_existing /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source_existing $HOME/.sh_aliases
source_existing $HOME/.shell_prompt.sh

source_existing $(brew --prefix asdf)/asdf.sh
# source_existing $HOME/.asdf/completions/asdf.bash


# show vim status
# http://zshwiki.org/home/examples/zlewidgets
function zle-line-init zle-keymap-select {

    if [[ $KEYMAP == "vicmd" ]]; then
      PROMPT=$PS1_NORMAL
    else
      PROMPT=$PS1_INSERT
    fi
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
# jump into vim buffer using `v`
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd ! edit-command-line
# 10ms for key sequences
KEYTIMEOUT=1

#
# do not use source_existing otherwise install script keeps adding new one!!
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Default blue is pretty much unreadable on black background, change
# zsh-syntax-highlighting to something a bit clearer for paths:
# ZSH_HIGHLIGHT_STYLES[path]='fg=blue,bold'
# ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue,bold'

# Signify command something is an alias by underlining
# ZSH_HIGHLIGHT_STYLES[alias]='fg=green,underline'
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
alias parse-config="vim ~/.config/parse-dashboard/config.json"

function parse-config-setup() {
  NODE_VERSION=$(node --version | sed 's/^v//')
  CONFIG_PATH="$HOME/.asdf/installs/nodejs/$NODE_VERSION/.npm/lib/node_modules/parse-dashboard/Parse-Dashboard"

  # Install parse-dashboard if not available
  which parse-dashboard || npm install --global parse-dashboard

  echo "Using own config"
  ln -sf $HOME/.config/parse-dashboard/config.json $CONFIG_PATH/parse-dashboard-config.json
  echo "Done!"
}

export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/rohan/.npm/_npx/40707/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/rohan/.npm/_npx/40707/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/rohan/.npm/_npx/40707/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/rohan/.npm/_npx/40707/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Volumes/Development/code/thedistance/backend-test-appurl/node_modules/tabtab/.completions/slss.zsh ]] && . /Volumes/Development/code/thedistance/backend-test-appurl/node_modules/tabtab/.completions/slss.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

## more complete git / git flow completions
source ~/.zsh/completion/git.zsh
source ~/.zsh/completion/git-flow.zsh

