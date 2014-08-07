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

  # add timestamps to history
  HISTTIMEFORMAT='%F %T '

  # no empty command completion
  shopt -s no_empty_cmd_completion

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

  export TERM='xterm-256color'

  # disable XON/XOFF so ctrl-s works
  stty -ixon

  source $HOME/git-prompt.sh

  source $HOME/.bash_styles

  # Customize BASH PS1 prompt to show current GIT repository and branch
  function soho_pwd() {
    # svn info
    stat .svn > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        SURL=`svn info | grep URL | head -1 | perl -pe 's/URL: (.*)/\1/'`
        if [ `echo $SURL | grep -E "branches|tags"` ]; then
          SVER=`echo $SURL | perl -pe 's{.*/(branches|tags)/(.*)}{\1/\2}' | cut -d/ -f1-2`
          SPTH=`echo $SURL | perl -pe 's{.*svnroot/(.*)/(branches|tags)/.*}{/\1}'`
          SPWD="$SPTH/$SVER"
          SCL=$IGreen
        else
          SPWD=`echo $SURL | perl -pe 's{.*svnroot/(.*)/trunk(.*)}{/\1/trunk}'`
          SCL=$IYellow
        fi
        svn status | egrep '.+' > /dev/null 2>&1
        if [ $? -eq 0 ]; then
          SCL=$IRed
        fi
      SvnInfoColor="$SCL[SVN: $SPWD]"
    else
      SvnInfoColor=""
    fi

    # git info
    git branch >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      GitBranch=`__git_ps1 "%s"`
      git status | grep "nothing to commit" >/dev/null 2>&1
      if [ $? -eq 0 ]; then
        # Clean repository - nothing to commit
        GitInfoColor="${IGreen}$branch_char $GitBranch $check_char$Color_Off"
      else
        # Changes to working tree
        GitInfoColor="${IRed}$branch_char $GitBranch $x_char$Color_Off"
      fi
    else
      GitInfoColor=""
    fi

    export PS1="$HostInfoWColor $IYellow$PathFull $SvnInfoColor$GitInfoColor$NewLine$arrow_char $Color_Off"
  }

  HostInfoWColor="$IGreen$fire_char $ICyan$UserName$IBlue@$IGreen$HostName"
  export PROMPT_COMMAND=soho_pwd
fi

export EDITOR=vim

#export NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'
export JRUBY_HOME=$HOME/.rvm/rubies/jruby-1.7.13/

export HSR="$HOME/.homesick/repos/"
CDPATH=.:$HSR

# make caps lock actually useful
if command -v xmodmap >/dev/null 2>&1; then
  xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
fi

# mysql env vars
export mysql_hostname=`hostname | sed -E 's/\..+$//'`
export MYSQL_PS1="[mysql] \u@$mysql_hostname:\d> "

# get bash aliases defs
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f $HOME/.homesick/repos/homeshick/homeshick.sh ]; then
  source "$HOME/.homesick/repos/homeshick/homeshick.sh"
  source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
fi
