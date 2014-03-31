export GOPATH="$HOME/.go"
if [ -d "$GOPATH/bin" ]; then
  export PATH="$GOPATH/bin:$PATH"
fi
