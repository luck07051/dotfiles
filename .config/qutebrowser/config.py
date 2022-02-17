
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

ColorScheme = [
    '#1c1c1c', '#cf6868', '#87af87', '#ebcb8b',
    '#81a1c1', '#ffb9dc', '#87afaf', '#d0d0d0', 

    '#585858', '#e59999', '#94c68b', '#f6b26b', 
    '#68adcf', '#d5b0ff', '#87d1bc', '#808080']

Terminal = 'alacritty'


# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)
# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

c.scrolling.smooth = True

c.editor.command = [Terminal, '-e', 'nvim', '-f', '{file}']

c.messages.timeout = 5000


#====================URL====================#
c.url.default_page = 'https://start.duckduckgo.com/'
c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        'd': 'https://duckduckgo.com/?q={}',
        'a': 'https://wiki.archlinux.org/?search={}',
        'y': 'https://www.youtube.com/results?search_query={}'
        }


#====================BINDINGS====================#
# Map keys to other keys, so that they are equivalent in all modes.
c.bindings.key_mappings = {
        '<Ctrl+6>': '<Ctrl+^>',
        '<Ctrl+Enter>': '<Ctrl+Return>',
        '<Ctrl+i>': '<Tab>',
        '<Ctrl+j>': '<Return>',
        '<Ctrl+m>': '<Return>',
        '<Ctrl+[>': '<Escape>',
        '<Enter>': '<Return>',
        '<Shift+Enter>': '<Return>',
        '<Shift+Return>': '<Return>'
        }

config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')


#====================DOWNLOADS====================#
c.downloads.location.directory = '~/downloads'
c.downloads.position = 'bottom'
c.downloads.remove_finished = 30000


#====================CONTENT====================#
c.content.autoplay = False

# default
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 
        'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent',
        'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent',
        'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')


#====================FILESELECT====================#
c.fileselect.folder.command = [Terminal, "-e", "ranger", "--choosedir={}"]
c.fileselect.multiple_files.command = [Terminal, "-e", "ranger", "--choosefiles={}"]
c.fileselect.single_file.command = [Terminal, "-e", "ranger", "--choosefile={}"]


#====================HINTS====================#
c.hints.chars = 'asdfghjkl'
c.hints.uppercase = True
c.hints.hide_unmatched_rapid_hints = False
c.hints.border = '0px'
c.hints.radius = 1


#====================TABS====================#
c.tabs.title.format = '{audio}{index}. {current_title}'
c.tabs.indicator.width = 0
c.tabs.padding = {"bottom": 1, "top": 1, "left": 5, "right": 5}


#====================FONTS====================#
c.fonts.default_family = 'MesloLGS Nerd Font'
c.fonts.default_size = '10.5pt'


#====================STATUSBAR====================#
c.statusbar.padding = {"bottom": 1, "top": 1, "left": 4, "right": 4}
c.statusbar.widgets = ["keypress", "url", "scroll", "history", "tabs", "progress"]


#====================COLORS====================#
#===completion===#
c.colors.completion.category.bg = ColorScheme[8]
c.colors.completion.category.border.bottom = 'rgba(0, 0, 0, 0%)'
c.colors.completion.category.border.top = 'rgba(0, 0, 0, 0%)'
c.colors.completion.category.fg = ColorScheme[7]
c.colors.completion.even.bg = ColorScheme[0]
c.colors.completion.odd.bg = ColorScheme[0]
c.colors.completion.fg = [ColorScheme[7], ColorScheme[15], ColorScheme[15]] 
c.colors.completion.match.fg = ColorScheme[5]

c.colors.completion.item.selected.bg = ColorScheme[3]
c.colors.completion.item.selected.border.bottom = 'rgba(0, 0, 0, 0%)'
c.colors.completion.item.selected.border.top = 'rgba(0, 0, 0, 0%)'
c.colors.completion.item.selected.fg = ColorScheme[0]
c.colors.completion.item.selected.match.fg = ColorScheme[0]

c.colors.completion.scrollbar.bg = ColorScheme[0]
c.colors.completion.scrollbar.fg = ColorScheme[7]

#===contextmenu===#
#c.colors.contextmenu.disabled.bg (Current: )
#c.colors.contextmenu.disabled.fg (Current: )
#c.colors.contextmenu.menu.bg (Current: )
#c.colors.contextmenu.menu.fg (Current: )
#c.colors.contextmenu.selected.bg (Current: )
#c.colors.contextmenu.selected.fg (Current: )

#===downloads===#
c.colors.downloads.bar.bg = ColorScheme[0]
c.colors.downloads.start.bg = ColorScheme[4]
c.colors.downloads.start.fg = ColorScheme[0]
c.colors.downloads.stop.bg = ColorScheme[10]
c.colors.downloads.stop.fg = ColorScheme[0]
c.colors.downloads.error.bg = ColorScheme[1]
c.colors.downloads.error.fg = ColorScheme[0]

