
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

import os
import subprocess


# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)
# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True
# Duration (in milliseconds) to show messages in the statusbar for.
c.messages.timeout = 2000


#====================URL====================#
# Page to open if :open -t/-b/-w is used without URL.
c.url.default_page = 'https://start.duckduckgo.com'
# Page to open at the start.
c.url.start_pages = 'https://start.duckduckgo.com'
# Search engines which can be used via the address bar.
c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        'dd': 'https://duckduckgo.com/?q={}',

        'aw': 'https://wiki.archlinux.org/?search={}',
        'yt': 'https://www.youtube.com/results?search_query={}',
        'gh': 'https://github.com/search?q={}',

        # translator
        'tg': 'https://translate.google.com/?sl=en&tl=zh-TW&text={}&op=translate',
        'tc': 'https://dictionary.cambridge.org/us/dictionary/english-chinese-traditional/{}',
        'tm': 'https://www.merriam-webster.com/dictionary/{}',
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
        '<Shift+Return>': '<Return>',
        }

# Use scroll command instead arrow key.
config.bind('j', 'scroll-px 0 40')
config.bind('k', 'scroll-px 0 -40')
config.bind('h', 'scroll-px -40 0')
config.bind('l', 'scroll-px 40 0')

# Let J, K works straight.
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

# Hide statusbar or tabbar.
config.bind('xb', 'config-cycle statusbar.show always in-mode')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always in-mode;; config-cycle tabs.show always never')

# Insert mode
config.bind("<Ctrl-a>", "fake-key <Home>", "insert")
config.bind("<Ctrl-e>", "fake-key <End>", "insert")
config.bind("<Ctrl-b>", "fake-key <Left>", "insert")
config.bind("<Mod1-b>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Ctrl-f>", "fake-key <Right>", "insert")
config.bind("<Mod1-f>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Ctrl-p>", "fake-key <Up>", "insert")
config.bind("<Ctrl-n>", "fake-key <Down>", "insert")

config.bind("<Ctrl-d>", "fake-key <Delete>", "insert")
config.bind("<Mod1-d>", "fake-key <Ctrl-Delete>", "insert")
config.bind("<Ctrl-h>", "fake-key <Backspace>", "insert")
config.bind("<Ctrl-w>", "fake-key <Ctrl-Backspace>", "insert")
config.bind("<Ctrl-u>", "fake-key <Shift-Home><Delete>", "insert")
config.bind("<Ctrl-k>", "fake-key <Shift-End><Delete>", "insert")

config.bind("<Ctrl-x><Ctrl-e>", "edit-text", "insert")

# quick translate
config.bind(',g', 'open -w tg {primary}')

# swap ';' to ':' and ',' to ';'
config.bind(';', 'set-cmd-text :')
config.bind(',I', 'hint images tab')
config.bind(',O', 'hint links fill :open -t -r {hint-url}')
config.bind(',R', 'hint --rapid links window')
config.bind(',Y', 'hint links yank-primary')
config.bind(',b', 'hint all tab-bg')
config.bind(',d', 'hint links download')
config.bind(',f', 'hint all tab-fg')
config.bind(',h', 'hint all hover')
config.bind(',i', 'hint images')
config.bind(',o', 'hint links fill :open {hint-url}')
config.bind(',r', 'hint --rapid links tab-bg')
config.bind(',t', 'hint inputs')
config.bind(',y', 'hint links yank')

config.bind(',m', 'hint links spawn mpv {hint-url}')


#====================DOWNLOADS====================#
# Directory to save downloads to.
c.downloads.location.directory = '~/downloads'
# Where to show the downloaded files.
c.downloads.position = 'bottom'
# Duration (in milliseconds) to wait before removing finished downloads.
c.downloads.remove_finished = 30000

#====================CONTENT====================#
# Automatically start playing `<video>` elements.
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
# Handler for selecting file(s) in forms.
c.fileselect.handler = 'external'
# Command (and arguments) to use for selecting a folder/file in forms.
c.fileselect.folder.command = [
        os.environ['TERMINAL'], '--class', 'floating',
        "-o", "window.opacity=0.90",
        "-e", "ranger", "--choosedir={}"]
c.fileselect.multiple_files.command = [
        os.environ['TERMINAL'], '--class', 'floating',
        "-o", "window.opacity=0.90",
        "-e", "ranger", "--choosefiles={}"]
