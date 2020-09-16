---
layout: post
title: Managing Jmeter Test Scripts(JMX) in Maven Plugin
date: "2020-09-14 05:02"
tags: [jmeter,ci-cd]
permalink: /2020/09/14/maven-jmeter-plugins-jmx/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
[draft]
In this article we are going to see how we can configure Jmeter with plugins. This is continuation post of [this original article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).


### Maven Build Erors 

### To change configuration directory 
- by default the configuration directory is **/src/test/conf**. When we want to change , we can use 
```<confFilesDirectory>path_to_cofig_files</confFilesDirectory>```

What are the config files? usually jmeter internal configurations, like log4j2.xml. Or, if you are using any custom JAR which may have any configuration files.