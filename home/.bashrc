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

  # set tput colors
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

  source  $HOME/git/contrib/completion/git-prompt.sh

  # Customize BASH PS1 prompt to show current GIT repository and branch
  Color_Off="\[\033[0m\]"       # Text Reset

  # Regular Colors
  Black="\[\033[0;30m\]"        # Black
  Red="\[\033[0;31m\]"          # Red
  Green="\[\033[0;32m\]"        # Green
  Yellow="\[\033[0;33m\]"       # Yellow
  Blue="\[\033[0;34m\]"         # Blue
  Purple="\[\033[0;35m\]"       # Purple
  Cyan="\[\033[0;36m\]"         # Cyan
  White="\[\033[0;37m\]"        # White

  # Bold
  BBlack="\[\033[1;30m\]"       # Black
  BRed="\[\033[1;31m\]"         # Red
  BGreen="\[\033[1;32m\]"       # Green
  BYellow="\[\033[1;33m\]"      # Yellow
  BBlue="\[\033[1;34m\]"        # Blue
  BPurple="\[\033[1;35m\]"      # Purple
  BCyan="\[\033[1;36m\]"        # Cyan
  BWhite="\[\033[1;37m\]"       # White

  # Underline
  UBlack="\[\033[4;30m\]"       # Black
  URed="\[\033[4;31m\]"         # Red
  UGreen="\[\033[4;32m\]"       # Green
  UYellow="\[\033[4;33m\]"      # Yellow
  UBlue="\[\033[4;34m\]"        # Blue
  UPurple="\[\033[4;35m\]"      # Purple
  UCyan="\[\033[4;36m\]"        # Cyan
  UWhite="\[\033[4;37m\]"       # White

  # Background
  On_Black="\[\033[40m\]"       # Black
  On_Red="\[\033[41m\]"         # Red
  On_Green="\[\033[42m\]"       # Green
  On_Yellow="\[\033[43m\]"      # Yellow
  On_Blue="\[\033[44m\]"        # Blue
  On_Purple="\[\033[45m\]"      # Purple
  On_Cyan="\[\033[46m\]"        # Cyan
  On_White="\[\033[47m\]"       # White

  # High Intensty
  IBlack="\[\033[0;90m\]"       # Black
  IRed="\[\033[0;91m\]"         # Red
  IGreen="\[\033[0;92m\]"       # Green
  IYellow="\[\033[0;93m\]"      # Yellow
  IBlue="\[\033[0;94m\]"        # Blue
  IPurple="\[\033[0;95m\]"      # Purple
  ICyan="\[\033[0;96m\]"        # Cyan
  IWhite="\[\033[0;97m\]"       # White

  # Bold High Intensty
  BIBlack="\[\033[1;90m\]"      # Black
  BIRed="\[\033[1;91m\]"        # Red
  BIGreen="\[\033[1;92m\]"      # Green
  BIYellow="\[\033[1;93m\]"     # Yellow
  BIBlue="\[\033[1;94m\]"       # Blue
  BIPurple="\[\033[1;95m\]"     # Purple
  BICyan="\[\033[1;96m\]"       # Cyan
  BIWhite="\[\033[1;97m\]"      # White

  # High Intensty backgrounds
  On_IBlack="\[\033[0;100m\]"   # Black
  On_IRed="\[\033[0;101m\]"     # Red
  On_IGreen="\[\033[0;102m\]"   # Green
  On_IYellow="\[\033[0;103m\]"  # Yellow
  On_IBlue="\[\033[0;104m\]"    # Blue
  On_IPurple="\[\033[10;95m\]"  # Purple
  On_ICyan="\[\033[0;106m\]"    # Cyan
  On_IWhite="\[\033[0;107m\]"   # White

  Time24h="\t"
  PathShort="\W"
  PathFull="\w"
  NewLine="\n"
  HostName="\h"
  UserName="\u"
  Jobs="\j"

  star_char=`echo -e '\xE2\x98\x85\x0a'`
  nofill_star_char=`echo -en '\xe2\x98\x86\x0a'`
  volt_char=`echo -e '\xE2\x9A\xA1'`
  arrow_char=`echo -e '\xe2\x9e\x9c\x0a'`
  recycle_char=`echo -ne '\xe2\x99\xbb\x0a'`
  circle_recycle_char=`echo -ne '\xe2\x99\xbc\x0a'`
  yingyang_char=`echo -ne '\xe2\x98\xaf\x0a'`
  notes_char=`echo -ne '\xe2\x99\xab\x0a'`
  rook_char=`echo -ne '\xe2\x99\x9c\x0a'`
  nofill_rook_char=`echo -ne '\xe2\x99\x96\x0a'`
  fire_char=`echo -ne '\xe2\x98\xb2\x0a'`

  SEGMENT_SEPARATOR='⮀'
  diff_char='±'
  branch_char='⭠'
  detached_head_char='➦'
  check_char='✔'
  x_char='✘'

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

PATH=$PATH:$HOME/bin/

export NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'
export JRUBY_HOME=$HOME/.rvm/rubies/jruby-1.7.13/

export hsr="$HOME/.homesick/repos/"

# make caps lock actually useful
if command -v xmodmap >/dev/null 2>&1; then
  xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
fi

# mysql env vars
export mysql_hostname=`hostname | sed -E 's/\..+$//'`
export MYSQL_PS1="mysql:\u@$mysql_hostname:\d> "

# get bash aliases defs
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# get bash functions
if [ -f "$HOME/.bash_func" ]; then
    . "$HOME/.bash_func"
fi

if [ -f $HOME/.homesick/repos/homeshick/homeshick.sh ]; then
  source "$HOME/.homesick/repos/homeshick/homeshick.sh"
  source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
fi
