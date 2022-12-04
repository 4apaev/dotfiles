defaults write write com.bohemiancoding.sketch3 NSNavLastRootDirectory ~/Work/sketches/svg/
defaults write write com.bohemiancoding.sketch3 NSNavLastRootDirectory ~/Work/sketches/svg
defaults write write com.bohemiancoding.sketch3 NSNavLastRootDirectory "~/Work/sketches/svg"
defaults write com.apple.addressbook ABShowDebugMenu -bool YES
defaults write com.apple.finder QLEnableXRayFolders -boolean TRUE; killall Finder
defaults write com.apple.DisableXRayForFoldersWithCustomIcons -boolean NO
defaults write com.apple.finder QLEnableXRayFolders -boolean TRUE; killall Finder
defaults write com.apple.finder FXListViewStripes -boolean TRUE; killall Finder
defaults write com.apple.finder FXListViewStripes -boolean FALSE; killall Finder
defaults write com.apple.finder FXListViewStripes -boolean TRUE; killall Finder
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false


echo "........................ Install Homebrew ........................"
echo
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
sleep 1


echo "........................ Install oh-my-zsh ........................"
echo
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sleep 1

echo "........................ Copy .zshrc & shoshi.zsh-theme ........................"
echo
cp $HOME/projects/dotfiles/zsh/.zshrc $HOME
cp $HOME/projects/dotfiles/zsh/shoshi.zsh-theme $HOME/.oh-my-zsh/custom/themes
sleep 1

echo "........................ Install packages: go, git, zsh, node, docker and docker-compose ........................"
echo
brew install go
brew install git
brew install zsh
brew install node
brew install docker
brew install docker-compose
sleep 1

echo "........................ Install casks: docker, iterm2, firefox, telegram, 1password, vscode, sublime, sublime-merge and syntax-highlight ........................"
echo
brew install --cask docker
brew install --cask iterm2
brew install --cask firefox
brew install --cask telegram
brew install --cask 1password
brew install --cask sublime-text
brew install --cask sublime-merge
brew install --cask syntax-highlight
brew install --cask visual-studio-code
sleep 1

echo "........................ Npm install globaly: typescript, eslint, mocha and stylus ........................"
echo
npm install -g typescript eslint mocha stylus
sleep 1

echo "........................ Show ~/Library and /Volumes ........................"
echo

chflags nohidden ~/Library
chflags nohidden /Volumes

echo "........................ Quit finder with: CMD + Q ........................"
echo

defaults write com.apple.finder QuitMenuItem -bool true              # Finder: quit with `cmd + q`
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true   # Finder: show full posix path in title

echo "........................ Set dock autohide delay to: 0 ........................"
echo

defaults write com.apple.dock autohide -bool true              # Dock: auto hide
defaults write com.apple.dock autohide-delay -float 0          # Dock: auto hide no animation
defaults write com.apple.dock autohide-time-modifier -float 0  # Dock: auto hide quick

echo
echo "........................ Get key repeat config ........................"
echo "          Key Repeat: $(defaults read NSGlobalDomain KeyRepeat)"
echo "  Initial Key Repeat: $(defaults read NSGlobalDomain InitialKeyRepeat)"
echo "Press & Hold Enabled: $(defaults read NSGlobalDomain ApplePressAndHoldEnabled)"
echo

# NSGlobalDomain KeyRepeat               : 2
# NSGlobalDomain InitialKeyRepeat        : 15
# NSGlobalDomain ApplePressAndHoldEnabled: 0

echo "........................ Set key repeat config ........................"
echo

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false   # KeyRepeat: Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain KeyRepeat -int 1                       # KeyRepeat: Set fast keyboard repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 10               # KeyRepeat: Set fast keyboard repeat rate

# NSGlobalDomain KeyRepeat               : 1
# NSGlobalDomain InitialKeyRepeat        : 10
# NSGlobalDomain ApplePressAndHoldEnabled: 0

defaults write com.apple.addressbook ABShowDebugMenu -bool YES
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.DisableXRayForFoldersWithCustomIcons -boolean NO
defaults write com.apple.finder FXListViewStripes -boolean TRUE; killall Finder
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false

echo "........................ Set google software update interval to: 2 days ........................"
echo

defaults write com.google.Keystone.Agent checkInterval 172800

killall Dock
killall Finder
























