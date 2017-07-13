prompt_git() {
  local branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  if [[ -n "$branch" && "$branch" != "HEAD" ]]; then
    if [[ "$(git status --porcelain 2> /dev/null)" != "" ]]; then
      branch="$branch$txtred*$txtblu"
    fi
    echo " %F{blue}($branch)%f"
  fi
}

# Perform parameter & command substitution in prompt
setopt PROMPT_SUBST

PROMPT="%1/\$(prompt_git) %(?.%F{green}.%F{red})%(#.#.%%)%f "

# If we're on a remote connection, prefix with host details
if [[ -n "$SSH_CONNECTION" ]]; then
  PROMPT="%n@%m $PROMPT"
fi
