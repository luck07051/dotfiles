import os

# TODO: dup current window

config.unbind('u')
config.unbind('cd')
config.unbind('co')

bitwarden = 'spawn --userscript qute-bitwarden ' \
    f'-d "{os.environ["DMENU"]} -p Bitwarden" ' \
    f'-p "ask-password-in-terminal" '

c.bindings.commands['normal'] = {
    # Use scroll command instead arrow key.
    'j': 'scroll-px 0 40',
    'k': 'scroll-px 0 -40',
    'h': 'scroll-px -40 0',
    'l': 'scroll-px 40 0',

    # Scroll half page once.
    '<PgDown>': 'scroll-page 0 0.5',
    '<PgUp>': 'scroll-page 0 -0.5',

    'D': 'undo',
    'w': 'open -t',

    '<Ctrl-i>': 'forward',
    '<Ctrl-o>': 'back',
    '<Ctrl-l>': 'clear-messages ;; download-clear',

    # Let J, K works straight.
    'J': 'tab-prev',
    'K': 'tab-next',
    '<Ctrl-Tab>': 'tab-next',
    '<Ctrl-Shift-Tab>': 'tab-prev',

    ',m': 'spawn mpv {url}',
    ',M': 'hint links spawn mpv {hint-url}',

    'xo': 'tab-only',
    'xc': 'config-source',

    'xb': 'config-cycle statusbar.show always in-mode',
    'xt': 'config-cycle tabs.show multiple never',

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
