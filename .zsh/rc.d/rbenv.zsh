# rbenv, if we rbenv
if which "rbenv" > /dev/null; then
  export RBENV_ROOT="/usr/local/rbenv"
  eval "$(rbenv init -)"
fi
