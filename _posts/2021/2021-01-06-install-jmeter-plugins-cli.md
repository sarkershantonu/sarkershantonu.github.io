---
layout: post
title: Installing Jmeter plugins in Linux CLI
date: "2021-01-06 17:02"
tags: [jmeter,ci-cd]
permalink: /2021/01/06/install-jmeter-plugins-cli/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---

In this article we are going to see how we can install Jmeter plugins in CLI linux. 

This is very useful for aws, remote servers with no gui, installing over SSH, Docker configuration etc. 

### Step 0 : Dependencies 
- For downloading , you need CURL/WGET
```
sudo apt install curl -y
```
- For Running jmeter , you need an oracle jdk8+
- Create a folder where you used to store all artifacts. I have created jm53

![work-dir](/images/jmeter/install-cli/work-dir.JPG)
  
- We will use ``/opt`` to install jmeter after configuration. 

### Step 1 : Update OS Apps
``` 
sudo apt-get update
```

### Step 2 : Download Jmeter 
I am going to use jmeter 5.3 in this example, you can use other versions. 
```
curl -O https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.3.tgz
```

![download-jmeter](/images/jmeter/install-cli/download-jmeter.JPG)

### Step 3 : Extract Jmeter archive
``` 
tar -xvf apache-jmeter-5.3.tgz 
```

### Step 4: Optional : Remove Unnecessary Folders
- Remove **docs**
- Remove **printable_docs**
``` 
rm -rf apache-jmeter-5.3/docs apache-jmeter-5.3/printable_docs 
```

### Step 5 : Download CMD Runner in lib folder
- Goto lib folder
- Download current CMD runner version 2.2.1
``` 
cd apache-jmeter-5.3/lib
curl -O https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.2.1/cmdrunner-2.2.1.jar
```

### Step 6 : Download jmeter plugin Manager
- Goto lib/ext folder
- Download Jmeter plugin Manager , current version is 1.6
``` 
cd ext/
curl -O https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.6/jmeter-plugins-manager-1.6.jar
```

### Step 7 : Download Plugins
- get back to lib folder and execute cmd runner with plugins 
- We have to exclude unwanted plugins. I am excluding  jpgc-hadoop,jpgc-oauth
```
cd ..
java  -jar cmdrunner-2.2.1.jar --tool org.jmeterplugins.repository.PluginManagerCMD install-all-except jpgc-hadoop,jpgc-oauth,ulp-jmeter-autocorrelator-plugin,ulp-jmeter-videostreaming-plugin,ulp-jmeter-gwt-plugin,
```

And you should see plugins installed. 

### Step 8: Adding Jmeter in Environment

### PluginManagerCMD Details 
From github [**repository**](https://github.com/undera/jmeter-plugins-manager/blob/master/src/main/java/org/jmeterplugins/repository/PluginManagerCMD.java), you can see how CMD runner processing the installation. .

In this example I am using  **install-all-except**, but you can also use 
- status 
- install
- install-for-jmx
- uninstall
- available
- upgrades
- help

**Now, what plugins to exclude?** 

You can see the whole list [***here***](https://jmeter-plugins.org/repo/). If you get the IDs, you can see which are not needed. And  put those after **install-all-except** with a comma. 

### Available Plugins 
From https://jmeter-plugins.org/repo/ , you can see IDs of all available plugins. 

- blazemeter-debugger
- jpgc-directory-listing
- bzm-random-csv
- bzm-parallel
- jpgc-rotating-listener
- jpgc-sense
- jpgc-wsc
- jpgc-xmpp
- bzm-hls
- bzm-http2
- bzm-rte
- bzm-siebel
- mqmeter
- bzm-jmeter-citrix-plugin
- jmeter-core
- jmeter-tcp
- jmeter-ldap
- jmeter-native
- jmeter-mongodb
- jmeter-mail
- jmeter-junit
- jmeter-jms
- jmeter-jdbc
- jmeter-java
- jmeter-ftp
- jmeter-http
- jmeter-components
- jpgc-graphs-basic
- jpgc-graphs-additional
- jpgc-graphs-composite
- jpgc-graphs-dist
- jpgc-graphs-vs
- jpgc-autostop
- jpgc-casutg
- jpgc-csl
- jpgc-csvars
- jpgc-dbmon
- jpgc-dummy
- jpgc-ffw
- jpgc-fifo
- jpgc-functions
- jpgc-httpraw
- jpgc-jms
- jpgc-jmxmon
- jpgc-json
- jpgc-lockfile
- jpgc-oauth
- jpgc-perfmon
- jpgc-prmctl
- jpgc-redis
- jpgc-tst
- jpgc-udp
- jpgc-webdriver
- jpgc-xml
- jpgc-standard
- jpgc-cmd
- jpgc-filterresults
- jpgc-ggl
- jpgc-mergeresults
- jpgc-pde
- jpgc-plancheck
- jpgc-synthesis
- jpgc-sts
- jpgc-plugins-manager
- ssh-sampler
- websocket-sampler
- mqtt-sampler
- netflix-cassandra
- kafkameter
- custom-soap
- tilln-formman
- tilln-iso8583
- tilln-sshmon
- tilln-wssecurity
- jpgc-hadoop
- websocket-samplers
- jmeter.backendlistener.elasticsearch
- jmeter.pack-listener
- jmeter.backendlistener.kafka
- ulp-jmeter-autocorrelator-plugin
- ulp-jmeter-videostreaming-plugin
- ulp-jmeter-gwt-plugin
- jmeter.backendlistener.azure
- jmeter-pubsub-sampler
- jmeter-prometheus

Now, either you can choose **install** and select all plugin ids, or you can choose **install-all-except** & provide excluded ones. 

I always exclude all UBIK plugins as they are proprietary. 

### Notes 
1. In all download you may use ```wget``` instead of ```curl -O```
2. Choose plugins which are included in test cases. 
3. If you are making a generic test execution environment , try to keep all plugins (if necessary, licenced ones also)