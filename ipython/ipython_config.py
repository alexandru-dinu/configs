c = get_config()

c.InteractiveShell.colors = "Linux"

c.InteractiveShellApp.exec_lines = [
    'import os',
    'import sys',
    'import time',

    'import numpy as np',

    'import torch',
    'import torch.nn as nn',
    'import torch.tensor as tensor',
    'import torch.autograd as autograd',
    'from torch.autograd import Variable',

    'import seaborn as sns',
    'import matplotlib.pyplot as plt',

    'import pickle',
    'from tqdm.auto import tqdm',
    'from pprint import pprint',
]
