bag() {
  ag "$@" $(bundle show --paths)
}

# Git aliases
alias git="hub"
alias ga="git add"
alias gap="git add -p"
alias gb="git branch -v"
alias gc="git commit -v"
alias gd="git diff"
alias gd.="git diff --color-words=."
alias gl="git log --pretty='format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset' --graph"
alias gco="git checkout"
alias gs="git status -sb"

# Shamelessly copied from @plasticine <3
# https://gist.github.com/plasticine/0953b7114060c34b5d122cdb48a151dd
gcob() {
  local format branch branches
  format="%(committerdate:relative)\\%(color:green)%(refname:short)%(color:reset)\\%(HEAD)\\%(color:yellow)%(objectname:short)%(color:reset) %(upstream:trackshort)\\%(contents:subject)"
  branches=$(git for-each-ref --format="$format" --sort=-committerdate refs/heads/ | column -t -s "\\") &&
  branch=$(echo "$branches" | fzf --ansi --height=15 --border) &&
  git checkout $(echo "$branch" | awk '{print $4}')
}

btmm-domain() {
  scutil <<< "show Setup:/Network/BackToMyMac" | sed -n 's/.* : *\(.*\).$/\1/p'
}

ssh-btmm() {
  local host=$1 && shift
  ssh "$host.$(btmm-domain)" $*
}
