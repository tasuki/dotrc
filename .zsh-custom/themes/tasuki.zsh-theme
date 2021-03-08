# tasuki's theme, adapted from agnoster

CURRENT_BG='NONE'

() {
	local LC_ALL="" LC_CTYPE="en_US.UTF-8"
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
	local bg fg
	[[ -n $1 ]] && bg="%K{$1}" || bg="%k"
	[[ -n $2 ]] && fg="%F{$2}" || fg="%f"
	if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
		echo -n "%{$bg%F{$CURRENT_BG}%}%{$fg%}"
	else
		echo -n "%{$bg%}%{$fg%}"
	fi
	CURRENT_BG=$1
	[[ -n $3 ]] && echo -n $3
}

prompt_end() {
	# close open segments
	if [[ -n $CURRENT_BG ]]; then
		echo -n "%{%k%F{$CURRENT_BG}%}"
	else
		echo -n "%{%k%}"
	fi

	# color on command success/failure
	if [[ $RETVAL -ne 0 ]]; then
		echo -n "%{%F{red}%}"
	else
		echo -n "%{%F{default}%}"
	fi

	# insert newline
	echo ""

	# root prompt with #
	if [[ $UID -eq 0 ]]; then
		echo -n "#"
	else
		echo -n "$"
	fi
	echo -n "%{%f%}"
	CURRENT_BG=''
}

### Prompt components

# Time
prompt_time() {
	prompt_segment default magenta "%D{%H:%M:%S} "
}

# Context: user@hostname (who am I and where am I)
prompt_context() {
	if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		prompt_segment default default "%(!.%{%F{red}%}.)$USER%{%F{default}%}@%{%F{cyan}%}%m "
	fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
	STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
	if [[ -n $STATUS ]]; then
		echo "*"
	else
		echo ""
	fi
}

# Git: branch/detached head, dirty status
prompt_git() {
	(( $+commands[git] )) || return

	local ref mode repo_path
	repo_path=$(git rev-parse --git-dir 2>/dev/null)

	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="$(git rev-parse --short HEAD 2> /dev/null)"
		if [[ -n $(parse_git_dirty) ]]; then
			prompt_segment default yellow
		else
			prompt_segment default green
		fi

		if [[ -e "${repo_path}/BISECT_LOG" ]]; then
			mode=" <B>"
		elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
			mode=" >M<"
		elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
			mode=" >R>"
		fi

		autoload -Uz vcs_info

		zstyle ':vcs_info:*' enable git
		zstyle ':vcs_info:*' get-revision true
		zstyle ':vcs_info:*' check-for-changes true
		zstyle ':vcs_info:*' unstagedstr '?'
		zstyle ':vcs_info:*' stagedstr '+'
		zstyle ':vcs_info:*' formats ' %u%c'
		zstyle ':vcs_info:*' actionformats ' %u%c'
		vcs_info
		echo -n "${ref/refs\/heads\//}${vcs_info_msg_0_%% }${mode} "
	fi
}

# Dir: current working directory
prompt_dir() {
	# only show last two dirs
	# prompt_segment default blue '%2~ '
	prompt_segment default blue '%~ '
}

## Main prompt
build_prompt() {
	RETVAL=$?
	prompt_time
	prompt_context
	prompt_dir
	prompt_git
	prompt_end
}

setopt prompt_subst
PROMPT='%{%f%b%k%}$(build_prompt) '
