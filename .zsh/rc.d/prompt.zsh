# Prompt

# blue: 39,139,210 or #278bd2
# red: 39,139,210 or #278bd2
# green: 39,139,210 or #278bd2


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

POWERLINE_COLOR_BG_GRAY=%K{240}
POWERLINE_COLOR_BG_LIGHT_GRAY=%K{240}
POWERLINE_COLOR_BG_WHITE=%K{255}

POWERLINE_COLOR_FG_GRAY=%F{240}
POWERLINE_COLOR_FG_LIGHT_GRAY=%F{240}
POWERLINE_COLOR_FG_WHITE=%F{255}

if [ "$SSH_CONNECTION" ]; then
  PROMPT_HOST="%K{green}%F{black} %n@%m %k%f%F{green}%K{blue}$POWERLINE_LEFT_SEP"
else
  PROMP_HOST=""
fi

function prompt_git {
  git_status="$(git status 2> /dev/null)"
  if [[ $git_status =~ "working directory clean" ]]; then
    color=%F{148} # green
  else
    color=%F{220} # yellow (not red = bad, just yellow = caution)
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ "Your branch is (.*) of" ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote=" ↑"
    else
      remote=""
    fi
  fi
  if [[ ${git_status} =~ "Your branch and (.*) have diverged" ]]; then
    remote=" ↕"
  fi
  if [[ ${git_status} =~ $'^On branch ([^ \t\r\n]+)' ]]; then
    branch=${match[1]}
    echo " ${color}${POWERLINE_BRANCH} ${branch}${remote}"
  fi
}

export PROMPT="$PROMPT_HOST%k%f%F{white}%K{blue} %1~"'`prompt_git`'" %k%f%F{blue}$POWERLINE_LEFT_SEP%f "
export RPROMPT="${POWERLINE_COLOR_FG_WHITE}${POWERLINE_RIGHT_SEP}%f${POWERLINE_COLOR_BG_WHITE} ${POWERLINE_COLOR_FG_GRAY}%D{%H:%M:%S}  ${POWERLINE_RIGHT_SEP}%f%k${POWERLINE_COLOR_BG_GRAY}${POWERLINE_COLOR_FG_WHITE} %D{%Y-%m-%d} %f%k"
