# tasuki's .zshrc

# Return if shell is non-interactive
[ -z "$PS1" ] && return

### Welcome message
date
[ -f /usr/games/fortune ] && /usr/games/fortune wisdom people


### User configuration

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HIST_STAMPS="yyyy-mm-dd"
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify

# Global
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='vim'
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export KEYTIMEOUT=1
export REPORTTIME=10            # display execution time over 10 seconds
export HOSTFILE="$HOME/.hosts"  # put a list of remote hosts in ~/.hosts
export PATH="$HOME/.bin:${PATH}"

# pager
export PAGER=less
export LESS="-FiXRSMx4"         # quit one screen, ignorecase, noinit, display color codes, chop

# colorful man pages
export LESS_TERMCAP_mb=$'\e[0m\e[31m'
export LESS_TERMCAP_md=$'\e[0m\e[32m'
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
if type fd > /dev/null; then
	export FZF_DEFAULT_COMMAND='fd --type f'
	export FZF_ALT_C_COMMAND='fd --type d'
elif type fdfind > /dev/null; then
	export FZF_DEFAULT_COMMAND='fdfind --type f'
	export FZF_ALT_C_COMMAND='fdfind --type d'
else
	export FZF_DEFAULT_COMMAND='find -type f'
	export FZF_ALT_C_COMMAND='find -type d'
fi
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='
--color fg:12,bg:8,hl:3,fg+:15,bg+:0,hl+:1
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
alias v='vim'                   # lazy
alias vo='vim -O'               # vertically split buffers
alias vd='vim -'                # vim from stdin

# listing files
type dircolors > /dev/null && eval `dircolors ~/.xcolors/solarized-dircolors`

alias l='ls'                    # too lazy
if uname -s | grep -q 'Darwin'; then
	alias ls='ls -G --group-directories-first'
else
	alias ls='ls --color=auto --group-directories-first'
fi
alias ll='ls -l --group-directories-first'  # show details
alias la='ls -la --group-directories-first' # show hidden files
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lh='ls -lSrh'             # sort by size, human readable
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//—/g' -e 's/^/ /' -e 's/-/|/'"
alias biggest="find . -type f -printf '%s\t%p\n' | sort -g" # find biggest files
alias duh='du -kh'              # disk usage - human readable
alias dus='du | sort -n'        # disk usage - sort by size

# system
alias pse='ps -e'               # all processes with threads
alias psf='ps -e --forest'      # show forest tree
alias psa='ps aux --forest'     # show forest with details
alias psv='ps aux --sort vsz'   # sort by memory
alias dfh='df -Th'              # human readable df
alias routen='route -n'         # gimme routes fast
alias h='history'
alias t='tail -f'               # tail logs
alias online='ping 4.2.2.2'     # check if online
alias s='sudo -E'               # preserve aliases when sudoing
alias sudo='sudo -E'            # preserve aliases when sudoing
alias clip="xsel --clipboard"   # copy to clipboard
function mans {
	man $1 | less -p "^ +$2"    # man search parameter
}

# multiplexers
alias scr='screen -U -d -R'     # utf, reattach (append session name)
function tm { tmux attach -t $@ || tmux new -s $@ } # tmux attach of create session
alias tmls='tmux ls'
function tmux-pane-percent {
	WW=$(tmux display -p '#{window_width}')
	COLS=$(expr $WW \* $@ / 100)
	tmux resize-pane -t $TMUX_PANE -x $COLS
}

# searching
alias grep='grep --color=auto'  # if stuck with grep, colorize
alias ag='ag -U'                # ignore .gitignore
alias agi='ag -Ui'              # ignore case
alias rgrep='grep -r'

# docker
alias dockerrm='docker ps -a -q | xargs docker rm'
alias dockerrmi='docker images -a | grep "<none>" | awk "{print \$3}" | xargs docker rmi'

# programming
export PYTHONDONTWRITEBYTECODE=1
alias g='git'
alias m='make'
alias pyprofile='python -m cProfile -s time'
alias pyprofile3='python3 -m cProfile -s time'
alias ctags-symfony='find src vendor \
	-name Tests -prune -o -name Features -prune -o -name "*.php" \
	-print > /tmp/ctagslist; ctags -L /tmp/ctagslist; rm /tmp/ctagslist'

# autocomplete
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

## plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_CUSTOM=$HOME/.zsh-custom
source $ZSH_CUSTOM/themes/tasuki.zsh-theme
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
source $HOME/.vim/bundle/fzf/shell/key-bindings.zsh
source $HOME/.vim/bundle/fzf/shell/completion.zsh

# local overrides
[ -f ~/.zshrc.local ] && . ~/.zshrc.local
