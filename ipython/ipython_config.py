c = get_config()

c.InteractiveShell.colors = "Linux"
c.TerminalIPythonApp.display_banner = False
c.TerminalInteractiveShell.highlight_matching_brackets = True
c.TerminalInteractiveShell.term_title = True

c.InteractiveShellApp.exec_lines = [
    'import os',
    'import sys',
    'import time',
    'import math',

    'import numpy as np',

    'import torch',
    'import torch.nn as nn',
    'import torch.tensor as tensor',
    'import torch.autograd as autograd',
    'from torch.autograd import Variable',

    'import tensorflow as tf',
    'import keras',

    'import seaborn as sns',
    'import matplotlib.pyplot as plt',

    'import pickle',
    'from tqdm.auto import tqdm',
    'from pprint import pprint',
]
