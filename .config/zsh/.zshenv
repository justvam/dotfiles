typeset -U PATH path

# for fctx5 (japanese typing)
export XMODIFIERS='@im=fcitx'

# default editor
export EDITOR='nvim'

# XDG paths
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Fixing paths
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export ANDROID_HOME="$XDG_DATA_HOME"/android/Sdk
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export KDEHOME="$XDG_CONFIG_HOME"/KDE
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export RENPY_PATH_TO_SAVES="$XDG_DATA_HOME"/renpy
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wine
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Custom PATHS
export PATH="${PATH}:${XDG_DATA_HOME}/bin"
