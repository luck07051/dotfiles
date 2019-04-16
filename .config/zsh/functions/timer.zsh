# enable $EPOCHREALTIME
# you can use `date +'%s.%N'` instead
zmodload zsh/datetime

_timer_preexec() {
	_timer_start_time=$EPOCHREALTIME
}
_timer_precmd() {
	[ -z "$_timer_start_time" ] && return
	local command_time=$(( EPOCHREALTIME - _timer_start_time ))
	unset _timer_start_time

	local t_min=$(printf '%.0f' $((command_time / 60)))
	if [ "$t_min" -gt '0' ]; then
		local sec=$((${command_time%%.*} % 60))
		local min=$((t_min % 60))
		local hour=$((t_min / 60))
		timer=$(print "$hour h $min m $sec s" | sed 's/\(0 h \)\(0 m\)\?//')
	else
		local sec=$(printf "%0.3f" $((command_time - 60 * t_min)))
		timer="$sec s"
	fi

	timer="%B%F{8}${timer}%f%b"
}

autoload -U add-zsh-hook
add-zsh-hook preexec _timer_preexec
add-zsh-hook precmd  _timer_precmd
