eval "$(/opt/homebrew/bin/brew shellenv)"

export ZSH=$HOME/.oh-my-zsh
export ZSH_CACHE_DIR=$ZSH/cache
export ZSH_COMPDUMP=$ZSH_CACHE_DIR/.zcompdump-$SHORT_HOST-$ZSH_VERSION

ZSH_THEME=shoshi
HIST_STAMPS="yyyy-mm-dd"

plugins=(git shosh copybuffer)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if type brew &>/dev/null; then
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
# autoload -Uz compinit
# compinit
fi

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' $ZSH_COMPDUMP) ]; then
compinit
else
compinit -C
fi

if type gls &>/dev/null; then
alias l="gls -lahon --color=auto --group-directories-first"
else
alias l='ls -lahon'
fi

alias reload="omz reload"
alias reloadShell="exec $SHELL"

alias b="brew"
alias bi="brew install"

alias doc="docker"
alias dc="docker-compose"
alias dcrm="docker rm -f --remove-orphans"

alias oz="vim ~/.zshrc"
alias ozsh="subl -a ~/.zshrc ~/.oh-my-zsh ~/Work/dotfiles"

alias showpath="cat /etc/paths; echo -e "::$PATH" | sed 's/:/\n/g'"
alias pwdcp="pwd | pbcopy"
alias curlh="curl -sIv" # head only and verbose


alias npmi="npm i"
alias npmr="npm run"
alias npmt="npm test"
alias npms="npm start"
alias npmu="npm update"
alias npmus="npm update --save"
alias npmo="npm outdated --depth=0"
alias npml="npm ls --depth=0"
alias npmrs="rm ./package-lock.json; rm -rf ./node_modules &; npm i"

alias cc="closure-compiler"
alias sql="sqlite3"
alias sqlite="sqlite3"
alias py="python3"
alias python="python3"

alias X="open -a /System/Library/CoreServices/ScreenSaverEngine.app"
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

alias bup="brew update && brew upgrade &&brew cleanup &&brew doctor && npmo -g; npmu -g;"
alias bupc="brew update && brew upgrade --cask && brew cleanup"

alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"





