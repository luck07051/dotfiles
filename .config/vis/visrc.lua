require('vis')
require('plugins/filetype')

--plugins--
--require('plugins/twofinger-surround')
--require('plugins/vis-commentary/vis-commentary')
--require('plugins/vis-ctags/ctags')
--require('plugins/vis-fzf-open/fzf-open')
--require('plugins/vis-modelines/vis-modelines')
--require('plugins/vis-surround/vis-surround')
--require('plugins/vis-vim-compatibility-pack/vis-vim-compatible')

-- global configuration --
vis.events.subscribe(vis.events.INIT, function()
	vis:command('set theme uicolors')

	-- vis:map(vis.modes.NORMAL, ';', '<vis-prompt-show>')
	-- vis:map(vis.modes.NORMAL, ':', '<vis-motion-totill-repeat>')
	-- vis:map(vis.modes.VISUAL, ';', '<vis-prompt-show>')
	-- vis:map(vis.modes.VISUAL, ':', '<vis-motion-totill-repeat>')
	-- vis:map(vis.modes.OPERATOR_PENDING, ';', '<vis-prompt-show>')
	-- vis:map(vis.modes.OPERATOR_PENDING, ':', '<vis-motion-totill-repeat>')

end)

-- per-window configuration --
vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command('set number on')
	vis:command('set relativenumbers on')
	vis:command('set autoindent on')
	vis:command('set cursorline on')
	vis:command('set show-eof off')
	vis:command('set show-tab on')
end)