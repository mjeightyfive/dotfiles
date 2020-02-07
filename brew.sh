#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install zsh

brew install fdupes

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# Install `wget` with IRI support.
brew install wget

# Install more recent versions of some macOS tools.
brew install vim

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

brew install nvim
brew install tmux
brew install grep
brew install openssh
brew install screen
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install rsync
brew install fd
brew install hyperfine
brew install bat
brew install fzf
brew install ncdu
brew install ack
brew install ag
brew install noti

# o_O
brew tap exolnet/homebrew-deprecated
brew install php@7.1
brew link php@7.1 --force

# Install other useful binaries.
brew install ack
brew install git-lfs
brew install webp
brew install gs
brew install imagemagick
brew install rename
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install vbindiff
brew install ydiff
brew install zopfli
brew install neofetch
brew install m-cli
brew install awscli
brew install yarn
brew install fx
brew install python3
brew cask install proxyman

# Remove outdated versions from the cellar.
brew cleanup
