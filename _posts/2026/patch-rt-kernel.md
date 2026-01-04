
# Step 1 : Get LTS Kernel Version
- check latest LTS/Longterm release [here](https://www.kernel.org/). Currently 	6.12.63, we will need this info to get Realtime patches.
  ![rts-kernel](images/linux/kernel/rt-patch/lts-kernel-version.jpg)
- We need the find RT patch for 6.12.x , matching MAJOB.MINOR version (please check semantic versioning)

# Step 2 : download Latest RT Patch for Latest LTS Kernel Major 
- check Realtime patch version available in the [project folder](https://cdn.kernel.org/pub/linux/kernel/projects/rt/), fot the kernel. 
- For 6.12.x, you can see available version 6.12.57 , so we need linux kernel 6.12.57 and downlaod this patch. from [here](https://cdn.kernel.org/pub/linux/kernel/projects/rt/6.12/)
![rt-versions-available](images/linux/kernel/rt-patch/rt-versions-available.JPEG)

- Now, there are two type of patch files available , single patch  , multiple patch solution 
### Single file Patch : I will use this. 
- This contains all necessary changes need for kernel in a single file 
- Example : if you download [6.12.57](https://cdn.kernel.org/pub/linux/kernel/projects/rt/6.12/patch-6.12.57-rt14.patch.gz), you should see a patch file
  ![single-patch](images/linux/kernel/rt-patch/single-patch-file.jpg)

- Here you have long lost of kernel changes. 

### Multi patch solution 
- This contains all changes in kernel files in separate files. This part you have to know more deeper knowledge. You can partially patch kernel based on you specific need. It can be moduled patching. If you download [6.12.57 patches ](https://cdn.kernel.org/pub/linux/kernel/projects/rt/6.12/patches-6.12.57-rt14.tar.gz) you should see files like this.
![multi-patch](images/linux/kernel/rt-patch/multiple-patch-file.jpg)

- Each file has changes based on kernel file structure. 

# Step 3 : download Linux Kernel Matching the RT Patch
- Now, lets ownload lts kernel version  6.12.57 from [here](https://cdn.kernel.org/pub/linux/kernel/) , should be under v6.x folder as current lts is [6.12.57](https://cdn.kernel.org/pub/linux/kernel/v6.x/). From this example, the download kernel should be this [6.12.57](https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.57.tar.gz)

# Step 4 : Extract both files 
- Put them in same folder , for this example , i have put in folder name , rt-linux-patched-kernel
- Extract them . I am using command ```gunzip patch-6.12.57-rt14.patch.gz``` and ```gunzip linux-6.12.57.tar.gz```

# Step 5 : Use patch command
- From single file ![single-patch](images/linux/kernel/rt-patch/single-patch-file.jpg) , you can see how it is patched . this is diff and provided file traces. 
- use this command to patch  ``` patch -p1 < patch-6.12.57-rt14.patch``` 
here is the log of patching
//todo 

# Step 6 : Compile kernel 
- Use make command  
- ```make ARCH=arm CROSS_COMPILE=localtionOfCrossCOmpiler your configurationOfTheDevice```
- ```make ARCH=arm CROSS_COMPILE=localtionOfCrossCOmpiler your -jNUMBERofTHREADS>```


check kernel version ```uname -a```
[hint](https://www.youtube.com/watch?v=RSfMxKuyB7I)


# Reference 
- [semantic versioning](https://semver.org/)