---
layout: post
title: Linux Commands for System Monitoring
date: "2020-08-31 05:02"
tags: [linux]
permalink: /2020/08/31/popular-linux-commands-sys-monitoring/
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


- To know about PCI devices 

``` lspci```

it will look like

![lspci](/images/linux/popular-commands/lspci.JPG)

And you can use these options 

- Produce machine-readable output```lspci -mm```

- Verbose output ```lspci -v```

- Show both textual and numeric ID's ```lspci -nn```

- You may also use one of the oldest linux command to know this info. 

```sudo dmesg```

This will show you very details like this 

![dmesg](/images/linux/popular-commands/dmesg.JPG)

- Human-readable of dmesg  ```sudo dmesg -H```

### Storage Info : 

- This will show all drive 

``` lsblk```

![lsblk](/images/linux/popular-commands/lsblk.JPG)

- To know IDs of all volumes 

```blkid```

![blkid](/images/linux/popular-commands/blkid.JPG)

- Showing all devices ```lsblk -a```

![lsblk-a](/images/linux/popular-commands/lsblk-a.JPG)

- To know each device info individually 

```sudo fdisk -l```

![lfdisk-l](/images/linux/popular-commands/fdisk-l.JPG)

### CPU Info 

- To know CPU info 

``` lscpu```

This will show info like this 

![lscpu](/images/linux/popular-commands/lscpu.JPG)

- If you want to know only current cpu running speed 

``` lscpu | grep MHz```

![lscpu](/images/linux/popular-commands/lscpu-mhz.JPG)

### Memory Info 

To know how much RAM/momory free in the system you can use ```free``` command. It has multiple options 

- Show in megabyte ```free -m```
- Show in gigabyte ```free -g```
- Show in kilobyte ```free -k```
- Show (default kilobyte) ```free```
- Show in human-readable form ```free -h```

![free](/images/linux/popular-commands/free.JPG)

### USB Info 

- To know USB device info ``` lsusb```. This will be shown like this 

[lsusb](/images/linux/popular-commands/lsusb.JPG)

- To know this info in verbose ``` lsusb -v```

### Kernel Info 
To know linux kernel info details, uname is very good command.

- To know kernel name use ```uname```
- To know kernel release version info ```uname -r```
- To know all info related to kernel ```uname -a```
- To know kernel version info ```uname -v```
- To know node name ```uname -n```
- To know machine name ```uname -m```
- To know OS name ```uname -o```

![uname](/images/linux/popular-commands/uname.JPG)

### Process Monitor

```top```

```sudo dmidecode -t memory```

```sudo dmidecode -t system```

```sudo dmidecode -t bios```

```sudo dmidecode -t processor```

To know about LSHW, you can visit this blog 