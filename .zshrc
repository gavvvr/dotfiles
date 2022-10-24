export PATH=$PATH:~/.opt/bin

_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

if [ "$TERM_PROGRAM" = "Alacritty" ]; then
  ensure_tmux_is_running
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# completions system
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

for function in ~/.zsh/functions/*; do
  source $function
done

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=HISTSIZE
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HISTIGNORESPACE

#

. ~/.aliases

# completions
[ -f ~/.zsh/.fzf.zsh ] && . ~/.zsh/.fzf.zsh

Z_COMPLETIONS=/usr/local/etc/profile.d/z.sh
[ -f $Z_COMPLETIONS ] && . $Z_COMPLETIONS

# zoxide

export _ZO_DATA_DIR="$HOME/.cache/zoxide/"

eval "$(zoxide init zsh)"
zle -N zoxide-zi-widget __zoxide_zi
bindkey '^Z' zoxide-zi-widget

# $PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export OCI_DIR=$(brew --prefix)/lib

# version managers

ASDF_INSTALL_PATH=~/.asdf
[ -d $ASDF_INSTALL_PATH ] && . $ASDF_INSTALL_PATH/asdf.sh && . $ASDF_INSTALL_PATH/completions/asdf.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && . "/Users/$USER/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

# Download Znap, if it's not there yet.
[[ -f ~/.zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh-snap

zstyle ':znap:*' repos-dir ~/.zsh-snap/repos
source ~/.zsh-snap/znap.zsh
znap source romkatv/powerlevel10k
