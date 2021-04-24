#!/bin/zsh

# basic definitions
export ZDOTDIR=$HOME/.config/zsh 
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export SHELL=/bin/zsh

export PATH="${PATH}:$HOME/.local/bin:$HOME/.local/share/gems/bin"
export LANG="en_GB.UTF-8"

export EDITOR=vim
export VISUAL=vim
export PAGER=less
export BROWSER=elinks
export MAIL=$HOME/.local/share/mail

# define xdg dirs
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=$HOME/.cache

# clean homedir from dotfiles
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DVDCSS_CACHE="$XDG_CACHE_HOME"/dvdcss
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export GEM_HOME="$XDG_DATA_HOME"/gems
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE=-
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey 
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PULSE_COOKIE="$XDG_CONFIG_HOME"/pulse/cookie
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export RANDFILE="$XDG_DATA_HOME"/openssl/rnd
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XCURSOR_PATH=${XCURSOR_PATH}:$HOME/.local/share/icons
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
