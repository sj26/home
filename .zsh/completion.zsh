# Completion, bi-atch
if [ -d /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [ -d ~/.zsh/completion.d ]; then
  fpath=(~/.zsh/completion.d $fpath)
fi

autoload -Uz compinit

compinit -u
