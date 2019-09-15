import torch
import tensorflow as tf

assert torch.cuda.is_available()
assert tf.test.is_gpu_available()

print('CUDA:', torch.version.cuda)
print('Tensorflow devices:')
with tf.Session() as sess:
    for d in sess.list_devices():
        print('>>>', d)

print('All good!')
