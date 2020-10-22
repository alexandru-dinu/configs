import os

class Setup:

    @staticmethod
    def set_anaconda3(fp):
        fp.write('export PATH=~/anaconda3/bin:$PATH\n')
        fp.write('export NODE_PATH=$HOME/anaconda3/lib/node_modules\n')

    @staticmethod
    def set_cuda(fp):
        fp.write('export PATH=/usr/local/cuda/bin:$PATH\n')
        fp.write('export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH\n')


with open(os.path.join(os.environ['HOME'], '.zshenv'), 'at') as fp:
    opts = [x for x in dir(Setup) if x.startswith('set_')]

    for opt in opts:
        if input(f'>>> {opt} [Y/n] ').lower() in ['', 'y']:
            getattr(Setup, opt)(fp)
