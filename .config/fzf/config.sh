#!/bin/sh

export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up
	--height 50%
	--color=pointer:5,gutter:-1
	--no-separator
	--info=inline
	--reverse'

export FZF_DEFAULT_COMMAND="fd -HL --exclude '.git' --type file"
