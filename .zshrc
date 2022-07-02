# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
HIST_STAMPS="dd.mm.yyyy"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias oz="subl ~/.zshrc"
alias ohz="subl ~/.oh-my-zsh"

alias l="ls -Ahl"   #long list
alias lt="ls -Ahlt" #last modified
alias lS="ls -AhlS" #by size
alias lr="ls -AhlR" # Reqursive
alias mkdir="mkdir -p"
alias reload="exec $SHELL"

alias python=/usr/local/bin/python3
alias doc="docker"
alias dc="docker-compose"

alias npmr="npm run"
alias npmi="npm i"
alias npmt="npm test"
alias npms="npm start"
alias npml="npm ls --depth=0"
alias npmu="npm update -g"
alias npmo="npm outdated --depth=0"

alias b="brew"
alias bi="brew install"
alias bu="brew uninstall"
alias bs="brew search"
alias bl="brew list"
alias bup="b update && b upgrade && b cleanup && b doctor"

function help() {
  man -t $@ | open -f -a Preview
}

function del() {
  R=$RANDOM
  mv $1 $1_$R
  rm -rf $1_$R &
}

function static() {
  local port="${1:-7777}";
  local dir="${2:-$(pwd)}";
  echo "+++++++++++++++++++++++++++++++++++++++++"
  echo "dir: $dir"
  echo "port: $port"
  echo "-----------------------------------------"
  sleep 3 && open "http://localhost:${port}/" &
  python3 -m http.server $port --directory $dir

}

####################################################################
####################################################################
####################################################################

# defaults read NSGlobalDomain ApplePressAndHoldEnabled
# >> 2022-07-02 18:50:53.152 defaults[19494:130865]
# >> The domain/default pair of (kCFPreferencesAnyApplication, ApplePressAndHoldEnabled) does not exist
# defaults read NSGlobalDomain KeyRepeat         >> 2
# defaults read NSGlobalDomain InitialKeyRepeat  >> 15

# defaults read | grep ApplePressAndHoldEnabled
# >> ApplePressAndHoldEnabled = 0;

# Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
# defaults write NSGlobalDomain KeyRepeat -int 1
# defaults write NSGlobalDomain InitialKeyRepeat -int 10



















