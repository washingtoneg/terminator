############################################################
# .bashrc
############################################################
# If not running interactively, don't do anything
if [[ -n "$PS1" ]]; then
  # append to the history file, don't overwrite it
  shopt -s histappend

  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
  HISTSIZE=1000
  HISTFILESIZE=2000

  # don't put duplicate lines in the history. See bash(1) for more options
  # ... or force ignoredups and ignorespace
  HISTCONTROL=ignoredups:ignorespace

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

  export TERM='xterm-256color'

  # set colors
  TXTBLD=$(tput bold)
  BLACK=$(tput setaf 0)
  RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)
  BLUE=$(tput setaf 4)
  PURPLE=$(tput setaf 5)
  CYAN=$(tput setaf 6)
  WHITE=$(tput setaf 7)
  INVIS=$(tput civis)
  VIS=$(tput cnorm)
  RESET=$(tput sgr0)

  use_color=false

  PS1='\[$GREEN\]\u\[$BLUE\]@\[$GREEN\]\h\[$BLUE\] \W \$ \[$RESET\]'
#  if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
fi

export EDITOR=vim

PATH=$PATH:$HOME/bin/:$HOME/.rvm/bin # Add RVM to PATH for scripting

# get bash aliases defs
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# get bash functions
if [ -f ~/.bash_func ]; then
    . ~/.bash_func
fi
