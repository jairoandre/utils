# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# "repeat" command.  Like:
#	repeat 10 echo foo
repeat (){ 
    local count="$1" i;
    shift;
    for i in $(seq 1 "$count");
    do
        eval "$@";
    done
}
function _gittar ()
{
    local name=$(pwd)
    name=${name##*/}

    if [ ! "$1" ]; then
	echo "[ERROR] what branch to export?"
	return 1
    fi

    local date=$(TZ=UTC date '+%Y%m%d.%H%M')
    local pkg="$name-$date"
    local dir=".."
    local tar="$dir/$pkg.tar.gz"

    git archive \
    --format=tar \
    --prefix="$pkg/" \
    "$@" |
    gzip --best > "$tar"

    echo $tar
}
# psgrep firef          # check if firefox is running...
# pskill firef          # and kill it
psgrep(){
	ps aux | grep $1 | grep -v grep
}
pskill(){
	local pid
	pid=$(ps ax | grep $1 | grep -v grep | awk '{ print $1 }')
	echo -n "killing $1 (process $pid)..."
	kill -9 $pid
	echo "slaughtered."
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
    *)
    ;;
esac

# enable color support
if [ "$TERM" != "dumb" ] && [ "$TERM" != "emacs" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls -F --color=auto'
    alias grep='grep --color=auto'
    # fancy prompt
    GREEN="\e[32m"
    CYAN="\e[36m"
    GRAY="\e[37m"
    BLUE="\e[34m"
    YELLOW="\e[33m"
    RED="\e[39m"
    MAGENTA="\e[95m"
    NORMAL="\e[39m"
    source ~/.git-prompt.sh
    #export PS1="${debian_chroot:+($debian_chroot)}${GREEN}\u${CYAN}@${BLUE}\h${CYAN}:${YELLOW}\w${NORMAL}\$(__git_ps1)\$\n "
    #export PS1="\[$GREEN\]\t\[$RED\]:\[$CYAN\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
    #export PS1="\[$GREEN\]\t\[$CYAN\]@\[$YELLOW\]\[$YELLOW\]\w\[$NORMAL\]\[$MAGENTA\]\n\$(__git_ps1)\$ "
    PROMPT_COMMAND='__git_ps1 "\[$GREEN\]\t\[$CYAN\]@\[$YELLOW\]\[$YELLOW\]\w\[$NORMAL\]\[$MAGENTA\]" "\n\\\$ "'
fi

# bota /var/www no PATH do cd
#export CDPATH='.:/var/www/'

# some more ls aliases
alias l="ls -l "
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# and yet more aliases
# to keep your life safer...
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
# to keep your life easier...
alias h='history'
alias j="jobs -l"
alias pu="pushd"
alias po="popd"
alias texclean='rm -f *.toc *.aux *.lo[gft] *.d *.bbl *.blg *.cp *.fn *.tp *.vr *.pg *.ky */*.aux'
alias iso2utf='iconv -f iso-8859-1 -t utf-8'
alias utf2iso='iconv -t iso-8859-1 -f utf-8'
alias clean='echo -n "Really clean this directory?";
	read yorn;
	if test "$yorn" = "y"; then
	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	   echo "Cleaned.";
	else
	   echo "Not cleaned.";
	fi'
# and to keep your life happier!
alias open='xdg-open'
alias e='gvim -p'
alias ee='emacsclient'

export EDITOR=vim
export PATH=~/bin:$PATH
export PYTHONPATH=~/lib/python


export GOROOT=$HOME/go
export GOOS=linux
export GOARCH=386




alias less='less -r'
# --show-control-chars: help showing Korean or accented characters
alias ls='ls -F --color --show-control-chars'
alias ll='ls -l'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit -m '
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '
alias pserver='python -m SimpleHTTPServer'
alias gcheck='git checkout -- .'
alias gstart='sh ~/bin/glassfish4/glassfish/bin/asadmin start-domain'
alias gstop='sh ~/bin/glassfish4/glassfish/bin/asadmin stop-domain'
alias wpserver='webpack-dev-server --host localhost --port 3000'
alias lanceapi='cd ~/projects/lance/lance-api'
alias lanceweb='cd ~/projects/lance/lance-web'
alias zuppainel='cd ~/projects/zup-painel'
cd ~
