# Prompt

setopt PROMPT_SUBST

if [ "$TERM" = "xterm-256color" ]; then
  POWERLINE_LEFT_SEP=$'\ue0b0'
  POWERLINE_RIGHT_SEP=$'\ue0b2'
  POWERLINE_BRANCH=$'\ue0a0'
else
  POWERLINE_LEFT_SEP=$'\u25b6'
  POWERLINE_RIGHT_SEP=$'\u25c0'
  POWERLINE_BRANCH=$'\u26a1'
fi

if [ "$SSH_CONNECTION" ]; then
  PROMPT_HOST="%K{green}%F{black} %n@%m %k%f%F{green}%K{blue}$POWERLINE_LEFT_SEP%k%f"
else
  PROMP_HOST=""
fi

function prompt_git {
  git_status="$(git status 2> /dev/null)"
  if [[ "$git_status" =~ "working (directory|tree) clean" ]]; then
    color=%F{148} # green
  else
    color=%F{220} # yellow (not red = bad, just yellow = caution)
  fi
  if [[ ${git_status} =~ "Your branch is ahead of" ]]; then
    remote=" ↑"
  elif [[ ${git_status} =~ "Your branch and (.*) have diverged" ]]; then
    remote=" ↕"
  else
    remote=""
  fi
  if [[ ${git_status} =~ $'On branch ([^ \t\r\n]+)' ]]; then
    branch=${match[1]}
    echo " ${color}${POWERLINE_BRANCH} ${branch}${remote}%f"
  fi
}

export PROMPT="$PROMPT_HOST%B%F{white}%K{blue} %1~"'`prompt_git`'" %k%f%b%F{blue}$POWERLINE_LEFT_SEP%f "
