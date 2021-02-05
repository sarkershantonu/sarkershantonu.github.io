---
layout: post
title: How to change IP in Ubuntu 20.04LTS
date: "2020-06-11 05:02"
tags: [tools,linux]
permalink: /2020/06/11/ubuntu-io-change/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Linux"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can change IP name in Ubuntu 20.04LTS. 

Unlike older ubuntu versions , Ubuntu Server 20.04 LTS uses the tricky [**Netplan**](https://netplan.io/) for network configuration by default. 

### Why this is useful?
If you are managing VMs, more often you keep preconfigured VMs and when you need a new one, you copy and use that same. I have been doing the same since 2009. So, when you COPY a VM, you get old IP configurations. So, you need to change it based on your new requirements.

This may not be applicable for docker like environments. But I am using similar technique for proxmox VMs & LXCs.

### Step 1 : Current configurations 
- Using ```ip a``` , I can know what is current IP address in which interface. In you case , your interface name may change. 

![before-netplan](/images/ubuntu/ip-change/before-ip.JPG)

My Interface name is ```ens33```

- Let's see netplan configuration using this command 

```shell
cat /etc/netplan/00-installer-config.yaml

```

![before-netplan](/images/ubuntu/ip-change/before-netplan.JPG)

We can see our IP is set to ***192.168.4.20***. We will only change this IP, other will be same. Now, if you want to change other configuration like name server, gateway, you need to change here. 

### Step 2 : CloudInit configuration
- you have to make sure that the network interface is not managed by CloudInit. To know what is configuration , use this command

```shell
 cat /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg
```

We are expecting ```network: {config: disabled}``` and in my case, this is the output. 

![disable-cloud-config](/images/ubuntu/ip-change/disable-cloud-config.JPG)

Now we know, this VM network interface is not managed by CloudInit. 

### Step 3 : Edit netplan configuration
- Open ```/etc/netplan/00-installer-config.yaml``` with you favorite editor and chang it. 

```shell
 sudo nano /etc/netplan/00-installer-config.yaml
```
I am changing from ```192.168.4.20``` to ```192.168.4.20```. And after change , this i see

![after-netplan](/images/ubuntu/ip-change/after-netplan.JPG)

### Step 4 : Test & Apply 
- Using ```sudo netplan try```, I will test. When run this command, i see this 

![netplan-try](/images/ubuntu/ip-change/netplan-try.JPG)

With warning, the message prompt me to keep the setting to test. I pressed **ENTER**. 

- Now, apply this using ```sudo netplan apply```. And, lets see out IP status again Using ```ip a```

![netplan-apply](/images/ubuntu/ip-change/netplan-apply.JPG)

And that's all. Thanks :) 