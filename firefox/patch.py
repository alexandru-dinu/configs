"""
about:config patch (prefs.js)
"""

import os
import re
import sys
import configparser

home_dir = os.environ['HOME']
firefox_dir = f"{home_dir}/.mozilla/firefox"

config = configparser.ConfigParser()
config.read(f"{firefox_dir}/profiles.ini")

profile = config['Profile0']['Path']
profile_dir = f"{firefox_dir}/{profile}"

fmt = "user_pref(%s, %s);"

def do_patch(patch):
    cfg_file = f"{profile_dir}/{patch.split('/')[-1].split('-')[0]}"

    print(f"+ patching {cfg_file}")

    p_def = open(cfg_file).read()
    p_own = dict([x.strip().split(":") for x in open(patch).readlines()])

    for pk, pv in p_own.items():
        r = fmt % (pk, pv)

        try:
            m = re.findall(f"user_pref\({pk}, .*\);", p_def)[0]
            print(f"+ replaced: {m} -> {r}")
        except IndexError:
            p_def += r + "\n"
            print(f"+ appended: {r}")


    with open(cfg_file, "wt") as fp:
        fp.write(p_def)
    print(f"+ done patching {cfg_file}")

do_patch(sys.argv[1])
