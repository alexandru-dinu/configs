c = get_config()

c.InteractiveShell.colors = "Linux"

c.InteractiveShellApp.exec_lines = [
    'import torch',
    'import torch.tensor as tensor',
    'import torch.autograd as autograd',
    'from torch.autograd import Variable',

    'import numpy as np',
    'import matplotlib.pyplot as plt',
]
