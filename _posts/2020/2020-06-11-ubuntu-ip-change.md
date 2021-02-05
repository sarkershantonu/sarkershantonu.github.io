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

Unlike older ubuntu versions , Ubuntu Server 20.04 LTS uses the tricky [**Netplan**](https://netplan.io/) for network configuration by default

```ip a```

![before-netplan](/images/ubuntu/ip-change/before-ip.JPG)

```shell
cat /etc/netplan/00-installer-config.yaml

```
![before-netplan](/images/ubuntu/ip-change/before-netplan.JPG)

```shell
 cat /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg
```
![disable-cloud-config](/images/ubuntu/ip-change/disable-cloud-config.JPG)