# # enable vcs info to get git status (vcs is version control system)
# autoload -Uz vcs_info
#
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git*' formats '%b'

_vcs_precmd(){
	# vcs_info
	# [ -z "$vcs_info_msg_0_" ] && return

	if ! git status --porcelain --branch >/dev/null 2>&1; then
		return
	fi

	# [doc](https://git-scm.com/docs/git-status)
	local git_status=$(git status --porcelain --branch)
	local branch=$(echo $git_status | grep -oP '^## \K.*(?=\.\.\.)')
	local ahead=$(echo $git_status | grep -oP '\[ahead \K[0-9]+')
	local behind=$(echo $git_status | grep -oP '\[behind \K[0-9]+')
	local staged=$(echo $git_status | grep -c '^[^U#?!] ')
	local unstaged=$(echo $git_status | grep -c '^[^U#?!][^U#?! ]')
	local unmerged=$(echo $git_status | grep -c '^.\?U')
	# local untracked=$(echo $git_status | grep -c '^??')

	# ↓↑✔●✖✚
	local p_branch="%F{cyan}$branch%f"
	[ -n "$ahead" ]         && local p_ahead="↑$ahead"
	[ -n "$behind" ]        && local p_behind="↓$behind"
	[ "$staged" != '0' ]    && local p_staged="%F{green}$staged%f"
	[ "$unstaged" != '0' ]  && local p_unstaged="%F{blue}$unstaged%f"
	[ "$unmerged" != '0' ]  && local p_unmerged="%F{red}$unmerged%f"
	# [ "$untracked" != '0' ] && local p_untracked="…$untracked"

	local p_file_status=$(printf '[%s%s%s]' "$p_staged" "$p_unstaged" "$p_unmerged" | sed 's/\[ */\[/; s/ *\]/\]/; / \[\]/d')

	vcs=$(printf '%s %s%s %s' "$p_branch" "$p_ahead" "$p_behind" "$p_file_status" | sed 's/ \+/ /g; s/ $//')
}

autoload -U add-zsh-hook
add-zsh-hook precmd  _vcs_precmd
