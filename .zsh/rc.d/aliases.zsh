alias r=rails
alias rs="r server"
alias rc="r console"
alias rg='r generate'
alias rd="r dbconsole"
alias rr='mkdir -p tmp && touch tmp/restart.txt'
rl() {
  tail -F "log/${RAILS_ENV:=${RACK_ENV:=development}}.log" "$(test -d "$HOME/Library/Logs/Pow/apps" && echo "$HOME/Library/Logs/Pow/apps/$(basename "$PWD").log")"
}
alias rrl='rr && rl'

alias be="bundle exec"
alias bi="bundle install"
bag() {
  ag "$@" $(bundle show --paths)
}
alias back=bag

# so I can `be migrated`
alias migrated="rake db:migrate"

alias fuspec="rspec --require fuubar --format Fuubar --color"
alias fucumber="cucumber --require fuubar --format fuubar"

# Git aliases
alias ga="git add"
alias gap="git add -p"
alias gb="git branch -v"
alias gba="git branch -av"
alias gc="git commit -v"
alias gd="git diff"
alias gd.="git diff --color-words=."
function gde() { git diff $* | $EDITOR }
alias gf="git flow"
alias gl="git log --pretty='format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset' --graph"
alias gm="git smart-merge"
alias gco="git checkout"
alias gp="git push"
alias gr="git remote -v"
alias gs="git status -sb"
alias gu="git pull"
alias gup="git smart-pull"

# Derail
function derail() {
  rails new $1 --skip-test-unit --skip-bundle --database=postgresql --template ~/Projects/Derail/lib/generators/derail/app/bootstrap.rb $@[2,-1]
}

# You've got the powah!
function powify() {
  host="${1:-$(basename $PWD | tr A-Z a-z)}"
  link="$HOME/.pow/$host"
  [ -L $link ] || ln -s "$PWD" "$link"
  echo "http://$host.dev"
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

function using_64() {
  env ARCHFLAGS="-arch x86_64" ARCHS="x86_64" $*
}

function using_gcc() {
  env CC="gcc-4.2" CPP="cpp-4.2" CXX="g++-4.2" $*
}

function using_gcc_64() {
  env CC="gcc-4.2" CPP="cpp-4.2" CXX="g++-4.2" ARCHFLAGS="-arch x86_64" ARCHS="x86_64" $*
}

function killdb() {
  kill $(psgrep -n postgres: | grep $1 | awk '{ print $2 }')
}

pman () {
  man -t "${1}" | open -f -a /Applications/Preview.app
}

btmm-domain() {
  scutil <<< "show Setup:/Network/BackToMyMac" | sed -n 's/.* : *\(.*\).$/\1/p'
}

ssh-btmm() {
  local host=$1 && shift
  ssh "$host.$(btmm-domain)" $*
}

# Pretty colours
alias tmux="TERM=screen-256color-bce tmux"

# Ooher
alias lockscreen="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
