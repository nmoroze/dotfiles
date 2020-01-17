# Make Homewbrew install directory higher priority
set -g -x PATH /usr/local/bin $PATH

# Add Homebrew /sbin to path
set -g -x PATH /usr/local/sbin $PATH

# Add Haskell Stack install directory
set -g -x PATH /Users/noah/.local/bin/ $PATH

