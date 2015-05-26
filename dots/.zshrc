# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(git vi-mode)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$HOME/.cabal/bin:$PATH

source $ZSH/oh-my-zsh.sh
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

source $HOME/.sh_exports
source $HOME/.sh_aliases
