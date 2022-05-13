# MS Linux
Do you know microsoft also has linux!!! for their cloud? it's called CBL-Mariner. 

# What is CBL-Mariner ? 

# No Iso? Let's make one. 

### Prepare your linux 

- Upadate & install software 

```shell
sudo apt update && sudo apt upgrade -y
sudo apt install -y software-properties-common git make tar wget curl rpm qemu-utils golang-go genisoimage python2-minimal bison gawk pigz
``` 

- Optional : you can also reboot

```
sudo reboot
```

- Clone Project and go inside toolkit folder 
```shell

git clone https://github.com/microsoft/CBL-Mariner.git
cd CBL-Mariner
cd toolkit

```
- Build Full version ISO 
- 
```shell
sudo make iso REBUILD_TOOLS=y REBUILD_PACKAGES=n CONFIG_FILE=./imageconfigs/full.json
```

- Go inside output folder **CBL-mariner/out/images/full/** and you should see ISO file.


# VirtualBox 

# VMware

# Basics on CBL-Mariner

### Installer GUI 
 
### Package Manager

### Builtin Tools 

### Reference
- [How Build system works](https://github.com/microsoft/CBL-Mariner/blob/2.0/toolkit/docs/how_it_works/0_intro.md)
