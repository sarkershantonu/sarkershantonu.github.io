---
layout: post
title: Jmeter Distributed testing using Maven
date: "2020-09-18 05:02"
tags: [jmeter,ci-cd]
permalink: /2020/09/18/maven-jmeter-distributed-testing/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can perform distributed testing using maven jmeter plugin. This is continuation post of [this original article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).

To know basic about Jmeter distributed testing, you may visit [**this**](https://jmeter.apache.org/usermanual/remote-test.html) or [my blog](https://shantonusarker.blogspot.com/2013/01/how-to-distribute-test-in-jmeter.html). 

# Remote Testing at a glance

![remote-testing](/images/jmeter-maven/remote-testing.jpg)

So, we need two projects one for controller , one for slave. We will run slave to all slave hosts, but controller will trigger. 

As we know , we need to setup RMI, there are some manual steps before original test execution. 

# RMI setup
- In jmeter controller 


### [Command to create key pair](https://jmeter.apache.org/usermanual/remote-test.html#setup_ssl) 

``` 
keytool -genkey -keyalg RSA -alias rmi -keystore rmi_keystore.jks -storepass changeit -validity 7 -keysize 2048 %*
```

- In jmeter bin directory, you can see a script **create-rmi-keystore.bat** containing the same command. This will create **rmi_keystore.jks**  

I use following info with a password to create **jks** file. 

![jks-setup](/images/jmeter-maven/jks-info.JPG)

We used to keep this in jmeter bin directory. So in this case, we will keep in **/src/test/conf**

# Jmeter Remote Controller POM 

# Jmeter Remote Worker POM

# Notes : 
- SSL is disable to avoid manual process. As it is intranet setup, so, security issues can be ignored. 