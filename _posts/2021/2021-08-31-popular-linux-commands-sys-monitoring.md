---
layout: post
title: Linux Commands for System Monitoring
date: "2021-08-31 05:02"
tags: [linux]
permalink: /2021/08/31/popular-linux-commands-sys-monitoring/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Linux Commands"
gh-badge: [star,follow]
comments: true
---

This blog I am going to show some popular linux commands that I often use for monitoring system.  

### To know your hardware info 
- To know all hardware together 

``` lshw```

This will show all hardware info in long list. You may expect al list info in cli like this 

![lshw](/images/linux/popular-commands/lshw.JPG)

- You can get this same info in short form 

```lshw -short```

And this you can expect in cli 

![lshw-short](/images/linux/popular-commands/lshw-short.JPG)

- You can save this info in a HTML file using this command. 

```sudo lshw -html > lshw.html```

![lshw-html](/images/linux/popular-commands/lshw-html.JPG)

**LSHW** is an extension of LS commands with HW for hardware. It also has other extensions where you can see specific hardware group like pci devices. 

- To know PCI device info 

``` lspci```

And you can use these options 

```lspci -t```

```lspci -v```

- You may also use one of the oldest linux command to know this info. 

```sudo dmesg```

This will show you very details like this 

![dmesg]()

### Storage Info : 

``` lsblk```

```lsblk -a```

```sudo hdparm /dev/sda1```

```sudo hdparm -g /dev/sda1```

```sudo fdisk -l```




### CPU Info 
``` lscpu```

### Memory Info 

```free -m```


### USB Info 

```lsusb -v```

``` lsusb```

### Kernel Info 

```uname -r```

```uname -a```


```uname -v```

```uname -n```

```uname -m```

### Process Monitor

```top```

```sudo dmidecode -t memory```

```sudo dmidecode -t system```

```sudo dmidecode -t bios```

```sudo dmidecode -t processor```
