# Prompt
function prompt_git {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  if [[ ! $git_status =~ "working directory clean" ]]; then
    state=$'%{\e[1;31m%}⚡'
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ "# Your branch is (.*) of" ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote=$'%{\e[0;33m%}↑'
    else
      remote=$'%{\e[0;33m%}↓'
    fi
  fi
  if [[ ${git_status} =~ "# Your branch and (.*) have diverged" ]]; then
    remote=$'%{\e[0;33m%}↕'
  fi
  if [[ ${git_status} =~ $'^# On branch ([^ \t\r\n]+)' ]]; then
    branch=${match[1]}
    echo $'%{\e[0;33m%}':${branch}${remote}${state}
  fi
}

PROMPT_HOST=""
if [ "$SSH_CONNECTION" ]; then
    PROMPT_HOST=$'%{\e[0;32m%}%m:'
fi

setopt PROMPT_SUBST
export PROMPT=$'%{\033[0;34m%}['${PROMPT_HOST}$'%{\033[0;31m%}%~`prompt_git`%{\e[0;34m%}]%{\e[0m%}%{\e[0;%(?.32.31)m%}%#%{\e[0m%} '
