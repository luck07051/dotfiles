import os
import subprocess
import yaml

# TODO: redirect

# TODO: darkreader (custom user style sheet)

# TODO: i-dont-care-about-cookies
# https://reddit.uima.duckdns.org/r/qutebrowser/comments/mnptey/getting_rid_of_cookie_consent_barspopups/

# TODO: cookies pre sites


config.load_autoconfig(False)

c.url.default_page = 'https://dashboard.uima.duckdns.org'
c.url.start_pages = 'https://dashboard.uima.duckdns.org'

terminal = os.environ['TERMINAL']
editor = os.environ['EDITOR']
bm_dir = os.path.join(os.getenv('HOME'), 'bm')

# Read searchengine from bm/searchengine file.
with open(os.path.join(bm_dir, 'searchengine'), 'r') as file:
    for line in file.readlines():
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        [key, url] = line.split("\t")
        c.url.searchengines[key] = url

# Auto ln quickmarks file.
quickmarks_file = os.path.join(bm_dir, 'bookmark')
config_quickmarks_file = os.path.join(config.configdir, 'quickmarks')
if os.path.isfile(quickmarks_file) and not os.path.exists(config_quickmarks_file):
    subprocess.run(['ln', '-s', quickmarks_file, config_quickmarks_file])

# User stylesheets
# c.content.user_stylesheets = [
#     os.path.join(config.configdir, 'css/uima-dark-all-sites.css')
# ]

# Load keybind.
config.source('keybind.py')

# Alias


# Content

common_user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)' \
    ' AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36'

config.set('content.headers.user_agent', common_user_agent)

config.set('content.javascript.enabled', False)
with open(os.path.join(bm_dir, 'allow-js'), 'r') as file:
    for line in file.readlines():
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        config.set('content.javascript.enabled', True, line)


# config.set('content.cookies.store', False)
# config.set('content.cookies.store', True, '')

config.set('content.cookies.accept', 'no-3rdparty')
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')

# c.content.javascript.clipboard = 'access'

c.content.blocking.method = 'both'
c.content.blocking.whitelist = []
c.content.fullscreen.overlay_timeout = 0
c.content.fullscreen.window = True
c.content.pdfjs = True


# Fileselect

c.fileselect.handler = 'external'

c.fileselect.folder.command = [
    terminal, '-t', 'qb fileselect',
    "ranger", "--choosedir={}"]
c.fileselect.multiple_files.command = [
    terminal, '-t', 'qb fileselect',
    "ranger", "--choosefiles={}"]
c.fileselect.single_file.command = [
    terminal, '-t', 'qb fileselect',
    "ranger", "--choosefile={}"]
c.editor.command = [
    terminal, '-t', 'qb editor',
    editor, '-c', 'normal {line}G{column0}l', '{file}']


# Misc

c.downloads.location.directory = '~/dl'
c.fonts.default_size = '10.5pt'
# Open base URL of the searchengine if a searchengine shortcut is invoked without parameters.
c.url.open_base_url = True
# Set the main window background to transparent.
c.window.transparent = True

c.downloads.position = 'bottom'
c.downloads.remove_finished = 30000

c.messages.timeout = 5000

c.keyhint.delay = 150

c.completion.scrollbar.padding = 0
c.completion.scrollbar.width = 10

# Characters used for hint strings.
c.hints.chars = 'asdfwerxcv'
c.hints.uppercase = True
c.hints.border = '0px'
c.hints.radius = 3

c.tabs.title.format = '{audio}{current_title}'
c.tabs.indicator.width = 0
c.tabs.padding = {"bottom": 1, "top": 1, "left": 5, "right": 5}
# Close the window if last tab is closed.
c.tabs.last_close = 'close'
# Hide the tab if only one tab is open
c.tabs.show = 'multiple'

c.statusbar.padding = {"bottom": 1, "top": 1, "left": 4, "right": 4}
c.statusbar.widgets = [
    "keypress", "search_match", "url", "scroll", "history", "tabs", "progress"
]


# Colors

def read_xresources(prefix):
    """
    read settings from xresources
    """
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda a: a.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop.removeprefix(prefix)] = value
    return props


def trans(hex_color, tran):
    r = int(hex_color[1] + hex_color[2], 16)
    g = int(hex_color[3] + hex_color[4], 16)
    b = int(hex_color[5] + hex_color[6], 16)
    return f'rgba({r}, {g}, {b}, {tran}%)'


def dict_attrs(obj, path=''):
    if isinstance(obj, dict):
        for k, v in obj.items():
            yield from dict_attrs(v, '{}.{}'.format(path, k) if path else k)
    else:
        yield path, obj


xresources = read_xresources('qutebrowser.') | read_xresources('*.')

colors = {
    'none': 'rgba(0, 0, 0, 0%)',
    'bg': xresources['background'],
    'fg': xresources['foreground'],
    'primary': xresources['primary'],
    'bg_trans': trans(xresources['background'], 90),

    'black': xresources['color0'],
    'red': xresources['color1'],
    'green': xresources['color2'],
    'yellow': xresources['color3'],
    'blue': xresources['color4'],
    'magenta': xresources['color5'],
    'cyan': xresources['color6'],
    'white': xresources['color7'],
    'gray': xresources['color8'],
}

with (config.configdir / 'theme.yml').open() as f:
    yaml_data = yaml.safe_load(f)

for k, v in dict_attrs(yaml_data):
    config.set(k, colors[v])

c.colors.downloads.system.bg            = 'none'
c.colors.downloads.system.fg            = 'none'
c.colors.tabs.indicator.system          = 'none'
c.colors.webpage.preferred_color_scheme = 'dark'
# c.colors.webpage.bg = colors['bg_trans']
