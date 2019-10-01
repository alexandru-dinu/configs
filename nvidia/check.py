import torch
import tensorflow as tf

assert torch.cuda.is_available()
assert tf.test.is_gpu_available()

print('CUDA:', torch.version.cuda)
print('All good!')
