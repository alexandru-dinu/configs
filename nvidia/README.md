## Setups

|     Distro     |      Kernel      |       Driver       |     CUDA   |    CUDNN   |   status    |
| -------------- | ---------------- | ------------------ | -----------| ---------- | ----------- |
| mint    18.3   | 4.15.18          | nvidia-396(.54)    | 9.1        |            | OK          |
| manjaro 19.0.2 | 5.4.28           | nvidia-430(.64)    | 10.1.243-2 | 7.6.5.32-4 | OK (active) |

- [CUDA + driver compatibility](https://docs.nvidia.com/deploy/cuda-compatibility/index.html#binary-compatibility__table-toolkit-driver)
- [cuDNN support](https://docs.nvidia.com/deeplearning/sdk/cudnn-support-matrix/index.html)

## Installation

### Arch
- `sudo mhwd -a pci nonfree 0300`

### Debian
- driver: driver manager
- [CUDA](https://developer.nvidia.com/cuda-downloads): use runfile
- [cuDNN](http://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html#installlinux-tar)
