#!/bin/bash
#
# DESCRIPTION:
#
#   Set the bash prompt according to:
#    * the active virtualenv
#    * the branch of the current git/mercurial repository
#    * the return value of the previous command
#    * the fact you just came from Windows and are used to having newlines in
#      your prompts.
#
# USAGE:
#
#   1. Save this file as ~/bash_prompt.sh
#   2. Add the following line to the end of your ~/.bashrc or ~/.bash_profile:
#        . ~/bash_prompt.sh
#
# LINEAGE:
#
#   Based on work by woods
#
#   https://gist.github.com/31967

# The various escape codes that we can use to color our prompt.
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[1;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[1;34m\]"
     PURPLE="\[\033[0;35m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

# determine git branch name
function parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Determine the branch/state information for this git repository.
function set_git_branch() {
  # Get the name of the branch.
  branch=$(parse_git_branch)

  # Set the final branch string.
  #BRANCH="${PURPLE}${branch}${COLOR_NONE} "
  BRANCH="${branch} "
}

function set_active_conda_env() {
  if  [ -z $CONDA_DEFAULT_ENV ]; then
    CONDA_STR=""
  else
    CONDA_STR="($CONDA_DEFAULT_ENV)"
  fi
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol () {
  #if test $1 -eq 0 ; then
      PROMPT_SYMBOL="\$"
 # else
 #     PROMPT_SYMBOL="${LIGHT_RED}\$${COLOR_NONE}"
 # fi
}

# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="${BLUE}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
  fi
}

# Set the full bash prompt.
function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  set_prompt_symbol $?

  # Set the PYTHON_VIRTUALENV variable.
  set_virtualenv

  # Set the BRANCH variable.
  set_git_branch

  # Set the CONDA_STR variable
  set_active_conda_env
  
  export PS1='${CONDA_STR}${PYTHON_VIRTUALENV}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]${BRANCH}${PROMPT_SYMBOL} '

}

PROMPT_COMMAND=set_bash_prompt
