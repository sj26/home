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

btmm-domain() {
  scutil <<< "show Setup:/Network/BackToMyMac" | sed -n 's/.* : *\(.*\).$/\1/p'
}

ssh-btmm() {
  local host=$1 && shift
  ssh "$host.$(btmm-domain)" $*
}
