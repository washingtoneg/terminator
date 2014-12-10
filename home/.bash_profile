############################################################
# .bash_profile
############################################################
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# load helper functions (Includes source_if_exists)
source $HOME/.bash_func

# OS specific features
if [[ 'Darwin' == `uname` ]]; then
  # using GNU for coreutils vs BSD
  add_brew_paths coreutils gnu-sed

  # gotta have dircolors
  eval `dircolors $HOME/.dir_colors`

  source_if_exists $(brew --prefix)/etc/bash_completion
  source_if_exists $(brew --prefix grc)/etc/grc.bashrc
elif [[ 'Linux' == `uname` ]]; then
  # make caps lock actually useful (in linux)
  if command -v xmodmap >/dev/null 2>&1; then
    xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
  fi

  # enable bash completion in interactive shells
  source_if_exists /etc/bash_completion
  source_if_exists $HOME/git-prompt.sh
  source_if_exists $HOME/git-completion.bash
fi

# Source global definitions
source_if_exists /etc/bashrc
source_if_exists $HOME/.bash_styles
source_if_exists $HOME/.bashrc
source_if_exists $HOME/.bash_aliases

# use homeshick to manage dot-files
source_if_exists $HSR/homeshick/homeshick.sh
source_if_exists $HSR/homeshick/completions/homeshick-completion.bash

# autoload other bash configs
for autoload_file in `ls -a $HOME/.bash_autoload* 2>/dev/null`; do
  source_if_exists $autoload_file
done

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH
