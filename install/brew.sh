if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  bash-completion2
  bats
  battery
  coreutils
  diff-so-fancy
  dockutil
  ffmpeg
  fasd
  gifsicle
  git
  git-extras
  gnu-sed --with-default-names
  grep --with-default-names
  imagemagick
  lynx
  mackup
  nano
  peco
  psgrep
  python
  shellcheck
  ssh-copy-id
  tree
  unar
  wget
  wifi-password
  autoconf
  ideviceinstaller
  openssl
  ios-deploy
  lame
  carthage
  cocoapods
  libplist
  protobuf
  dart
  ruby
  ffmpeg
  watchman
  libusb
  libxml2
  libyaml
  gradle
)

brew install "${apps[@]}"

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~

