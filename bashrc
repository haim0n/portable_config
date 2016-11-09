# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export EDITOR=/usr/bin/vim

PORTABLE_CONFIG=$HOME/portable_config
[ -f  $PORTABLE_CONFIG/bash_prompt.sh ] && . $PORTABLE_CONFIG/bash_prompt.sh

# enable programmable completion features if it's already enabled
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
PORTABLE_CONFIG=$HOME/portable_config
[ -f  $PORTABLE_CONFIG/bash_prompt.sh ] && . $PORTABLE_CONFIG/bash_prompt.sh
if [ -f $HOME/.bash_funcs ]; then
.  $HOME/.bash_funcs
fi
if [ -f $HOME/.bash_completion ]; then
.  $HOME/.bash_completion
fi

alias adb='/home/me/Android/Sdk/platform-tools/adb'

