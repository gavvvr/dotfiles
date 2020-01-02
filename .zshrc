# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug load

# completions system
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

for function in ~/.zsh/functions/*; do
  source $function
done

export PATH=$PATH:~/.opt/bin

_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=HISTSIZE
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HISTIGNORESPACE

#

. ~/.aliases

# completions
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