#===hints===#
c.colors.hints.bg = 'rgba(255, 185, 220, 90%)'
c.colors.hints.fg = ColorScheme[0]
c.colors.hints.match.fg = ColorScheme[6]

#===keyhint===#
c.colors.keyhint.bg = 'rgba(28, 28, 28, 90%)'
c.colors.keyhint.fg = ColorScheme[7]
c.colors.keyhint.suffix.fg = ColorScheme[11]

#===messages===#
c.colors.messages.error.bg = ColorScheme[1]
c.colors.messages.error.fg = ColorScheme[0]
c.colors.messages.error.border = ColorScheme[1]
c.colors.messages.info.bg = ColorScheme[0]
c.colors.messages.info.fg = ColorScheme[7]
c.colors.messages.info.border = ColorScheme[0]
c.colors.messages.warning.bg = ColorScheme[11]
c.colors.messages.warning.fg = ColorScheme[0]
c.colors.messages.warning.border = ColorScheme[11]

#===prompts===#
c.colors.prompts.bg = ColorScheme[8]
c.colors.prompts.fg = ColorScheme[7]
c.colors.prompts.border = 'rgba(0, 0, 0, 0%)'
c.colors.prompts.selected.bg = ColorScheme[15]
c.colors.prompts.selected.fg = ColorScheme[7]

#===statusbar===#
c.colors.statusbar.normal.bg = ColorScheme[0]
c.colors.statusbar.normal.fg = ColorScheme[7]

c.colors.statusbar.insert.bg = ColorScheme[2]
c.colors.statusbar.insert.fg = ColorScheme[0]

c.colors.statusbar.caret.bg = ColorScheme[13]
c.colors.statusbar.caret.fg = ColorScheme[0]
c.colors.statusbar.caret.selection.bg = ColorScheme[13]
c.colors.statusbar.caret.selection.fg = ColorScheme[0]

c.colors.statusbar.command.bg = ColorScheme[0]
c.colors.statusbar.command.fg = ColorScheme[7]

#c.colors.statusbar.passthrough.bg
#c.colors.statusbar.passthrough.fg

#c.colors.statusbar.progress.bg

#c.colors.statusbar.private.bg
#c.colors.statusbar.private.fg
#c.colors.statusbar.command.private.bg = ColorScheme[0]
#c.colors.statusbar.command.private.fg = ColorScheme[7]

c.colors.statusbar.url.fg = ColorScheme[7]
c.colors.statusbar.url.success.http.fg = ColorScheme[7]
c.colors.statusbar.url.success.https.fg = ColorScheme[7]
c.colors.statusbar.url.hover.fg = ColorScheme[6]
c.colors.statusbar.url.warn.fg = ColorScheme[9]
c.colors.statusbar.url.error.fg = ColorScheme[3]

#===tabs===#
c.colors.tabs.bar.bg = ColorScheme[0]

c.colors.tabs.even.bg = ColorScheme[0]
c.colors.tabs.even.fg = ColorScheme[7]
c.colors.tabs.odd.bg = ColorScheme[0]
c.colors.tabs.odd.fg = ColorScheme[7]
c.colors.tabs.selected.even.bg = ColorScheme[7]
c.colors.tabs.selected.even.fg = ColorScheme[0]
c.colors.tabs.selected.odd.bg = ColorScheme[7]
c.colors.tabs.selected.odd.fg = ColorScheme[0]

c.colors.tabs.pinned.even.bg = ColorScheme[6]
c.colors.tabs.pinned.even.fg = ColorScheme[0]
c.colors.tabs.pinned.odd.bg = ColorScheme[6]
c.colors.tabs.pinned.odd.fg = ColorScheme[0]
c.colors.tabs.pinned.selected.even.bg = ColorScheme[4]
c.colors.tabs.pinned.selected.even.fg = ColorScheme[0]
c.colors.tabs.pinned.selected.odd.bg = ColorScheme[4]
c.colors.tabs.pinned.selected.odd.fg = ColorScheme[0]

#c.colors.tabs.indicator.error = ColorScheme[1]
#c.colors.tabs.indicator.start = ColorScheme[3]
#c.colors.tabs.indicator.stop = 'rgba(0, 0, 0, 0%)'
#c.colors.tabs.indicator.system (Current: rgb)

#===webpage===#
#c.colors.webpage.bg (Current: white)
#c.colors.webpage.darkmode.algorithm (Current: lightness-cielab)
#c.colors.webpage.darkmode.contrast (Current: 0.0)
#c.colors.webpage.darkmode.enabled (Current: false)
#c.colors.webpage.darkmode.grayscale.all (Current: false)
#c.colors.webpage.darkmode.grayscale.images (Current: 0.0)
#c.colors.webpage.darkmode.policy.images (Current: smart)
#c.colors.webpage.darkmode.policy.page (Current: smart)
#c.colors.webpage.darkmode.threshold.background (Current: 0)
#c.colors.webpage.darkmode.threshold.text (Current: 256)
c.colors.webpage.preferred_color_scheme = 'dark'
