# OS X isn't getting this right:
export SHELL=/bin/zsh

. ~/.zsh/colors.zsh
. ~/.zsh/completion.zsh
for file in ~/.zsh/rc.d/*.zsh(N); source $file
for file in ~/.zsh/rc.local.d/*.zsh(N); source $file
