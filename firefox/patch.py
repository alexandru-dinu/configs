"""
about:config patch (prefs.js)
"""

import os
import re
import shutil
import configparser

home_dir = os.environ['HOME']
firefox_dir = f"{home_dir}/.mozilla/firefox"

config = configparser.ConfigParser()
config.read(f"{firefox_dir}/profiles.ini")

profile = config['Profile0']['Path']
profile_dir = f"{firefox_dir}/{profile}"

patch = './prefs.js.patch'
cfg_file = f"{profile_dir}/prefs.js"

fmt = "user_pref(%s, %s);"

def add_user_content():
    chrome_dir = f'{profile_dir}/chrome'
    os.makedirs(chrome_dir, exist_ok=True)
    shutil.copy('userContent.css', chrome_dir)
    print('+ added chrome/userContent.css')

def do_patch():
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


if __name__ == '__main__':
    add_user_content()
    do_patch()
