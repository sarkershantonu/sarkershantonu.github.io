---
layout: post
title: UTC Time in Windows
date: "2021-02-16 17:02"
tags: [allure, automation, reporting]
permalink: /2021/02/16/set-utc-time-windows/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on UTC Time in Windows "
gh-badge: [star,follow]
comments: true
---

### Time Issue in windows/Linux 
As developer or tester if we needed to dual boot Laptop/PC to change OS , from linux to windows (or vice versa). This seems easy if you can do clean installation but there are small things we need to take care about. 

One of that is Time. Usually when you reboot to change windows to linux or linux to windows, you will see your time has changed. 

**Why?**, Under the hood Linux (I am using popOS which is a debian linux type) use UTC time , so when you select your region, linux assume your BIOS time as UTC time and it adjusts local time based on your timezone selection.

For example, I am living in Bangladesh (UTC+6) when I choose time location as dhaka , this will assume my BIOS as UTC time and adjust local time. If my BIOS time is 2PM, my local time will be 8PM. 

But, windows does not assume this. It assumes, BIOS time as local time. So, 2PM BIOS will be shown as 2PM dhaka time. 

So, if I boot to linux, my time will be changed and vice versa.

To resolve this, we need to configure windows following same way like linux to use BIOS time as UTC. In this way both OS will show same time in PC clock.

### Make Windows following UTC 
- Open Regedit as Admin 
- Goto ```Computer\HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\TimeZoneInformation```
- Right click on Blank Space and select "New > " & select ```DWORD(32)Value```

![reg-add](/images/windows/time/regedit-add.png)  

- Rename the newly added value as ```RealTimeIsUniversal```. This is a very important to keep same name. 
- Double click **RealTimeIsUniversal** & make value data as 1 (from 0). At the end this should be looking like this.

![reg-changed](/images/windows/time/reg-final.JPG)

- Reboot PC 

We are done. Now you can see both OS will follow UTC time. 

Thanks :) 