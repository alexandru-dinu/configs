import os
import sys

def do(info, instructions):
    if input("> %s [y/n] " % info) == 'y':
        exec(instructions)

fp = open(os.environ['HOME'] + '/.zshenv', 'a')

do("anaconda3",
"""
fp.write(\"export PATH=~/anaconda3/bin:$PATH\\n\")
"""
)

do("cuda",
"""
fp.write(\"export PATH=/usr/local/cuda/bin:$PATH\\n\")
fp.write(\"export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH\\n\")
"""
)

fp.close()
