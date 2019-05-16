update_prompt_git() {
  local branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  if [[ -n "$branch" && "$branch" != "HEAD" ]]; then
    if [[ "$(git status --porcelain 2> /dev/null)" != "" ]]; then
      branch="$branch$txtred*$txtblu"
    fi
    PS1_GIT=" %F{blue}($branch)%f"
  else
    PS1_GIT=""
  fi
}
autoload add-zsh-hook
add-zsh-hook precmd update_prompt_git

# Perform parameter & command substitution in prompt
setopt PROMPT_SUBST

PS1="%1/\$PS1_GIT %(?.%F{green}.%F{red})%#%f "

# If we're on a remote connection, prefix with host details
if [[ -n "$SSH_CONNECTION" ]]; then
  PS1="%n@%m $PROMPT"
fi
