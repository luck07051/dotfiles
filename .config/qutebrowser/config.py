
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html


ColorScheme = [
    '#1c1c1c', '#cf6868', '#87af87', '#ebcb8b', '#81a1c1', '#ffb9dc', '#87afaf', '#d0d0d0', 
    '#585858', '#e59999', '#94c68b', '#f6b26b', '#68adcf', '#d5b0ff', '#87d1bc', '#808080']


# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '~/downloads'

# Search engines which can be used via the address bar.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'a': 'https://wiki.archlinux.org/?search={}', 'y': 'https://www.youtube.com/results?search_query={}'}




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


#====================FONTS====================#

c.fonts.default_family = 'MesloLGS Nerd Font'
c.fonts.default_size = '10.5pt'


c.content.autoplay = False

c.hints.uppercase = True
c.hints.border = '0px'
c.hints.radius = 1

c.tabs.indicator.width = 0
c.tabs.padding = {"bottom": 1, "top": 1, "left": 5, "right": 5}

# Map keys to other keys, so that they are equivalent in all modes. When
# the key used as dictionary-key is pressed, the binding for the key
# used as dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map <Ctrl-[> to <Escape>. NOTE:
# This should only be used if two keys should always be equivalent, i.e.
# for things like <Enter> (keypad) and <Return> (non-keypad). For normal
# command bindings, qutebrowser works differently to vim: You always
# bind keys to commands, usually via `:bind` or `config.bind()`. Instead
# of using this setting, consider finding the command a key is bound to
# (e.g. via `:bind gg`) and then binding the same command to the desired
# key. Note that when a key is bound (via `bindings.default` or
# `bindings.commands`), the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {'<Ctrl+6>': '<Ctrl+^>', '<Ctrl+Enter>': '<Ctrl+Return>', '<Ctrl+i>': '<Tab>', '<Ctrl+j>': '<Return>', '<Ctrl+m>': '<Return>', '<Ctrl+[>': '<Escape>', '<Enter>': '<Return>', '<Shift+Enter>': '<Return>', '<Shift+Return>': '<Return>'}
