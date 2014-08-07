############################################################
# .bash_profile
############################################################
export PATH="$HOME/bin:/usr/local/bin:$PATH"

if [[ 'Darwin' == `uname` ]]; then
  # using gnu for coreutils vs bsd
  export PATH="`brew --prefix coreutils`/libexec/gnubin:$PATH"
  export MANPATH="`brew --prefix coreutils`/libexec/gnuman:$MANPATH"
  eval `dircolors $HOME/.dir_colors`

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  if [ -f $(brew --prefix)/etc/grc.bashrc ]; then
    . "`brew --prefix grc`/etc/grc.bashrc"
  fi
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Get the aliases and functions
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

for autoload_file in `ls -a $HOME/.bash_autoload* 2>/dev/null`; do
  source $autoload_file
done

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH
