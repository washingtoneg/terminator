# .bash_profile

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Get the aliases and functions
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

for autoload_file in `ls -a .bash_autoload* 2>/dev/null`; do
  source $autoload_file
done

if [[ 'Darwin' == `uname` ]]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH
