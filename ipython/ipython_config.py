c = get_config()

c.InteractiveShell.colors = "Linux"
c.InteractiveShell.editor = "vim"
c.TerminalIPythonApp.display_banner = False
c.TerminalInteractiveShell.highlight_matching_brackets = True
c.TerminalInteractiveShell.term_title = True

c.InteractiveShellApp.exec_lines = [
    'import os',
    'import sys',
    'import time',
    'import math',

    'from functools import reduce',
    'import operator',
    'import itertools',

    'import numpy as np',

    'import torch as T',
    'import torch.nn.functional as F',
    'import torch.nn as nn',

    'import seaborn as sns',
    'import matplotlib.pyplot as plt',

    'import pickle',
    'from tqdm.auto import tqdm',
    'from pprint import pprint',
]
