# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
function set-title () {
    export PREV_COMMAND=${PREV_COMMAND}${@}
        echo -ne "\033]0;${PREV_COMMAND}\007"
	    export PREV_COMMAND=${PREV_COMMAND}' | '
}
export EDITOR=/usr/bin/vim

# git prompt stuff
GIT_PROMPT=/usr/share/git-core/contrib/completion/git-prompt.sh
if [ -f $GIT_PROMPT ]; then
   . $GIT_PROMPT
fi
PROMPT_COMMAND='__git_ps1 "[\u@\h \W" "]\\\$ "'
GIT_PS1_SHOWDIRTYSTATE=true
