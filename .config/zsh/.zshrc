HISTFILE="$XDG_CACHE_HOME"/zsh/histfile
HISTSIZE=500
SAVEHIST=500
unsetopt beep
bindkey -v
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
prompt redhat
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

autoload bashcompinit
bashcompinit
eval "$(register-python-argcomplete pmbootstrap)"

# Selfmade stuff
export GPG_TTY=$(tty)
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djdk.gtk.version=3'
export FZF_BASE="/usr/share/fzf"

ex()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1  ;;
            *.tar.gz)   tar xzf $1  ;;
            *.bz2)      bunzip2 $1  ;;
            *.rar)      unrar x $1  ;;
            *.gz)       gunzip $1   ;;
            *.tar)      tar xf $1   ;;
            *.tbz2)     tar xjf $1  ;;
            *.tgz)      tar xzf $1  ;;
            *.zip)      unzip $1    ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1     ;;
            *)          echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

plugins=(
    fzf
    zsh-syntax-highlighting
)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^ ' autosuggest-accept

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

# coreutils
alias ls='lsd'
alias l='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias lt='ls --tree'
alias cp='cp -i'
alias rm='rm -I'
alias mv='mv -i'

# navigation
alias gh="cd $HOME"
alias gp="cd $HOME/pics"
alias gd="cd $HOME/dl"
alias gD="cd $HOME/docs"
alias gb="cd $HOME/docs/business"
alias gu="cd $HOME/docs/uni"
alias gt="cd $HOME/docs/research/MEP"
alias gm="cd /run/media/$(whoami)"
alias gw="cd $HOME/docs/work/pdb"
alias gc="cd $XDG_CONFIG_HOME"

# configs
alias cfi="vim $XDG_CONFIG_HOME/i3/config"
alias cfs="vim $XDG_CONFIG_HOME/sway/config"
alias cfv="vim $XDG_CONFIG_HOME/vim/vimrc"
alias cfb="vim $XDG_CONFIG_HOME/i3blocks/config"
alias cfz="vim $XDG_CONFIG_HOME/zsh/.zshrc"
alias cfx="vim $XDG_CONFIG_HOME/X11/xresources"
alias cfr="vim $XDG_CONFIG_HOME/ranger/rc.conf"
alias cft="vim $XDG_CONFIG_HOME/tmux/tmux.conf"
alias cfp="vim $XDG_CONFIG_HOME/zsh/.zprofile"
alias cfw="vim $XDG_CONFIG_HOME/waybar/config"
alias cfq="vim $XDG_CONFIG_HOME/qutebrowser/config.py"

# docs
alias cv="cd $HOME/docs/business/cv && vim cv.tex"
alias dagger="$XDG_DATA_HOME/Daggerfall/DaggerfallUnity.x86_64"
alias pdagger="prime-run $XDG_DATA_HOME/Daggerfall/DaggerfallUnity.x86_64"
alias vpnu="sudo systemctl start wg-quick@wg0.service"
alias vpns="systemctl status wg-quick@wg0.service"
alias vpnd="sudo systemctl stop wg-quick@wg0.service"
alias hf="history | fzf"
alias syexd="rsync -ah --progress --del --append $HOME/ /run/media/$(whoami)/exd/recent/"
alias syhdd="rsync -ah --progress --del --append $HOME/ /run/media/$(whoami)/hdd/recent/"
alias thumb="convert -colorspace sRGB -alpha remove -background white -density 150"
alias gscom="gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compress.pdf" # input.pdf
alias sway="export QT_QPA_PLATFORM=wayland && export QT_QPA_PLATFORMTHEME=qt5ct && export BROWSER=qutebrowser && sway --my-next-gpu-wont-be-nvidia"
alias pd="pomodoro"
alias zaz="yay"
alias myip='curl http://ipecho.net/plain; echo'
alias wlsunset="wlsunset -t 4500 -T 6500 -l 52.23 -L 4.38"

# monitors
alias mr="xrandr --output HDMI1 --right-of eDP1 --auto"
alias ml="xrandr --output HDMI1 --left-of eDP1 --auto"
alias ms="xrandr --output HDMI1 --same-as eDP1 --auto"
alias md="xrandr --output HDMI1 --off"

# home clean-up
alias abook="abook --config "$XDG_CONFIG_HOME"/abook/abookrc --datafile "$XDG_CACHE_HOME"/abook/addressbook"
alias calcurse="calcurse -D $XDG_CONFIG_HOME/calcurse/"
alias mailsync="mailsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc"
alias nvidia-settings="nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias units="units --history $XDG_CACHE_HOME/units_history"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts" 
alias startx="startx "$XDG_CONFIG_HOME/X11/xinitrc""
alias dotfiles='/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME'
#alias mbsync="mbsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc"
