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


This blog I am going to show some popular linux commands that I often use to monitor system.  

### To know your hardware info 

``` lshw```

```lshw -short```

```sudo lshw -html > lshw.html```

``` lspci```

```lspci -t```

```lspci -v```


``` lsblk```

### Storage Info : 

```lsblk -a```

```sudo hdparm /dev/sda1```

```sudo hdparm -g /dev/sda1```

```sudo fdisk -l```


``` lshw```


``` lscpu```

```free -m```

``` lsusb```

```lsusb -v```

### Kernel Info 

```uname -r```

```uname -a```


```uname -v```

```uname -n```

```uname -m```


```top```


