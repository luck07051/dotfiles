#!/bin/sh

export FZF_DEFAULT_OPTS='
	--height 50%
	--color=pointer:5,gutter:-1
	--no-separator
	--info=inline
	--reverse
	--bind=tab:down
	'

export FZF_DEFAULT_COMMAND="fd -HL --exclude '.git' --type file"
