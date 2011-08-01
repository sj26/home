rails_version() {
  which rails >/dev/null && rails -v 2>/dev/null | sed 's/Rails //'
}

r() {
  local name="$1"
  shift
  if [[ -z "$name" ]]; then
    echo "Usage: $0 command *args" >&2
    return 1
  fi
  if [[ -x "./script/$name" ]]; then
    ./script/$name $@
  elif [[ -x "./script/rails" ]]; then
    ./script/rails "$name" $@
  elif [[ -n "$(rails_version | grep '^3')" ]]; then
    rails "$name" $@
  else
    echo "Please change to the root of your project first." >&2
    return 1
  fi
}

# Time saving shortcuts
#alias rs="r server"
alias rs="echo Aren't you using pow?!"
alias rc="r console"
alias rp='r plugin'
alias rg='r generate'
alias rd="r dbconsole"
alias rr='mkdir -p tmp && touch tmp/restart.txt'
alias rl='tail -f log/*.log'
alias rrl='rr && rl'

alias be="bundle exec"
alias bi="bundle install"

# Git aliases
alias ga="git add"
alias gap="git add -p"
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit -v"
function gd() { git diff $* | $EDITOR }
alias gf="git flow"
alias gl="git log"
alias gm="git merge origin/develop"
alias gp="git push"
alias gr="git remote -v"
alias gs="git status -sb"
alias gu="git pull"

# Derail
function derail() {
  rails new $1 --skip-test-unit --skip-bundle --database=postgresql --template ~/Development/Derail/lib/generators/derail/app/bootstrap.rb $@[2,-1]
}

# You've got the powah!
function powify() {
  ln -s $PWD ~/.pow/${1:-$(basename $PWD | tr A-Z a-z)}
}

# Repeat command prefixed with sudo
alias fu='sudo $(fc -ln -1)'

alias genpass="head -c64 /dev/urandom | openssl enc -base64 | head -c32 | tee /dev/tty | pbcopy"

# Dig/Host via Google
alias gig="dig @8.8.8.8"
function gost() { host $* 8.8.8.8 }

function power_sword() {
  cat <<-"BANNER"
  .----..-.  .-.    .-----..-. .-..----.    .-.-.  .---. .-.  .-..----..---.
  | {_} }\ \/ /     `-' '-'{ {_} |} |__}    | } }}/ {-. \| {  } |} |__}} }}_}
  | {_} } `-\ }       } {  | { } }} '__}    | |-' \ '-} /{  /\  }} '__}| } \
  `----'    `-'       `-'  `-' `-'`----'    `-'    `---' `-'  `-'`----'`-'-'
   .---. .----.    .----..---.  .--..-.  .-..----..-..-..-. .-..-.   .-.
  / {-. \} |__}    | |--'} }}_}/ {} \\ \/ /{ {__-`| ' / | } { |} |   } |
  \ '-} /} '_}     | }-`}| } \/  /\  \`-\ }.-._} }| . \ \ `-' /} '--.} '--.
   `---' `--'      `----'`-'-'`-'  `-'  `-'`----' `-'`-` `---' `----'`----'
BANNER
  psql --username=develop $1_development $@[2,-1]
}

function using_gcc() {
  env CC="/usr/bin/gcc-4.2" ARCHFLAGS="-arch x86_64" ARCHS="x86_64" $*
}
