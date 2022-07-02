echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Install Homebrew"
echo

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

sleep 1

echo
echo "------------------------------------------------------------------------------------"
echo
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Install Oh My Zsh"
echo
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sleep 1

cp .zshrc $HOME

echo
echo "------------------------------------------------------------------------------------"
echo
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Install packages"
echo

brew install git
brew install node
brew install docker
brew install docker-compose

brew install --cask sublime-text
brew install --cask sublime-merge
brew install --cask visual-studio-code
brew install --cask syntax-highlight

brew install --cask font-ibm-plex
brew install --cask font-fira-code

echo
echo "------------------------------------------------------------------------------------"
echo
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Install global node modules"
echo
npmi -g typescript eslint mocha stylus

echo
echo "------------------------------------------------------------------------------------"
echo
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Config Dock & Finder"
echo
chflags nohidden ~/Library
chflags nohidden /Volumes

defaults write com.apple.finder QuitMenuItem -bool true              # Finder: quit with `cmd + q`
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true   # Finder: show full posix path in title

defaults write com.apple.dock autohide -bool true                    # Dock: auto hide
defaults write com.apple.dock autohide-delay -float 0                # Dock: auto hide no animation
defaults write com.apple.dock autohide-time-modifier -float 0        # Dock: auto hide quick

echo
echo "------------------------------------------------------------------------------------"
echo
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Config Key Repeat"
echo
defaults read NSGlobalDomain KeyRepeat                               # read KeyRepeat
defaults read NSGlobalDomain InitialKeyRepeat                        # read InitialKeyRepeat
defaults read | grep ApplePressAndHoldEnabled                        # read ApplePressAndHoldEnabled

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false   # KeyRepeat: Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain KeyRepeat -int 1                       # KeyRepeat: Set fast keyboard repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 10               # KeyRepeat: Set fast keyboard repeat rate

echo "------------------------------------------------------------------------------------"

killall Dock
killall Finder


