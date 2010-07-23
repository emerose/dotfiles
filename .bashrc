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

# Execute sub-rc files

for rcfile in ~/.bash/rc.d/* ; do
  source $rcfile
done

# done. let's not do this again, ok?
export BASHRC_ALREADY_RUN='true'
