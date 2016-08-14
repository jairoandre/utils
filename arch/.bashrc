#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la --color=auto'

if [ "$TERM" != "dumb" ] && [ "$TERM" != "emacs" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls -la -F --color=auto'
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

    export PS1="\[$GREEN\]\t\[$RED\]:\[$CYAN\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\n\$ "

fi


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