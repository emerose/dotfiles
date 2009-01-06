# .zshrc
# this file is executed only for interactive sessions.
# for code that should run in *all* sessions, see .zshenv
#

for rcfile in ~/.zsh/rc.d/* ; do
  source $rcfile
done

export EDITOR="vim"
