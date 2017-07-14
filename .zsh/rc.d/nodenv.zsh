# nodenv, if we nodenv
if which "nodenv" > /dev/null; then
  export NODENV_ROOT="/usr/local/nodenv"
  eval "$(nodenv init -)"
fi
