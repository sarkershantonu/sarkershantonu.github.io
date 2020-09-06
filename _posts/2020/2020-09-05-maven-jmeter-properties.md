---
layout: post
title: Managing Properties in Jmeter Maven
date: "2013-09-05 05:02"
tags: [jmeter,ci-cd]
permalink: /2013/09/05/maven-jmeter-Properties/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
[draft]
In this article we are going to see how we can configure Jmeter with plugins. This is continuation post of [this original article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).


### Properties in jmeter 

### Default Property location

### To change configuration directory 
- by default the configuration directory is **/src/test/conf**. When we want to change , we can use 
```<confFilesDirectory>path_to_cofig_files</confFilesDirectory>```

What are the config files? usually jmeter internal configurations, like log4j2.xml. Or, if you are using any custom JAR which may have any configuration files.