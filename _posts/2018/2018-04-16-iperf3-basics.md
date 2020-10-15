---
layout: post
title: How to use iperf3?
date: "2018-03-25 05:02"
tags: [tools]
permalink: /2018/03/25/iperf3-basics/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Tools"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can use iperf3.

### What is iperf3? 
Wget stands for Web Get. Wget is a CLI utilities for  HTTP, HTTPS, FTP and FTPS request in commandline . It is one of the most popular ubuntu tools used for data crawling/testing.  

### Why iperf3?
- Ready to run without install in ubuntu systems
- fast & easy
- site crawling is easy
- you can create batch crawler with wget.  

### Installation 
- Install via APT

         sudo apt-get update && sudo apt-get install wget       	

### Useful Options


### Examples 
- To download whole site (http, not https)

		 wget -r --no-parent _site_url
- Get all Ubuntu ISO files from CDN (will be hundreds of GB)

		 wget -r -l4 -A.iso http://cdimage.ubuntu.com


### More Options 
There are more CLI options, here is the whole list. 
