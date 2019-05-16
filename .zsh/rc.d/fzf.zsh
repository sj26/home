if [[ -d /usr/local/opt/fzf ]]; then
  source /usr/local/opt/fzf/shell/completion.zsh
  source /usr/local/opt/fzf/shell/key-bindings.zsh

  bindkey '^F' fzf-file-widget
fi
