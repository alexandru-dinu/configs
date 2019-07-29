import os

FP = open(os.environ['HOME'] + '/.zshenv', 'a')


if input("> anaconda2? [y/n] ") == 'y':
    FP.write('export PATH=~/anaconda2/bin:$PATH\n')

if input("> anaconda3? [y/n] ") == 'y':
    FP.write('export PATH=~/anaconda3/bin:$PATH\n')

if input("> cuda? [y/n] ") == 'y':
    FP.write('export PATH=/usr/local/cuda/bin:$PATH\n')
    FP.write('export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH\n')


FP.close()