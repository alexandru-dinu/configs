"""
about:config patch (prefs.js)
"""

import os
import re
import shutil
import configparser
from pathlib import Path

home = Path(os.environ["HOME"])
firefox_dir = home / ".mozilla/firefox"

config = configparser.ConfigParser()
config.read(firefox_dir / "profiles.ini")

profile_dir = firefox_dir / config["Profile0"]["Path"]
cfg_file = profile_dir / "prefs.js"
patch = "./prefs.js.patch"

# userContent.css
chrome_dir = profile_dir / "chrome"
os.system(f"mkdir -p {chrome_dir} && cp -f userContent.css {chrome_dir}")
print("+ added chrome/userContent.css")

# patching
print(f"> patching {cfg_file}")

p_def = open(cfg_file).read()
p_own = [x.strip().split(":") for x in open(patch).readlines()]

for pk, pv in p_own:
    r = f"user_pref({pk}, {pv});"

    try:
        m = re.findall(f"user_pref\({pk}, .*\);", p_def)[0]
        print(f"* replaced: {m} -> {r}")
    except IndexError:
        p_def += r + "\n"
        print(f"+ appended: {r}")

with open(cfg_file, "wt") as fp:
    fp.write(p_def)

print(f"> done patching {cfg_file}")
