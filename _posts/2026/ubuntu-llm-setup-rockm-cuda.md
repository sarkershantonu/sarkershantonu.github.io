# Hardware Setup 
- PC Specifications : 
- GPU setup 

# Operating System Setup 
- Kernel version 
- Kernel Update & dependencies 

### Driver Setup : RockM

### Driver Setup : Nvidia , CUDA
- Install Cuda Drivers
```
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-13-2
```
![Image-cuda-installed](/images/ubuntu/nvidia/nvidia-cuda13.2.png)
- [Nvidia Site](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=24.04&target_type=deb_network)

# ML Setup : Ollama 
# ML Setup : LmStudio
# ML Setup : vLLM

# Run LLM 

### Local host Execution 

### Remote Execution : LAN