# tasuki's .zshrc

# Return if shell is non-interactive
[ -z "$PS1" ] && return

### Welcome message
# date
# # `strfile` to gen the .dat file
# [ -f /usr/games/fortune ] && \
# 	/usr/games/fortune ~/.local/share/games/fortunes/ | \
# 	fmt -w $(( ${COLUMNS:-60} < 60 ? ${COLUMNS:-60} : 60 ))


### User configuration

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HIST_STAMPS="yyyy-mm-dd"
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt interactive_comments

# Global
export EDITOR='nvim'
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export REPORTTIME=10            # display execution time over 10 seconds
export HOSTFILE="$HOME/.hosts"  # put a list of remote hosts in ~/.hosts
export PATH="$HOME/.bin:$HOME/.local/bin:${PATH}"

# pager
export PAGER=less
export GIT_PAGER=$(command -v delta > /dev/null && echo delta || echo less)
export LESS="-FiXRSMx4"         # quit one screen, ignorecase, noinit, display color codes, chop

# colorful man pages
export GROFF_NO_SGR=1
export LESS_TERMCAP_mb=$'\e[0m\e[31m'
export LESS_TERMCAP_md=$'\e[1m\e[32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[43m\e[1;30m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0m\e[36m'

# vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

zle -N edit-command-line
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" history-beginning-search-backward
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-beginning-search-forward

# fzf
if command -v fd > /dev/null; then
	export FZF_DEFAULT_COMMAND='fd --type f --hidden'
	export FZF_ALT_C_COMMAND='fd --type d --hidden'
else
	export FZF_DEFAULT_COMMAND='find -type f'
	export FZF_ALT_C_COMMAND='find -type d'
fi
if command -v bat > /dev/null; then
	export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"
fi

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='
--color fg:12,hl:3,fg+:15,bg+:0,hl+:1
--color info:9,prompt:6,pointer:6,marker:6,spinner:6
'


## Aliases

# getting around
alias c='cd'                    # lazy
alias ..='cd ..'                # let me go up and up and up
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

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
alias v='nvim'                   # lazy
alias vo='nvim -O'               # vertically split buffers
alias vd='nvim -'                # vim from stdin

# listing files
type dircolors > /dev/null && eval `dircolors ~/.xcolors/solarized-dircolors`

if command -v lsd > /dev/null; then
	LS_CMD="lsd"
	alias tree="lsd --tree"
else
	LS_CMD="ls --color=auto"
	alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//—/g' -e 's/^/ /' -e 's/-/|/'"
fi

alias l="$LS_CMD -v --group-directories-first"    # too lazy
alias ll="$LS_CMD -lv --group-directories-first"  # show details
alias la="$LS_CMD -lvA --group-directories-first" # show hidden files
alias lx="$LS_CMD -lX"                            # sort by extension
alias lh="$LS_CMD -lSrh"                          # sort by size, human readable
alias lt="$LS_CMD -ltr"                           # sort by date
alias biggest="find . -type f -printf '%s\t%p\n' | sort -g" # find biggest files
alias duh='du -h | sort -h'                       # disk usage - human readable
alias dumh='du -h --max-depth=1 | sort -h'        # disk usage - readable and not too many
alias dus='du | sort -h'                          # disk usage - sort by size
alias dust='dus | tail -20'                       # only the biggest 20

# plotting
alias flip="awk '{print \$2, \$1}' OFS='\t'"
alias flipprint="flip | uplot bar"

# nnn
export NNN_FCOLORS="000004020006060101050000"

# system
alias pse='ps -e'               # all processes with threads
alias psf='ps -e --forest'      # show forest tree
alias psa='ps aux --forest'     # show forest with details
alias psv='ps aux --sort vsz'   # sort by memory
alias dfh='df -Th'              # human readable df
alias h='history -i 1'          # dates, all lines
alias t='tail -f'               # tail logs
alias online='ping 4.2.2.2'     # check if online
alias s='sudo -E '              # preserve aliases when sudoing
alias sudo='sudo -E '           # preserve aliases when sudoing
alias clip="xsel --clipboard"   # copy to clipboard
function mans {
	man $1 | less -p "^ +$2"    # man search parameter
}

# tmux
function tm { tmux attach -t $@ || tmux new -s $@ } # tmux attach of create session
alias tmls='tmux ls'

# kitty
alias s='kitty +kitten ssh'
function tab {
	DIR=$(find "${1:-.}" -maxdepth 3 -type d | fzf)
	if [[ -n "$DIR" ]]; then
		ABS_DIR=$(realpath "$DIR")
		TAB_TITLE=$(basename "$ABS_DIR")
		README=$(find "$ABS_DIR" -maxdepth 1 -type f -iname 'README*' | head -n 1)

		if [[ -n "$README" ]]; then
			kitty @ launch --type tab --cwd "$ABS_DIR" --tab-title "$TAB_TITLE" -- nvim "$README"
		else
			kitty @ launch --type tab --cwd "$ABS_DIR" --tab-title "$TAB_TITLE"
		fi
		kitty @ launch --type window --cwd "$ABS_DIR"
	else
		echo "No dir selected"
	fi
}

function icat {
	if [ "$#" -eq 1 ]; then
		kitty +kitten icat "$1"
	elif [ "$#" -eq 2 ]; then
		convert "$1" -resize "$2"x"$2" png:- | kitty +kitten icat --stdin
	fi
}

# searching
alias grep='grep --color=auto'  # if stuck with grep, colorize

# docker
alias dockerrm='docker ps -a -q | xargs docker rm'
alias dockerrmi='docker images -a | grep "<none>" | awk "{print \$3}" | xargs docker rmi'

# programming
export PYTHONDONTWRITEBYTECODE=1
alias g='git'
alias m='make'

# geo
export GDAL_NUM_THREADS=ALL_CPUS

# autocomplete
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'
zstyle ':completion:*:complete:tab:*' file-patterns '*(/)'

# theme
source $HOME/.zsh-custom/themes/tasuki.zsh-theme

## plugins
function maybe_source { [ -f "$1" ] && source "$1" }

maybe_source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
maybe_source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'
ZSH_HIGHLIGHT_STYLES[comment]='fg=11'

# fzf
maybe_source /usr/share/doc/fzf/examples/key-bindings.zsh
maybe_source /usr/share/doc/fzf/examples/completion.zsh

# mise
command -v mise > /dev/null && \
	eval "$(mise activate zsh)" && \
	eval "$(mise completion zsh)"

# local overrides
maybe_source $HOME/.zshrc.local
