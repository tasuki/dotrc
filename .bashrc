# tasuki's bashrc

# Return if shell is non-interactive
[ -z "$PS1" ] && return

# Export environment variables
export LANG="en_US.utf8"
export LC_ALL="en_US.utf8"

# Colors
  NONE='\[\e[0m\]'
  GRAY='\[\e[30m\]'
   RED='\[\e[31m\]'
 GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
  BLUE='\[\e[34m\]'
PURPLE='\[\e[35m\]'
  CYAN='\[\e[36m\]'
 WHITE='\[\e[37m\]'

# Source global bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# Clever tab completion
[ -f /etc/bash_completion ] && . /etc/bash_completion

# Welcome message
date
[ -f /usr/games/fortune ] && /usr/games/fortune wisdom people

# Set prompt
parse_git_info() {
	git name-rev HEAD 2> /dev/null | awk '{ print $2, "" }'
}
if [[ $EUID -eq 0 ]]; then
	USR="${RED}\u${NONE}"
	PROMPT="${RED}#${NONE}"
else
	USR="\u"
	PROMPT="${NONE}\$"
fi
PS1="${NONE}${USR}@${CYAN}\h ${BLUE}\w ${PURPLE}\$(parse_git_info)${PROMPT} "

case "$TERM" in
	xterm*|rxvt|Eterm|eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD}\007"'
		;;
	screen)
		# show last two folders of the current dir path
		PROMPT_COMMAND='echo -ne "\033k`echo $PWD | sed "s:.*/\(.*/.*\):\1:g"`\033\\"'
		;;
esac

# getting around
alias c='cd'                    # lazy
alias ..='cd ..'                # let me go up and up and up
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias ..l='cd .. && ls'
function lcd { cd $@ && ls; }   # cd && ls

# copying, moving, and deleting files and directories
alias rmr='rm -r'               # delete recursively
alias rmrf='rm -rf'             # force delete recursively
alias cp='cp -i'                # ask before overwrite
alias cpr='cp -ir'              # recursive copy
alias mv='mv -i'                # ask before overwrite
alias lns='ln -s'               # symlink faster
alias mkdir='mkdir -p'          # no error if existing, make parent directories as needed
function mkc { mkdir $@ && cd $@; } # create directory and jump into it
function chr { chown -R $1:$1 $2; } # change user and group recursively; quote * (or use .)
# change folder/file access rights to defaults
function chmdef { find . -type d -exec chmod 755 {} \; ; \
                  find . -type f -exec chmod 644 {} \; ; }

# editing files
export EDITOR=vim               # 'cause I'm a real man
alias v='vim'                   # lazy
alias vo='vim -O'               # vertically split buffers
alias gv='gvim'                 # fancy GUI?

# info about files
eval `dircolors ~/.xcolors/solarized-dircolors` # set bash colours
alias l='ls'                    # too lazy
alias ls='ls --color=auto'      # add colors for filetype recognition
alias ll='ls -l'                # show details
alias la='ls -al'               # show hidden files
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lh='ls -lSrh'             # sort by size, human readable
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date

alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//—/g' -e 's/^/ /' -e 's/-/|/'"
alias biggest="find . -type f -printf '%s\t%p\n' | sort -g" # find biggest files
alias duh='du -kh'              # disk usage - human readable
alias dus='du | sort -n'        # disk usage - sort by size

# info about system
alias pse='ps -e'               # all processes with threads
alias psf='ps -e --forest'      # show forest tree
alias dfh='df -Th'              # human readable df
alias routen='route -n'         # gimme routes fast
alias path='echo -e ${PATH//:/\\n}'
alias h='history'

# update dot files
alias dotrc-get='svn export --force http://svn.github.com/tasuk/dotrc.git .'
# utilities
alias g='git'                   # git is invading my life
alias sudo='sudo '              # preserve aliases when sudoing
alias scr='screen -U -d -R'     # utf, reattach (append session name)
alias less='less -r'            # display raw control chars
alias grep='grep --color=auto'  # if stuck with grep, colorize
alias acki='ack -i'             # case insensitive
alias rgrep='grep -r'
alias online='ping 4.2.2.2'     # check if online
alias pyprofile='python -m cProfile -s time'
export IGNOREEOF='1'            # require CTRL+D twice to exit
export HOSTFILE=$HOME/.hosts    # put a list of remote hosts in ~/.hosts
PATH="~/.bin:${PATH}"

# history
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=ignoreboth
shopt -s histappend

# colorful man pages
export LESS_TERMCAP_mb=$'\e[32m'
export LESS_TERMCAP_md=$'\e[32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[31m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[36m'

# colorize diff from stdin
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
