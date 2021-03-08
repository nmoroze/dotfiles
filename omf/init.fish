# Make Homewbrew install directory higher priority
set -g -x PATH /usr/local/bin $PATH

# Add Homebrew /sbin to path
set -g -x PATH /usr/local/sbin $PATH

# Add Haskell Stack/pipx install directory
set -g -x PATH /Users/noah/.local/bin $PATH

# Add Doom emacs
set -g -x PATH /Users/noah/.emacs.d/bin $PATH

# Disable virtualenv prompt change since my custom prompt already has it
set -g -x VIRTUAL_ENV_DISABLE_PROMPT 1

# enable Nerd fonts support
set -g theme_nerd_fonts yes

# Search for MacOS-specific functions only if we're running MacOS
if test (uname) = Darwin
    set -g fish_function_path ~/.config/fish/functions/macos $fish_function_path
end