c.fileselect.single_file.command = [
        os.environ['TERMINAL'], '--class', 'floating',
        "-o", "window.opacity=0.90",
        "-e", "ranger", "--choosefile={}"]
# Editor to use for the `edit-*` commands.
c.editor.command = [
        os.environ['TERMINAL'], '--class', 'floating',
        "-o", "window.opacity=0.90",
        '-e', os.environ['EDITOR'], '-f', '{file}']


#====================HINTS====================#
# Characters used for hint strings.
c.hints.chars = 'asdfghjkl'
# Make characters in hint strings uppercase.
c.hints.uppercase = True
# Hide unmatched hints in rapid mode.
c.hints.hide_unmatched_rapid_hints = False
# CSS border value for hints.
c.hints.border = '0px'
# Rounding radius (in pixels) for the edges of hints.
c.hints.radius = 1


#====================TABS====================#
# Format to use for the tab title.
c.tabs.title.format = '{audio}{current_title}'
#c.tabs.title.format = '{audio}{index}. {current_title}'
# Width (in pixels) of the progress indicator (0 to disable).
c.tabs.indicator.width = 0
# Padding (in pixels) around text for tabs.
c.tabs.padding = {"bottom": 1, "top": 1, "left": 5, "right": 5}
# How to behave when the last tab is closed. close: Close the window.
c.tabs.last_close = 'close'
## Position of the tab bar.
#c.tabs.position = 'left'
## When to show the tab bar.
#c.tabs.show = 'switching'

#====================STATUSBAR====================#
# Padding (in pixels) for the statusbar.
c.statusbar.padding = {"bottom": 1, "top": 1, "left": 4, "right": 4}
# List of widgets displayed in the statusbar.
c.statusbar.widgets = ["keypress", "url", "scroll", "history", "tabs", "progress"]


#====================KEYHINT====================#
# Keychains that shouldn't be shown in the keyhint dialog.
c.keyhint.blacklist = []
# Time (in milliseconds) from pressing a key to seeing the keyhint dialog.
c.keyhint.delay = 150


#====================xresources=====================#
# taken from https://qutebrowser.org/doc/help/configuring.html
def read_xresources(prefix):
    """
    read settings from xresources
    """
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props

xresources = read_xresources("*")

def xresources_transparent(prefix, tran):
    props = xresources[prefix]
    r = int(props[1]+props[2], 16)
    g = int(props[3]+props[4], 16)
    b = int(props[5]+props[6], 16)
    return 'rgba(' + str(r) + ', ' + str(g) + ', ' + str(b) + ', ' + tran + ')'


#====================FONTS====================#
# Default font families to use.
c.fonts.default_family = xresources['*.font']
# Default font size to use.
c.fonts.default_size = '10.5pt'


#====================COLORS====================#
color_none = 'rgba(0, 0, 0, 0%)'

#===completion===#
c.colors.completion.category.bg = xresources['*.color8']
c.colors.completion.category.border.bottom = color_none
c.colors.completion.category.border.top = color_none
c.colors.completion.category.fg = xresources['*.foreground']
c.colors.completion.even.bg = xresources['*.background']
c.colors.completion.odd.bg = xresources['*.background']
c.colors.completion.fg = [xresources['*.foreground'], xresources['*.color15'], xresources['*.color15']]
c.colors.completion.match.fg = xresources['*.color5']

c.colors.completion.item.selected.bg = xresources['*.color3']
c.colors.completion.item.selected.border.bottom = color_none
c.colors.completion.item.selected.border.top = color_none
c.colors.completion.item.selected.fg = xresources['*.color0']
c.colors.completion.item.selected.match.fg = xresources['*.color0']

c.colors.completion.scrollbar.bg = xresources['*.background']
c.colors.completion.scrollbar.fg = xresources['*.foreground']

#===contextmenu===#
#c.colors.contextmenu.disabled.bg (Current: )
#c.colors.contextmenu.disabled.fg (Current: )
#c.colors.contextmenu.menu.bg (Current: )
#c.colors.contextmenu.menu.fg (Current: )
#c.colors.contextmenu.selected.bg (Current: )
#c.colors.contextmenu.selected.fg (Current: )

#===downloads===#
c.colors.downloads.bar.bg = xresources['*.background']
c.colors.downloads.start.bg = xresources['*.color4']
c.colors.downloads.start.fg = xresources['*.color0']
c.colors.downloads.stop.bg = xresources['*.color10']
c.colors.downloads.stop.fg = xresources['*.color0']
c.colors.downloads.error.bg = xresources['*.color1']
c.colors.downloads.error.fg = xresources['*.color0']

