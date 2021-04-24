# Append our default paths
appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

appendpath '/usr/local/sbin'
appendpath '/usr/local/bin'
appendpath '/usr/bin'
unset appendpath

export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

unset TERMCAP
unset MANPATH
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
