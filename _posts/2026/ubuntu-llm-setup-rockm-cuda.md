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


```sudo apt-get install -y nvidia-open```

- Install Cuda Drivers
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

# ML Setup : Ollama 
# ML Setup : LmStudio
# ML Setup : vLLM

# Run LLM 

### Local host Execution 

### Remote Execution : LAN