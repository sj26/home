# Prompt

# blue: 39,139,210 or #278bd2
# red: 39,139,210 or #278bd2
# green: 39,139,210 or #278bd2

function prompt_git {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  if [[ $git_status =~ "working directory clean" ]]; then
    color=%F{148} # green
  else
    color=%F{220} # yellow (not red = bad, just yellow = caution)
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ "# Your branch is (.*) of" ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote=" ↑"
    else
      remote=""
    fi
  fi
  if [[ ${git_status} =~ "# Your branch and (.*) have diverged" ]]; then
    remote=" ↕"
  fi
  if [[ ${git_status} =~ $'^# On branch ([^ \t\r\n]+)' ]]; then
    branch=${match[1]}
    echo " ${color}\u2b60 ${branch}${remote}"
  fi
}

setopt PROMPT_SUBST
#export PROMPT=$'%{\033[0;34m%}['${PROMPT_HOST}$'%{\033[0;31m%}%~`prompt_git`%{\e[0;34m%}]%{\e[0m%}%{\e[0;%(?.32.31)m%}%#%{\e[0m%} '

POWERLINE_COLOR_BG_GRAY=%K{240}
POWERLINE_COLOR_BG_LIGHT_GRAY=%K{240}
POWERLINE_COLOR_BG_WHITE=%K{255}

POWERLINE_COLOR_FG_GRAY=%F{240}
POWERLINE_COLOR_FG_LIGHT_GRAY=%F{240}
POWERLINE_COLOR_FG_WHITE=%F{255}

if [ "$SSH_CONNECTION" ]; then
  PROMPT_HOST="%K{green}%F{black} %n@%m %k%f%F{green}%K{blue}"$'\u2b80'
else
  PROMP_HOST=""
fi

export PROMPT="$PROMPT_HOST%k%f%F{white}%K{blue} %1~"'`prompt_git`'" %k%f%F{blue}"$'\u2b80'"%f "
export RPROMPT=$POWERLINE_COLOR_FG_WHITE$'\u2b82'"%f$POWERLINE_COLOR_BG_WHITE $POWERLINE_COLOR_FG_GRAY%D{%H:%M:%S}  "$'\u2b82'"%f%k$POWERLINE_COLOR_BG_GRAY$POWERLINE_COLOR_FG_WHITE %D{%Y-%m-%d} %f%k"
