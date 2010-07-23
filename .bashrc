if [ "${BASHRC_ALREADY_RUN+false}" == 'true' ]
then
  # we've been here before
  exit
fi

# $PS1 is set iff this is an interactive session
# $SSH_TTY is set iff this is an SSH session with a TTY allocated
# $WINDOW is set iff we're running inside a screen session.
#
if [ "$PS1" != "" -a "${WINDOW:-x}" == x -a "${SSH_TTY:-x}" != x ]
then
  # this is an interactive shell, and
  # we're not already inside screen, and
  # we are inside an interactive SSH connection, so
  # start screen and create a new window if necessary:
  screen -U -A -RR && exit 0
  # normally, execution of this rc script ends here
  echo "Screen failed! continuing with normal bash startup"
fi


### Path settings
##
# All possible paths, in reverse-order of priority
# (ie, later paths override previous ones)
declare -a possible_paths=('/usr/bin'
                           '/usr/sbin'
                           '/usr/libexec'
                           '/usr/local/bin'
                           '/usr/local/sbin'
                           '/usr/local/libexec'
                           '/opt/local/bin'
                           '/opt/local/sbin'
                           '/opt/local/libexec'
                           '/usr/local/mysql/bin'
                           '/opt/jruby/bin'
                           '/var/lib/gems/1.9/bin' 
                           '/var/lib/gems/1.8/bin'
                           "$HOME/.gem/ruby/1.9/bin"
                           "$HOME/.gem/ruby/1.8/bin"
                           "$HOME/.cabal/bin"
                           "$HOME/bin")

# Look through the list of paths and add any that
# exist to $PATH.  Keeps $PATH clear of cruft.
# We also try to keep MANPATH up-to-date
for dirname in ${possible_paths[*]}; do
  if [ -d $dirname ]; then
    PATH=$dirname:$PATH
  fi

  manpath=${dirname/%bin/share\/man}
  if [ -n $manpath -a -d $manpath ]; then
    MANPATH=$manpath:$MANPATH
  fi

  manpath=${dirname/%bin/man}
  if [ -n $manpath -a -d $manpath ]; then
    MANPATH=$manpath:$MANPATH
  fi
done



### Important Variables
##
# all that hard work, above.
export PATH
export MANPATH

# vim for life.  or until I switch again
export EDITOR='vim'

# look in these places for dirs to cd to
export CDPATH=".:$HOME:$HOME/Code"

# add *everything* to the history file
unset HISTCONTROL

# keep lots of history
export HISTSIZE=10000
export HISTFILESIZE=10000

# prettify the history listing
export HISTTIMEFORMAT="%F %T"

# this is merica, speak merican!
export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# ignore these extensions in file completion
export FIGNORE="~:CVS:#:.pyc:.swp:.swa:.swo"



### Shell Options
##
# If a command no longer exists, do a normal
# path search for a replacement
shopt -s checkhash

# check window size (and reset $LINES/$COLUMNS) after each cmd
shopt -s checkwinsize

# append to history file rather than replacing it
shopt -s histappend

# allow editing of history commands before running them
# only 70% sure I want this, but...
shopt -s histverify



### Application-specific Settings
##
# cabal
if [ -d $HOME/.cabal ]; then
  export CABALDIR=$HOME/.cabal
fi

# jruby
if [ -d /opt/jruby ]; then
  export JRUBY_HOME=/opt/jruby
fi


### End
##
# let's not do this again, ok?
export BASHRC_ALREADY_RUN='true'
