## Setups

|     Distro     |      Kernel      |       Driver       |     CUDA   |    CUDNN   |   status    |
| -------------- | ---------------- | ------------------ | -----------| ---------- | ----------- |
| mint    18.3   | 4.15.18          | nvidia-396(.54)    | 9.1        |            | OK          |
| manjaro 19.0.2 | 5.4.28           | nvidia-430(.64)    | 10.1.243-2 | 7.6.5.32-4 | OK (active) |

## Installation

### Debian
- CUDA: use runfile
- [cuDNN](http://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html#installlinux-tar)

### Arch
- `sudo mhwd -a pci nonfree 0300`
