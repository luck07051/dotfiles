import os

# TODO: dup current window

# t command
#  tch cookie.accept
#  tih content.images
#  tph content.plugins
#  tsh content.javascript.enabled
#   ^ this char uppercase mean not temporarily
#    ^ h: set to this domain
#      H: set to this domain and its subdomain
#      u: set to this url path

config.unbind('u')
config.unbind('cd')
config.unbind('co')

bitwarden = 'spawn --userscript qute-bitwarden ' \
    f'-d "{os.environ["DMENU"]} -p Bitwarden" ' \
    '-p "ask-password-in-terminal" '

update_cookie_block_list = 'spawn wget -O ' \
    f'{os.environ["XDG_DATA_HOME"]}/qutebrowser/cookie-blockers/blocklist.txt ' \
    'https://raw.githubusercontent.com/easylist/easylist/master/easylist_cookie/easylist_cookie_general_hide.txt'

c.bindings.commands['normal'] = {
    # Use scroll command instead arrow key.
    'j': 'scroll-px 0 80',
    'k': 'scroll-px 0 -80',
    'h': 'scroll-px -80 0',
    'l': 'scroll-px 80 0',

    # Scroll half page once.
    '<PgDown>': 'scroll-page 0 0.5',
    '<PgUp>': 'scroll-page 0 -0.5',

    # Let J, K works straight.
    'J': 'tab-prev',
    'K': 'tab-next',
    '(': 'tab-prev',
    ')': 'tab-next',
    '<Ctrl-Tab>': 'tab-next',
    '<Ctrl-Shift-Tab>': 'tab-prev',

    # Modifier commands
    '<Ctrl-i>': 'forward',
    '<Ctrl-o>': 'back',
    '<Ctrl-l>': 'clear-messages ;; download-clear',

    # Uppercase d to reopen closed tab
    'D': 'undo',

    # Open home page
    'e': 'open',
    'E': 'open -t',

    # Mark of page
    'm': 'set-mark',
    'M': '',

    # unbind u
    'u': '',

    # a to focus first unputs
    'a': 'hint -f inputs',

    # Yank
    'yo': 'yank inline [[{url}][{title}]]',

    # Paste
    'Pt': 'open -t -- https://translate.google.com/?sl=auto&tl=zh-TW&text={primary}',

    # , for everything else
    ',m': 'spawn mpv {url}',
    ',M': 'hint links spawn mpv {hint-url}',

    ',o': 'tab-only',
    ',c': 'config-source',

    # Toggle / Tab
    'tb': 'config-cycle statusbar.show always in-mode',
    'tt': 'config-cycle tabs.show multiple never',

    # x for userscript
    'xc': 'spawn --userscript qute-cookie-block',
    'xC': update_cookie_block_list,

    'xx': bitwarden,
    # 'xx': bitwarden + ' -e',  # username only
    'xX': bitwarden + ' -w',  # password only
    # 'xx': bitwarden + ' -T',  # totp only
}

c.bindings.commands['insert'] = {
    '<Ctrl-a>': 'fake-key <Home>',
    '<Ctrl-e>': 'fake-key <End>',
    '<Ctrl-b>': 'fake-key <Left>',
    '<Mod1-b>': 'fake-key <Ctrl-Left>',
    '<Ctrl-f>': 'fake-key <Right>',
    '<Mod1-f>': 'fake-key <Ctrl-Right>',
    '<Ctrl-p>': 'fake-key <Up>',
    '<Ctrl-n>': 'fake-key <Down>',

    '<Ctrl-d>': 'fake-key <Delete>',
    '<Mod1-d>': 'fake-key <Ctrl-Delete>',
    '<Ctrl-h>': 'fake-key <Backspace>',
    '<Ctrl-w>': 'fake-key <Ctrl-Backspace>',
    '<Ctrl-u>': 'fake-key <Shift-Home><Delete>',
    '<Ctrl-k>': 'fake-key <Shift-End><Delete>',

    '<Ctrl-x><Ctrl-e>': 'edit-text',
}