#===hints===#
c.colors.hints.bg = xresources['*.color5']
c.colors.hints.fg = xresources['*.background']
c.colors.hints.match.fg = xresources['*.color6']

#===keyhint===#
c.colors.keyhint.bg = xresources_transparent('*.background', '90%')
c.colors.keyhint.fg = xresources['*.foreground']
c.colors.keyhint.suffix.fg = xresources['*.color11']

#===messages===#
c.colors.messages.error.bg = xresources_transparent('*.color1', '90%')
c.colors.messages.error.fg = xresources['*.color0']
c.colors.messages.error.border = color_none
c.colors.messages.info.bg = xresources_transparent('*.background', '90%')
c.colors.messages.info.fg = xresources['*.foreground']
c.colors.messages.info.border = color_none
c.colors.messages.warning.bg = xresources_transparent('*.color11', '90%')
c.colors.messages.warning.fg = xresources['*.color0']
c.colors.messages.warning.border = color_none

#===prompts===#
c.colors.prompts.bg = xresources['*.background']
c.colors.prompts.fg = xresources['*.foreground']
c.colors.prompts.border = color_none
c.colors.prompts.selected.bg = xresources['*.color15']
c.colors.prompts.selected.fg = xresources['*.foreground']

#===statusbar===#
c.colors.statusbar.normal.bg = xresources['*.background']
c.colors.statusbar.normal.fg = xresources['*.foreground']

c.colors.statusbar.insert.bg = xresources['*.color2']
c.colors.statusbar.insert.fg = xresources['*.color0']

c.colors.statusbar.passthrough.bg = xresources['*.color4']
c.colors.statusbar.passthrough.fg = xresources['*.color0']

c.colors.statusbar.caret.bg = xresources['*.color13']
c.colors.statusbar.caret.fg = xresources['*.color0']
c.colors.statusbar.caret.selection.bg = xresources['*.color13']
c.colors.statusbar.caret.selection.fg = xresources['*.color0']

c.colors.statusbar.command.bg = xresources['*.background']
c.colors.statusbar.command.fg = xresources['*.foreground']

#c.colors.statusbar.progress.bg

#c.colors.statusbar.private.bg
#c.colors.statusbar.private.fg
#c.colors.statusbar.command.private.bg = xresources['*.background']
#c.colors.statusbar.command.private.fg = xresources['*.foreground']

c.colors.statusbar.url.fg = xresources['*.foreground']
c.colors.statusbar.url.success.http.fg = xresources['*.foreground']
c.colors.statusbar.url.success.https.fg = xresources['*.foreground']
c.colors.statusbar.url.hover.fg = xresources['*.color6']
c.colors.statusbar.url.warn.fg = xresources['*.color9']
c.colors.statusbar.url.error.fg = xresources['*.color3']

#===tabs===#
c.colors.tabs.bar.bg = xresources['*.background']

c.colors.tabs.even.bg = xresources['*.background']
c.colors.tabs.even.fg = xresources['*.foreground']
c.colors.tabs.odd.bg = xresources['*.background']
c.colors.tabs.odd.fg = xresources['*.foreground']
c.colors.tabs.selected.even.bg = xresources['*.color8']
c.colors.tabs.selected.even.fg = xresources['*.foreground']
c.colors.tabs.selected.odd.bg = xresources['*.color8']
c.colors.tabs.selected.odd.fg = xresources['*.foreground']

c.colors.tabs.pinned.even.bg = xresources['*.color6']
c.colors.tabs.pinned.even.fg = xresources['*.color0']
c.colors.tabs.pinned.odd.bg = xresources['*.color6']
c.colors.tabs.pinned.odd.fg = xresources['*.color0']
c.colors.tabs.pinned.selected.even.bg = xresources['*.color4']
c.colors.tabs.pinned.selected.even.fg = xresources['*.color0']
c.colors.tabs.pinned.selected.odd.bg = xresources['*.color4']
c.colors.tabs.pinned.selected.odd.fg = xresources['*.color0']

#c.colors.tabs.indicator.error = xresources['*.color1']
#c.colors.tabs.indicator.start = xresources['*.color3']
#c.colors.tabs.indicator.stop = color_none
#c.colors.tabs.indicator.system (Current: rgb)

#===webpage===#
#c.colors.webpage.bg = xresources['*.color0']
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
