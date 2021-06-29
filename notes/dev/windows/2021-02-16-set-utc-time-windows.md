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

- Open Regedit 
- Goto ```Computer\HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\TimeZoneInformation```
- Right click on Blank Space and select "New > " & select ```DWORD(32)Value```

![reg-add](/images/windows/time/regedit-add.png)  

- Rename the newly added value as ```RealTimeIsUniversal```. This is a very important to keep same name. 
- Double click **RealTimeIsUniversal** & make value data as 1 (from 0). At the end this should be looking like this.

![reg-changed](/images/windows/time/reg-final.JPG)

- Reboot PC 