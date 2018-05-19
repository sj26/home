# Keep detailed track of time in history
export HISTTIMEFORMAT='%Y-%b-%d %a %H:%M:%S - '

# Use vim, always vim, forever vim. Forgive me.
export EDITOR=vim

# Load any additional enviroment files.
for file in ~/.zsh/env.d/*.zsh(N); source $file
for file in ~/.zsh/env.local.d/*.zsh(N); source $file
