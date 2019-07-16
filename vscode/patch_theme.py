import json
import sys
import os

ext_folder = f"{os.environ['HOME']}/.vscode/extensions"
theme = f"{ext_folder}/malvery.darcula-pycharm-dimmed-0.1.0/themes/darcula-pycharm-dimmed-theme.json"

config = json.loads(open(theme, 'rt').read())

colors = config['colors']

dark_grey = "#1e1e1e"
props = [
    'editor.background', 'tab.activeBackground', 'tab.inactiveBackground', 'tab.border',
    'editorGroupHeader.tabsBackground', 'sideBar.border', 'sideBar.background',
    'sideBarSectionHeader.background', 'activityBar.background', 'activityBar.border',
    'statusBar.border', 'statusBar.background', 'statusBar.noFolderBackground', 'statusBar.noFolderBorder',
    'statusBar.debuggingBorder',
]

for prop in props:
    config['colors'][prop] = dark_grey

with open(theme, "wt") as fp:
    fp.write(json.dumps(config, indent=4))
