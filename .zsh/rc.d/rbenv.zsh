# rbenv, if we rbenv
if which "rbenv" > /dev/null; then
  eval "$(rbenv init -)"
fi

# Rails puts scripts in bin now which should override rbenv
export PATH="./bin:$PATH"
