---
layout: post
title: Managing Properties in Jmeter Maven
date: "2013-09-07 05:02"
tags: [jmeter,ci-cd]
permalink: /2013/09/07/maven-jmeter-Properties/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can add jmeter properties & configurations in maven plugin. This is continuation post of [previous article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).

### Properties in jmeter 
- jmeter.properties : these are jmeter internal component properties 
- merge-results.properties : These are properties for listner which aggregrates multiple JTL files 
- reportgenerator.properties : HTML report generator properties 
- saveservice.properties : internal Jmeter service properties 
- system.properties : Jmeter system properties 
- upgrade.properties : Jmeter upgrade properties 
- user.properties : User customizable properties 

### Properties to work on 
We can change any property file and this will affect in jmeter startup. 


### Default Property location

### To change configuration directory 
- by default the configuration directory is **/src/test/conf**. When we want to change , we can use 
```<confFilesDirectory>path_to_cofig_files</confFilesDirectory>```

What are the config files? usually jmeter internal configurations, like log4j2.xml. Or, if you are using any custom JAR which may have any configuration files.