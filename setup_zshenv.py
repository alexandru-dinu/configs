import os

def set_anaconda3(fp):
    fp.write('export PATH=~/anaconda3/bin:$PATH\n')
    fp.write('export NODE_PATH=$HOME/anaconda3/lib/node_modules\n')

def set_cuda(fp):
    fp.write('export PATH=/usr/local/cuda/bin:$PATH\n')
    fp.write('export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH\n')

d = {
    'anaconda3': set_anaconda3,
    'cuda'     : set_cuda,
}

fp = open(os.path.join(os.environ['HOME'], '.zshenv'), 'at')

for k, func in d.items():
    s = input(f'>>> {k} [Y/n] ')
    if s.lower() == 'y' or s == '':
        func(fp)

fp.close()
