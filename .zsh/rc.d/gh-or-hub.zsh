if which gh > /dev/null; then
  eval "$(gh alias -s)"
elif which hub > /dev/null; then
  eval "$(hub alias)"
fi
