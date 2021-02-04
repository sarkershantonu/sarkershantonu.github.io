---
layout: post
title: How to change hostname in Ubuntu
date: "2019-04-16 05:02"
tags: [tools,linux]
permalink: /2019/04/16/vim-basics/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Linux"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can change host name in Ubuntu. 

### Why this is useful? 
If you are managing VMs, more often you keep preconfigured VMs and when you need a new one, you copy and use that same. I have been doing the same since 2009. So, when you COPY a VM, you get old names & IP configurations. So, you need to change it based on your new requirements.

This may not be applicable for docker like environments. But I am using similar technique for proxmox VMs & LXCs. 

### Required Command
I will be using ```hostnamectl``` command to make this happened. 

### My Old configuration 
After logging in, if I run this command ```hostnamectl```, then I will see this 

![before-config](/images/ubuntu/host-name-change/host-name-before.JPG)

You can see this is ```u20```. u20 stands for ubuntu 20 lts server, this is like preconfigured VM which i copy to use in different purposes so that I can skip installation ,network configurations, initial package update.

### Step 1 : Change the host name 
When I run this : 

```shell
 sudo hostnamectl set-hostname jenkins
```

This will make my host name ```u20``` to   ```jenkins```. 

### Step 2 : Change host file entry 
As my preconfigured vm has old name in hosts file ```/etc/hosts```, I have to change this. Before change let's see what s the value. 

If I run in command line ``` cat /etc/hosts```, I will see this 

![before-host-config](/images/ubuntu/host-name-change/before-edit-hosts.JPG)

Now, edit this file. 

```
sudo nano /etc/hosts
```
Change the value from ```u20``` to   ```jenkins```.  That's it. 

### Step 3 : Reboot 
- Let's reboot the vm ```sudo reboot```

When you are logging in , you should see the changes. To verify, after logging in 

1. Let's check Host name using  ```hostnamectl```

![after--config](/images/ubuntu/host-name-change/after-change.JPG)

2. Let's check hosts ```/etc/hosts``` file with this command ```cat /etc/hosts```

![after-host-config](/images/ubuntu/host-name-change/edit-hosts.JPG)

That's all. Thanks :) 