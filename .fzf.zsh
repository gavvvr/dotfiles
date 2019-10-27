# Setup fzf
# ---------

if [ -d "~/.fzf" ]; then
  export PATH="${PATH:+${PATH}:}/root/.fzf/bin"
  INSTALLED_AT_HOME=1
fi

# Auto-completion
# ---------------

if [[ $- == *i* ]]; then
case "$OSTYPE" in
  darwin*)
    source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
  ;;
  linux*)
          if [ -z $INSTALLED_AT_HOME ] ; then
                  source "~/.fzf/shell/completion.zsh" 2> /dev/null;
          else
                  source "/usr/share/zsh/site-functions/_fzf" 2> /dev/null;
          fi
  ;;
esac
fi

# Key bindings
# ------------

case "$OSTYPE" in
  darwin*)
    source "/usr/local/opt/fzf/shell/key-bindings.zsh"
  ;;
  linux*)
          if [ -z $INSTALLED_AT_HOME ] ; then
                  source "~/.fzf/shell/key-bindings.zsh";
    else
            source "/usr/share/fzf/key-bindings.zsh";
    fi
  ;;
esac
