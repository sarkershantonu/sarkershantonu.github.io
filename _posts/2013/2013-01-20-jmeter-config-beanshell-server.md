---
layout: post
title: JMeter Config | BeanShell Server
date: "2013-01-20 03:51"
tags: [jmeter]
permalink: /2013/01/20/jmeter-config-beanshell-server/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter testing"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker
---

In this article we are going to see how can we configure jmeter by changing property of JMeter. In this section we will see the different mode settings for TCP Sampler in ```jmeter.propertie```.

In the jmeter installed bin directory(in my case C:\apache-jmeter-2.8\bin), we get a file named jmeter.properties. Open this with note pad. Search for tcp sampler section in notepad and get the following.

# Bean shell Servers
For primary idea on BeanShell Server, please follow the structure here and if you interested in an example server, you may see this. It can be used while running test remotely.

- To Define the port number as non-zero to start the http BeanShell Server on that port ``` beanshell.server.port=9000```

Note : The telnet server will be started on the next port 

- To Set the server initialization file(in path) ```beanshell.server.file=../extras/startup.bsh```
- To Define a file(path) to be processed at startup ```beanshell.init.file=``` . If path is not given, it will use own interpreter
- To set the initialization files for BeanShell Sampler, Function and other BeanShell elements
``` 
beanshell.sampler.init=BeanShellSampler.bshrc
beanshell.function.init=BeanShellFunction.bshrc
beanshell.assertion.init=BeanShellAssertion.bshrc
beanshell.listener.init=etc
beanshell.postprocessor.init=etc
beanshell.preprocessor.init=etc
beanshell.timer.init=etc
```

Note : Bean shell test elements do not share interpreters. Each element in each thread has its own interpreter. This is retained between samples.The file BeanShellListeners.bshrc contains sample definitions of Test and Thread Listeners


Thanks..:)