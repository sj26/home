# Automatically list choices on an ambiguous completion.
setopt AUTO_LIST

# Complete uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
