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
parse_chroot_info() {
	if [ "$debian_chroot" ]; then
		echo "${debian_chroot} "
	fi
}
parse_git_info() {
	if type -t __git_ps1 | grep -q 'function'; then
		__git_ps1 '%s '
	else
		git branch 2> /dev/null | sed -n '/^\*/s/^\* \(.*\)$/\1 /p'
	fi
}
if [[ $EUID -eq 0 ]]; then
	USR="${RED}\u${NONE}"
	PROMPT="${RED}#${NONE}"
else
	USR="\u"
	PROMPT="${NONE}\$"
fi
PS1="${NONE}${USR}@${CYAN}\h ${YELLOW}\$(parse_chroot_info)${BLUE}\w ${PURPLE}\$(parse_git_info)${PROMPT} "

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
alias vd='vim -'                # vim from stdin
alias gv='gvim'                 # fancy GUI?

# info about files
type -t dircolors > /dev/null && eval `dircolors ~/.xcolors/solarized-dircolors` # set bash colours
alias l='ls'                    # too lazy
# add colors for filetype recognition
if uname -s | grep -q 'Darwin'; then
	alias ls='ls -G'
else
	alias ls='ls --color=auto'
fi
alias ll='ls -l'                # show details
alias la='(LC_ALL=C; ls -al --group-directories-first)' # show hidden files
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lh='ls -lSrh'             # sort by size, human readable
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//—/g' -e 's/^/ /' -e 's/-/|/'"
alias biggest="find . -type f -printf '%s\t%p\n' | sort -g" # find biggest files
alias duh='du -kh'              # disk usage - human readable
alias dus='du | sort -n'        # disk usage - sort by size
alias t='tail -f'               # follow

# info about system
alias pse='ps -e'               # all processes with threads
alias psf='ps -e --forest'      # show forest tree
alias psa='ps aux --forest'     # show forest with details
alias psv='ps aux --sort vsz'   # sort by memory
alias dfh='df -Th'              # human readable df
alias routen='route -n'         # gimme routes fast
alias path='echo -e ${PATH//:/\\n}'
alias h='history'
alias online='ping 4.2.2.2'     # check if online

# multiplexers
alias scr='screen -U -d -R'     # utf, reattach (append session name)
alias tn='tmux new -s'          # tmux new session (append session name)
alias ta='tmux attach -t'       # tmux attach (append session name)

# searching
alias grep='grep --color=auto'  # if stuck with grep, colorize
alias acki='ack -i'             # case insensitive
alias ag='ag -U'                # ignore .gitignore
alias agi='ag -Ui'              # ignore case
alias rgrep='grep -r'

# pager
export PAGER=less
export LESS="-FiXRSMx4"         # quit one screen, ignorecase, noinit, display color codes, chop

# colorful man pages
export LESS_TERMCAP_mb=$'\e[32m'
export LESS_TERMCAP_md=$'\e[32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[31m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[36m'

# history
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=ignoreboth
shopt -s histappend

# random
alias sudo='sudo '              # preserve aliases when sudoing
export IGNOREEOF='1'            # require CTRL+D twice to exit
export HOSTFILE=$HOME/.hosts    # put a list of remote hosts in ~/.hosts
PATH="~/.bin:${PATH}"


# git shortcut and its autocompletion
alias g='git'
[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
	|| complete -o default -o nospace -F _git g 2>/dev/null

# docker
alias dockerrm='docker ps -a -q | xargs docker rm'
alias dockerrmi='docker images -a | grep "<none>" | awk "{print \$3}" | xargs docker rmi'

# programming
alias pyprofile='python -m cProfile -s time'
alias pyprofile3='python3 -m cProfile -s time'
alias ctags-symfony='find src vendor \
	-name Tests -prune -o -name Features -prune -o -name "*.php" \
	-print > /tmp/ctagslist; ctags -L /tmp/ctagslist; rm /tmp/ctagslist'

# colorize diff from stdin
alias colorize="sed \
	-e 's/\(^-.*\)/\x1b[31m\1\x1b[0m/g' \
	-e 's/\(^\+.*\)/\x1b[32m\1\x1b[0m/g' \
	-e 's/\(^@.*\)/\x1b[36m\1\x1b[0m/g'"

function dif { diff -up $@ | colorize | less -FX; }


# source local bashrc additions
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
