# Handle $0 according to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Open the current directory in a Finder window
# alias ofd='open_command $PWD'
function del() {
  rm -rf $1 &
}


function static() {
  local dir=$(pwd)
  local port=7777
  local x
  for x in $@; do
    if [ $x -eq $x ] 2>/dev/null; then # is x a number
      port=$x
    elif [ -d $x ]; then
      dir=$x
    fi
  done
  python3 -m http.server $port --directory $dir
}

function pfd() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (insertion location as alias)
    end tell
EOF
}

function pfs() {
  osascript 2>/dev/null <<EOF
    set output to ""
    tell application "Finder" to set the_selection to selection
    set item_count to count the_selection
    repeat with item_index from 1 to count the_selection
      if item_index is less than item_count then set the_delimiter to "\n"
      if item_index is item_count then set the_delimiter to ""
      set output to output & ((item item_index of the_selection as alias)'s POSIX path) & the_delimiter
    end repeat
EOF
}

function cdf() {
  cd "$(pfd)"
}

function pushdf() {
  pushd "$(pfd)"
}

function zipf () {
  zip -r "$1".zip "$1"
}

function see() {
  (( $# > 0 )) && qlmanage -p $* &>/dev/null &
}

function helps() {
  open x-man-page://$@
  # Don't let Preview.app steal focus if the man page doesn't exist
  # man -w "$@" &>/dev/null && man -t "$@" | open -f -a Preview || man "$@"
}
compdef _man helps

function vncviewer() {
  open vnc://$@
}

tree() {
  local dir=${1:-$(pwd)}
  local magic='s;[^/]*/;│────;g;s;────│; │;g'
  find $dir -not -path "./.git/*" -not -path "./node_modules/*" -print | sed -e "$magic"
}

keygen() {
  local ${0:#$ZSH_ARGZERO}
  openssl
    req
    -x509
    -nodes
    -sha256
    -days 365
    -newkey rsa:2048
    -subj "/CN=$1"
    -keyout conf/certs/$1-prv.pem
    -out conf/certs/$1-pub.pem
}
# Erases purgeable disk space with 0s on the selected disk
function freespace(){
  if [[ -z "$1" ]]; then
    echo "Usage: $0 <disk>"
    echo "Example: $0 /dev/disk1s1"
    echo
    echo "Possible disks:"
    df -h | awk 'NR == 1 || /^\/dev\/disk/'
    return 1
  fi

  echo "Cleaning purgeable files from disk: $1 ...."
  diskutil secureErase freespace 0 $1
}

_freespace() {
  local -a disks
  disks=("${(@f)"$(df | awk '/^\/dev\/disk/{ printf $1 ":"; for (i=9; i<=NF; i++) printf $i FS; print "" }')"}")
  _describe disks disks
}

compdef _freespace freespace

function json() {
  xargs -0 node -e 'console.log(JSON.stringify(JSON.parse(process.argv[1]), null, 4));'
}

############################################################################333

# print-zsh-brew-env() {
#   echo "|-----------------------------------"
#   echo "|                                   "
#   echo "| ZSH                               "
#   echo "|-----------------------------------"
#   echo "|     THEME  $ZSH_THEME             "
#   echo "|   VERSION  $ZSH_VERSION           "
#   echo "| CACHE_DIR  $ZSH_CACHE_DIR         "
#   echo "|  COMPDUMP  $ZSH_COMPDUMP          "
#   echo "|-----------------------------------"
#   echo "|                                   "
#   echo "| BREW                              "
#   echo "|-----------------------------------"
#   echo "|     PREFIX : $HOMEBREW_PREFIX     "
#   echo "|     CELLAR : $HOMEBREW_CELLAR     "
#   echo "| REPOSITORY : $HOMEBREW_REPOSITORY "
#   echo "|-----------------------------------"
#   echo "|       which : $(which brew)       "
#   echo "|      prefix : $(brew --prefix)    "
#   echo "| completions : $(brew completions) "
#   echo "|-----------------------------------"
#   echo "|                                   "
#   echo "|-----------------------------------"
#   echo "|                                   "
#   echo "| SHELL                             "
#   echo "|-----------------------------------"
#   echo "| UserShell : $(dscl . -read /Users/$USER UserShell)"

#   echo "/etc/shells"
#   cat /etc/shells

#   # chsh -s /usr/local/bin/zsh
# }


# reset-complete() {
#   rm -f $ZSH_COMPDUMP
#   compinit
# }