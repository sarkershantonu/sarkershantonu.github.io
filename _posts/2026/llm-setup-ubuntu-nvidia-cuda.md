# Hardware Setup 
- PC Specifications : 
- GPU setup 

# Operating System Setup 
- Kernel version 
- Kernel Update & dependencies 

### Driver Setup : RockM

### Driver Setup : Nvidia , CUDA
- Download and install Nvidia open drivers 
##### Cuda installation
- Check your GPU compatible Cuda [here](https://developer.nvidia.com/cuda/gpus). My GPU is RTX 3090Ti, so I need to install Cuda 8.6

1. install nvidia drivers 
- 
```sudo apt-get install -y nvidia-open```

2. Install Cuda Drivers
```
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-13-2
```



![Image-cuda-installed](/images/ubuntu/nvidia/nvidia-cuda13.2.png)
- [Nvidia Site](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=24.04&target_type=deb_network)

```
wget https://developer.download.nvidia.com/compute/cuda/13.2.1/local_installers/cuda-repo-debian13-13-2-local_13.2.1-595.58.03-1_amd64.deb
sudo dpkg -i cuda-repo-debian13-13-2-local_13.2.1-595.58.03-1_amd64.deb
sudo cp /var/cuda-repo-debian13-13-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-13-2
```

### install NVCC
```sudo apt install nvidia-cuda-toolkit```

```nvcc --version```
![version output](/images/ubuntu/nvidia/nvcc-version.png)

### Test Nvidia Driver Installed 

```git clone https://github.com/NVIDIA/cuda-samples.git```
```sudo apt install cmake```

### Nvidia GPU Monitoring
- Stressing on GPU thermal & power Limit, I use [Furmark](https://geeks3d.com/furmark/downloads/)
- For Application based GPU debugging, I use nvidia dev tool : [Nsight](https://developer.nvidia.com/nsight-systems)
- For monitoring I use ```nvidia-smi``` commands , when you are stressing/testing, you should see something like this 
![Usages by nvidia-smi](/images/ubuntu/nvidia/nvidia-smi-3090ti-usages.jpg)

