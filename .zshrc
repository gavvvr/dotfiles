HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=HISTSIZE
setopt SHARE_HISTORY

#

. ~/.aliases

# completions system
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# completions
ANTIGEN_COMPLTIONS=/usr/local/share/antigen/antigen.zsh
[ -f $ANTIGEN_COMPLTIONS ] && . $ANTIGEN_COMPLTIONS

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

Z_COMPLETIONS=/usr/local/etc/profile.d/z.sh
[ -f $Z_COMPLETIONS ] && . $Z_COMPLETIONS

# $PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export OCI_DIR=~/Documents/tools/oracle/bin
export PATH=$PATH:$OCI_DIR
export PATH=$PATH:~/Documents/tools/oracle/sqlcl/bin

# version managers

. ~/.asdf/asdf.sh
. ~/.asdf/completions/asdf.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && . "/Users/$USER/.sdkman/bin/sdkman-init.sh"

