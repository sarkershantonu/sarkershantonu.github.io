---
layout: post
title: JMeter Path and Properties
date: "2013-01-20 05:51"
tags: [jmeter]
permalink: /2013/01/20/jmeter-path-properties/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter testing"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker
---

In this article we are going to see how can we configure jmeter by changing property of JMeter. In this section we will see the different mode settings for class path and properties in ```jmeter.propertie```.

In the jmeter installed bin directory(in my case C:\apache-jmeter-2.8\bin), we get a file named jmeter.properties. Open this with note pad.

# JMeter JVM Classpath 
- To define for searching jmeter Extensions(Do not use this for utility jars, ). These are just addional to default lib/ext. ```search_paths=/app1/lib;/app2/lib```
- To define additional class path for utility jars or JUnit test cases ```user.classpath=../classes;../jars/jar1.jar```
- To specify the class finder for GUI/Non GUI mode classes.
``` 
classfinder.functions.contain=.functions.
classfinder.functions.notContain=.gui.
```

Comment those if there any problem, The classpath finder currently needs to load every single JMeter class to find the classes it needs.For non-GUI mode, it's only necessary to scan for Function classes, but all classes
are still loaded. In here, I used , .gui for GUI mode classes and .function Non-Gui Mode

###  Additional properties
- To set additional properties . we can change by wither editing those property file or assign those property with our custom property file and assign them here.
``` 
user.properties=user.properties
system.properties=system.properties
``` 

Note, if we assign those, it will look for it, if not(disabled), this two file will be ignored

Thanks...:)