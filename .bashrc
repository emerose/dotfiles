# Automagic screen invocation; based on
# http://taint.org/wk/RemoteLoginAutoScreen
# 
# $PS1 is set iff this is an interactive session
# $SSH_TTY is set iff this is an SSH session with a TTY allocated
# $WINDOW is set iff we're running inside a screen session.
#
# all that boils down to:
# IF this is an interactive shell, on an ssh connection that has a TTY,
# not running inside a screen window, THEN start screen and attach to 
# the first detached session (or create a new one).
#
# If screen fails for some reason (exits with a non-zero status), then
# bash starts up normally.  Combined with the shell setting in .screenrc,
# this allows me to use an exotic shell that I don't trust too much (zsh)
# while still being able to log in in an emergency.
#
if [ "$PS1" != "" -a "${WINDOW:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
  screen -U -A -RR && exit 0
  # normally, execution of this rc script ends here...
  echo "Screen failed! continuing with normal bash startup"
fi

