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
