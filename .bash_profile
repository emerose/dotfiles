# .bash_profile: called by bash for interactive (and non-interactive login)
# sessions.  supersedes .profile; gets called before .bashrc.

# we don't actually care about the differences between these shells.  we
# just include .bashrc if it exists:
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

