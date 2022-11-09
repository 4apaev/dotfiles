ZSH_THEME=shoshi
export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export EDITOR=subl
export PATH=/usr/local/sbin:$PATH
source $ZSH/oh-my-zsh.sh

plugins=(git docker)

COMPLETION_WAITING_DOTS=true
HIST_STAMPS="dd.mm.yyyy"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NODUPS

alias cc="closure-compiler"
alias sql="sqlite3"
alias sqlite="sqlite3"
alias py="python3"
alias python="python3"
alias sketch="/Applications/Sketch.app/Contents/MacOS/sketchtool"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias airport=" /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias chromedebug="chrome --remote-debugging-port=9222"

alias reload="exec $SHELL"
alias oz="vi ~/.zshrc"
alias ozsh="subl ~/.oh-my-zsh"
alias auth="ssh-add -A 2>/dev/null"
alias mkdir="mkdir -p" # create subdirs
alias copyfile="clipcopy"
alias showpath="echo \"(\$PATH) /etc/paths\" && cat /etc/paths"
alias pwdcp="pwd | pbcopy"

alias l="ls -lAh"                   # long, all, human readable
alias lt="l -T"                     # time complete info
alias ltm="lt -t"                   # time modified
alias lta="lt -u"                   # time access
alias ltc="lt -U"                   # time created
alias lsz="du -hs"                  # dir size
alias lsza="du -hcd 0 * | sort -hr" # dir size all & sort by size

alias npmi="npm i"
alias npmr="npm run"
alias npmt="npm test"
alias npms="npm start"
alias npmu="npm update"
alias npmup="npmo; npmu --save"
alias npml="npm ls --depth=0"
alias npmo="npm outdated --depth=0"
alias npmrs="del node_modules && rm package-lock.json && npmi"

alias curli="curl -I"
alias curlp="curl -d"
alias curlj="curlp -H 'Content-Type: application/json' -d"

alias doc="docker"
alias dc="docker-compose"

alias dcu="dc up"
alias dcd="dc down"

alias dcud="dc up -d"
alias dcub="dc up --build"
alias dcubd="dc up --build -d"

alias dclc="doc container ls -a"
alias dcli="doc image ls -a"
alias dclv="doc volume ls"
alias dcl="dclc && dcli && dclv"

alias b="brew"
alias bl="b list"
alias bs="b search"
alias bi="b install"
alias bu="b uninstal"
alias bubc="b update && b upgrade && b cleanup && b doctor"

function bup() {
  brew update
  brew upgrade
  brew cleanup
  brew doctor
  echo
  echo "========================= NPM UPDATE ========================="
  npm outdated -g --depth=0
  echo
  npm update -g
}

function dckill() {
  doc down
  doc stop $(doc ps -a -q)
  doc kill $(doc ps -q)
  doc rm $(doc ps -a -q)
  doc rmi $(doc images -q)
}

function help() {
  man -t $@ | open -f -a Preview
}

function trash() {
  for x in $@; do
    echo "🧹 $x 🪣"
    mv -i $x "$HOME/.Trash/$x"
  done
}

function del() {
  local d="$1_$RANDOM"
  mv $1 $d
  echo "💩 $1 🚽 $d 🧻"
  rm -rf $d &
}

function tree() {
  local dir=${1:-$(pwd)}
  local magic='s;[^/]*/;│────;g;s;────│; │;g'
  find $dir -not -path "./.git/*" -not -path "./node_modules/*" -print | sed -e "$magic"
}

function static() {
  local dir=$(pwd)
  local port=7777
  local x
  for x in $@; do
    # is `x` a `number`
    if [ $x -eq $x ] 2>/dev/null; then
      port=$x
    elif [ -d $x ]; then
      dir=$x
    fi
  done
  python -m http.server $port --directory $dir
}
