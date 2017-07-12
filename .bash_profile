export EDITOR=vim

export RBENV_ROOT=/usr/local/rbenv
eval "$(rbenv init -)"

export NODENV_ROOT=/usr/local/nodenv
eval "$(nodenv init -)"

alias git="hub"
alias ga="git add"
alias gap="git add -p"
alias gb="git branch -vv"
alias gc="git commit -v"
alias gd="git diff"
alias gd.="git diff --color-words=."
alias gl="git log --pretty='format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset' --graph"
alias gco="git checkout"
alias gs="git status -sb"

[ -f /usr/local/etc/autojump.sh ] && . /usr/local/etc/autojump.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

### Colours #################################################################

# Foreground Colors
txtblk="$(tput setaf 0 2>/dev/null || echo '\e[0;30m')"  # Black
txtred="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')"  # Red
txtgrn="$(tput setaf 2 2>/dev/null || echo '\e[0;32m')"  # Green
txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')"  # Yellow
txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')"  # Blue
txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')"  # Purple
txtcyn="$(tput setaf 6 2>/dev/null || echo '\e[0;36m')"  # Cyan
txtwht="$(tput setaf 7 2>/dev/null || echo '\e[0;37m')"  # White

txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"  # Text Reset

### Prompt ##################################################################

set_prompt_git() {
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null) && [[ "$branch" != "HEAD" ]]; then
    if [[ "$(git status --porcelain 2> /dev/null)" != "" ]]; then
      branch="$branch*"
    fi
    prompt_git="$txtblu($branch)$txtrst "
  else
    prompt_git=""
  fi
}

set_prompt_status() {
  if [[ $? -eq 0 ]]; then
    prompt_status="$txtgrn\$$txtrst"
  else
    prompt_status="$txtred!$txtrst"
  fi
}

PROMPT_COMMAND="set_prompt_status; set_prompt_git; $PROMPT_COMMAND"

PS1="\W \$prompt_git\$prompt_status "
if [[ -n "$SSH_CONNECTION" ]]; then
  PS1="$txtcyn\u@\h$txtrst $PS1"
fi

