prompt_host() {
  if [[ -n "$SSH_CONNECTION" ]]; then
    echo -n "%n@%m "
  fi
}

prompt_git() {
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null) && [[ "$branch" != "HEAD" ]]; then
    if [[ "$(git status --porcelain 2> /dev/null)" != "" ]]; then
      branch="$branch*"
    fi
    echo -n " $txtblu($branch)$txtrst"
  fi
}

prompt_status() {
  if [[ $? -eq 0 ]]; then
    echo -n "\$"
  else
    echo -n "\!"
  fi
}

setopt PROMPT_SUBST

PROMPT="\$(prompt_host)%1/\$(prompt_git) \$(prompt_status) "

