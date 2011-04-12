# tasuki's bashrc

alias dotrc-get='svn export --force http://svn.github.com/tasuk/dotrc.git .'

# Delete this and sky will fall on your head
[ -z "$PS1" ] && return

# Please keep me sane
LANG="en_US.utf8"
LC_ALL="en_US.utf8"

# Source global bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# Clever tab completion
[ -f /etc/bash_completion ] && . /etc/bash_completion

PATH="~/.bin:${PATH}"

export HOSTFILE=$HOME/.hosts # Put a list of remote hosts in ~/.hosts

# Colors
CYAN='\[\e[1;36m\]'
BLUE='\[\e[1;34m\]'
RED='\[\e[1;31m\]'
NC='\[\e[0m\]'

# Welcome message
date
[ -f /usr/games/fortune ] && /usr/games/fortune wisdom people

if [[ $EUID -eq 0 ]]; then
	PS1="${RED}\u${NC}@${CYAN}\h ${BLUE}\w ${RED}# ${NC}"  # root prompt
else
	PS1="\u@${CYAN}\h ${BLUE}\w ${NC}\$ "  # user prompt
fi

case "$TERM" in
	xterm*|rxvt|Eterm|eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD}\007"'
		;;
	screen)
		# show last two folders of the current dir path
		PROMPT_COMMAND='echo -ne "\033k`echo $PWD | sed "s:.*/\(.*/.*\):\1:g"`\033\\"'
		;;
esac

# exporting TERM to fake value is a very bad thing
# need it for vim colors in gnome-terminal
export TERM="xterm-256color"

alias rmr='rm -r'               # delete recursively
alias rmrf='rm -rf'             # force delete recursively
alias cp='cp -i'                # ask before overwrite
alias cpr='cp -ir'              # recursive copy
alias mv='mv -i'                # ask before overwrite
alias lns='ln -s'               # symlink faster
alias mkdir='mkdir -p'          # no error if existing, make parent directories as needed

alias h='history'
alias j='jobs -l'
alias which='type -all'
alias ..='cd ..'                # let me go up and up and up
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//—/g' -e 's/^/ /' -e 's/-/|/'"
alias biggest="find . -type f -printf '%s\t%p\n' | sort -g" # find biggest files
alias path='echo -e ${PATH//:/\\n}'
alias duh='du -kh'              # disk usage - human readable
alias dus='du | sort -n'        # disk usage - sort everything by size
alias dfh='df -kTh'             # human readable df
alias ps='ps -eH'               # all processes with threads
alias routen='route -n'         # gimme routes fast
export IGNOREEOF='1'            # require CTRL+D twice to exit

alias c='cd'                    # lazy
alias v='vim'                   # I need my editor REAL FAST
alias g='gvim'                  # fancy GUI?

function lcd { cd $@ && ls; }     # cd && ls
function mkcd { mkdir $@ && cd $@; } # create directory and jump into it
alias mkc='mkcd'

eval `dircolors -b`             # colours!

# 'ls' family
alias l='ls'                    # too lazy
alias ls='ls --color=always'    # add colors for filetype recognition
alias ll='ls -l'                # show details
alias la='ls -al'               # show hidden files
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lh='ls -lSrh'             # sort by size, human readable
alias lc='ls -lcr'              # sort by change time
alias lu='ls -lur'              # sort by access time
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias tree='tree -Csu'          # nice alternative to 'ls'

alias less='less -r'
alias grep='grep --color=auto'
alias rgrep='grep -r'

alias scr='screen -U -d -R'

# change user and group recursively; quote * (or use .)
function chr { chown -R $1:$1 $2; }

# change folder/file access rights to defaults
function chmdef { find . -type d -exec chmod 755 {} \; ; \
                  find . -type f -exec chmod 644 {} \; ; }

export EDITOR=vim

alias gf='grep function'

export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=ignoreboth

shopt -s histappend

alias online='ping 4.2.2.2'

# colorful man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

alias colorize="sed \
	-e 's/\(^-.*\)/\x1b[1;31m\1\x1b[0m/g' \
	-e 's/\(^\+.*\)/\x1b[1;32m\1\x1b[0m/g' \
	-e 's/\(^@.*\)/\x1b[36m\1\x1b[0m/g'"

# if we have grc, moar colors!
if type -P grc &>/dev/null; then
	alias t='grc tail -f'
	alias ct='grc cat'
	alias netstat='grc netstat'
	alias ping='grc ping'
	alias traceroute='grc traceroute'
	function dif { grc diff -up $@ | less -FX; }
	function sv { grc svn $@ | less -FX; } # less, quit if one screen

else # if we don't have grc, colour by hand and repair long output
	alias t='tail -f'
	function dif { diff -up $@ | colorize | less -FX; }
	function sv { svn $@ | colorize | less -FX; }
fi

# source local bashrc additions
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
