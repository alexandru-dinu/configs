

### partitions
	/ (ext4): 301,852 MB
	swap: 16,384 MB
	bootloader location = efi partition
	
### themes
nanodesu (xfwm4) + arc-dark + papirus-icon-theme

### miscellaneous fixes
wifi (gnome): `sudo echo "blacklist ideapad_laptop" >> /etc/modprobe.d/blacklist.conf`

### nvidia-driver
- install from additional drivers
- check: `nvidia-smi`, `lspci | grep -i nvidia`, `glxinfo | head`

### cuda
- use runfile
- `sudo apt install libcuda1-V`
- verify: http://xcat-docs.readthedocs.io/en/stable/advanced/gpu/nvidia/verify_cuda_install.html

### cudnn
- http://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html#installlinux-tar

### bumblebee
1. assuming `nvidia-V` driver was installed from additional drivers (replace `V` with current nvidia driver version)

	    sudo apt update
	    sudo apt-get remove xserver-xorg-video-nouveau
	    sudo apt-get install bumblebee-nvidia

 2. add the following lines to `/etc/modprobe.d/bumblebee.conf`:

        blacklist nvidia-V
	    blacklist nvidia-V-updates
	    blacklist nvidia-experimental-V

3. modify `/etc/bumblebee/bumblebee.conf`:

        # The Driver used by Bumblebee server. If this value is not set (or empty),
        # auto-detection is performed. The available drivers are nvidia and nouveau
        # (See also the driver-specific sections below)
        **Driver=nvidia**
        ...
        ## Section with nvidia driver specific options, only parsed if Driver=nvidia
        [driver-nvidia]
        # Module name to load, defaults to Driver if empty or unset
        **KernelDriver=nvidia_V**
        PMMethod=auto
        # colon-separated path to the nvidia libraries
        **LibraryPath=/usr/lib/nvidia-V:/usr/lib32/nvidia-V**
        # comma-separated path of the directory containing nvidia_drv.so and the
        # default Xorg modules path
        **XorgModulePath=/usr/lib/nvidia-V/xorg,/usr/lib/xorg/modules**
        XorgConfFile=/etc/bumblebee/xorg.conf.nvidia

  4. update alternatives:

         sudo update-alternatives --config i386-linux-gnu_gl_conf
         # choose mesa
         sudo update-alternatives --config x86_64-linux-gnu_egl_conf
         # choose mesa
         sudo update-alternatives --config x86_64-linux-gnu_gl_conf
         # choose nvidia-V-prime

5. update grub: add `GRUB_CMDLINE_LINUX="nogpumanager"` to `/etc/default/grub`, then run `sudo update-grub`

6. `reboot`

7. spawn a shell, and run:

        sudo dpkg-reconfigure bbswitch-dkms
        sudo dpkg-reconfigure nvidia-V
        # redo step 4


- **if there are problems with input, run `sudo apt install xserver-xorg-input-all`**
- also, make sure that `/usr/lib/xorg/Xorg.wrap` doesn't exist

### sites
- https://lenovolinux.blogspot.com/2016/05/bumblebee-on-lenovo-t440p-nvidia-gt.html
- https://gist.github.com/wangruohui/df039f0dc434d6486f5d4d098aa52d07#file-install-nvidia-driver-and-cuda-md
