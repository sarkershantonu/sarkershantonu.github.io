---
layout: post
title: Installing JMeter plugins in Linux CLI/Cloud/AWS/Azure/GCP
date: "2021-01-06 17:02"
tags: [jmeter,ci-cd, linux]
permalink: /2021/01/06/install-jmeter-plugins-cli/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter"
gh-badge: [star,follow]
comments: true
---

In this article we are going to see how we can install JMeter plugins in CLI linux. 

This is very useful for AWS, remote servers with no gui, installing over SSH, Docker configuration etc. 

### Step 1 : Dependencies 

- Update OS Apps

``` 
sudo apt-get update
```

- For downloading , you need CURL/WGET

```
sudo apt install curl -y
```

- As JMeter 5.3 requires JDK8+. Any jdk distribution will be okay. But for view result tree, Oracle jdk (for java fx) is required. As we are running in CLI, we can ignore that.

```
sudo apt install -y default-jdk
```

For Debian 10/ubuntu 20, default jdk is 11. So, after installation we can validate version.

![java-version](/images/jmeter/install-cli/java-11-installation.JPG)

- Create a folder where you used to store all artifacts. I have created jm53

![work-dir](/images/jmeter/install-cli/work-dir.JPG)

### Step 2 : Download JMeter 

- We will use ``/opt`` to install JMeter after configuration.  I am going to use JMeter 5.3 in this example, you can use other versions. 

```
curl -O https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.3.tgz
```

![download-jmeter](/images/jmeter/install-cli/download-jmeter.JPG)

### Step 3 : Extract JMeter archive

``` 
tar -xvf apache-jmeter-5.3.tgz 
```

### Step 4: Optional : Remove Unnecessary Folders

- Remove **docs**
- Remove **printable_docs**

``` 
rm -rf apache-jmeter-5.3/docs apache-jmeter-5.3/printable_docs 
```

![removed-docs](/images/jmeter/install-cli/removed-docs.JPG)

### Step 5 : Download CMD Runner in lib folder

- Goto lib folder
- Download current CMD runner version 2.2.1

``` 
cd apache-jmeter-5.3/lib
curl -O https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.2.1/cmdrunner-2.2.1.jar
```

![download-cmd](/images/jmeter/install-cli/cmd-download.JPG)

### Step 6 : Download JMeter plugin Manager

- Goto lib/ext folder
- Download JMeter plugin Manager , current version is 1.6

``` 
cd ext/
curl -O https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.6/jmeter-plugins-manager-1.6.jar
```
![download-plugin-manager](/images/jmeter/install-cli/plugins-download.JPG)

### Step 7 : Download Plugins

- get back to lib folder and execute cmd runner with plugins 
- We have to exclude unwanted plugins. I am excluding jpgc-hadoop,jpgc-oauth,ulp-jmeter-autocorrelator-plugin,ulp-jmeter-videostreaming-plugin,ulp-jmeter-gwt-plugin

```
cd ..
java  -jar cmdrunner-2.2.1.jar --tool org.jmeterplugins.repository.PluginManagerCMD install-all-except jpgc-hadoop,jpgc-oauth,ulp-jmeter-autocorrelator-plugin,ulp-jmeter-videostreaming-plugin,ulp-jmeter-gwt-plugin,tilln-iso8583
```

And you should see plugins installing to JMeter. 

![download-jmeter-plugins](/images/jmeter/install-cli/download-jmeter-plugins.JPG)

### Step 8: Validate JMeter Version
- Please check JMeter Version. You need to goto bin folder and run JMeter executable

``` 
cd apache-jmeter-5.3/bin

./jmeter.sh --version
```

![jmeter-version](/images/jmeter/install-cli/jmeter-version.JPG)

### Step 9: Move JMeter to OPT
As we are making standard installation, we need to move JMeter to the OPT folder. 

``` 
cp -r apache-jmeter-5.3 /opt/
```

![jmeter-opt](/images/jmeter/install-cli/cp-opt.JPG)

### Step 10: Put JMeter in PATH variable
We need to JMeter in PATH variable. You can do this in many ways, but I prefer this way. 

- See your current PATH variable values ```echo $PATH```

![path-before](/images/jmeter/install-cli/path-value-before.JPG)

- edit you **.profile** file to add environment variables 

```
nano .profile
```
- Add JMeter Home variable at the end of the line 

``` 
JMETER_HOME="/opt/apache-jmeter-5.3"
```

- Modify PATH variable at the end of the line

``` 
PATH="$JMETER_HOME/bin:$PATH"
```

- Reload your bash profile 

``` 
source ~/.profile
```

To test, lets see the path ```echo $PATH``` & we can see JMeter added

![jmeter-done](/images/jmeter/install-cli/path-value-after.JPG)

And let's check JMeter version by ```jmeter --version```

![jmeter-done](/images/jmeter/install-cli/env-jmeter-version.JPG)

We are done.

### PluginManagerCMD Details | Optional Learning
From github [**repository**](https://github.com/undera/jmeter-plugins-manager/blob/master/src/main/java/org/jmeterplugins/repository/PluginManagerCMD.java), you can see how CMD runner processing the installation. .

In this example I am using  **install-all-except**, but you can also use 
- status 
- install
- install-for-jmx
- uninstall
- available
- upgrades
- help

**Now, what plugins to select /exclude?** 

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
- JMeter-core
- JMeter-tcp
- JMeter-ldap
- JMeter-native
- JMeter-mongodb
- JMeter-mail
- JMeter-junit
- JMeter-jms
- JMeter-jdbc
- JMeter-java
- JMeter-ftp
- JMeter-http
- JMeter-components
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
- JMeter.backendlistener.elasticsearch
- JMeter.pack-listener
- JMeter.backendlistener.kafka
- ulp-jmeter-autocorrelator-plugin
- ulp-jmeter-videostreaming-plugin
- ulp-jmeter-gwt-plugin
- JMeter.backendlistener.azure
- JMeter-pubsub-sampler
- JMeter-prometheus

Now, either you can choose **install** and select all plugin ids, or you can choose **install-all-except** & provide excluded ones. 

I always exclude all UBIK plugins as they are proprietary. 

### Notes 
1. In all download you may use ```wget``` instead of ```curl -O```
2. Choose plugins which are included in test cases. 
3. If you are making a generic test execution environment , try to keep all plugins (if necessary, licenced ones also)
