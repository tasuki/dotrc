# tasuki's bashrc

function dotrc-get { svn export --force http://svn.github.com/tasuk/dotrc.git . ; }

# Delete this and sky will fall on your head
[ -z "$PS1" ] && return

# Please keep me sane
LANG="en_US.utf8"
LC_ALL="en_US.utf8"

# source global bashrc
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

# clever tab completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

PATH="~/.bin:${PATH}"

#export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HOSTFILE=$HOME/.hosts # Put a list of remote hosts in ~/.hosts

# Colors
CYAN='\e[1;36m'
BLUE='\e[1;34m'
RED='\e[1;31m'
NC='\e[0m'

#echo -e "${CYAN}$USER@$HOSTNAME ${NC}"
date
if [ -f /usr/games/fortune ]; then
	/usr/games/fortune wisdom people
fi

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
		# show last three folders of the current dir
		PROMPT_COMMAND='echo -ne "\033k`echo $PWD | sed "s:.*/\(.*/.*/.*\):\1:g"`\033\\"'
		;;
esac

alias rmr='rm -r'               # delete recursively
alias rmrf='rm -rf'             # force delete recursively
alias cp='cp -i'                # ask before overwrite
alias cpr='cp -ir'              # recursive copy
alias mv='mv -i'                # ask before overwrite
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
alias path='echo -e ${PATH//:/\\n}'
alias duh='du -kh'              # disk usage - human readable
alias dus='du | sort -n'        # disk usage - sort everything by size
alias dfh='df -kTh'             # human readable df
alias ps='ps -eH'               # all processes with threads
alias routen='route -n'         # gimme routes fast

alias c='cd'                    # lazy
alias v='vim'                   # I need my editor REAL FAST
alias g='gvim'                  # fancy GUI?

function lcd { cd $@ && ls; }     # cd && ls
function mkcd { mkdir $@ && cd $@; } # create directory and jump into it
alias mkc='mkcd'

eval `dircolors -b`             # colours!

# 'ls' family
alias l='ls'                    # too lazy
alias ls='ls -h --color=always' # add colors for filetype recognition
alias ll='ls -l'                # show details
alias la='ls -al'               # show hidden files
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'              # sort by change time
alias lu='ls -lur'              # sort by access time
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias tree='tree -Csu'          # nice alternative to 'ls'

alias less='less -r'
alias grep='grep --color=always'
alias rgrep='grep -r'

export EDITOR=vim

alias gf='grep function'

shopt -s histappend

export HISTSIZE=1000
export HISTFILESIZE=1000

alias online='ping 4.2.2.2'




# TMP: anything below can change anytime
alias external='mount -t vboxsf vita ~/external'

alias vimftp='vim ftp://tasuki.org@ftp4.profitux.cz//'
alias gvimftp='gvim ftp://tasuki.org@ftp4.profitux.cz//'

# ssh aliases
alias domu='ssh vita@doma'
alias darken='ssh tasuki@darken.gbas.sk'

alias dev='ssh vit.brunner@dev'
alias dev2='ssh vit.brunner@dev2'
alias web6='ssh vit.brunner@web6'
alias web18='ssh vit.brunner@web18'
alias web19='ssh vit.brunner@web19'
alias shstaging='ssh vit.brunner@shstaging'

