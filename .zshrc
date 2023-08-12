# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

  autoload -Uz compinit
  compinit
fi

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

setopt HIST_IGNORE_SPACE

export EDITOR=vim

export GOPATH="$HOME/Developer/Go"
export PATH="$PATH:$GOPATH/bin"

export AWS_STS_REGIONAL_ENDPOINTS=regional
export AWS_VAULT_KEYCHAIN_NAME=login

alias be="bundle exec"

brg() {
  rg "$@" "${(@f)$(bundle list --paths)}"
}
alias bag=brg

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

if [[ -d /opt/homebrew/opt/fzf ]]; then
  export FZF_DEFAULT_COMMAND="ag -g ''"

  source /opt/homebrew/opt/fzf/shell/completion.zsh
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

  bindkey '^F' fzf-file-widget
fi

export BUNDLER_GREP_CMD="rg"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
