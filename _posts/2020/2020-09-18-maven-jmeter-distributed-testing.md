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

So, we need two projects one for controller , one for worker. We will run worker project to all worker hosts, but controller will trigger test using RMI.  

As we know , we need to setup RMI, there are some manual steps before original test execution. 

### RMI setup
- We need to create SSL keys to use in both controller & worker for RMI. JDK comes with **keytool** which we need to use. 

``` 
keytool -genkey -keyalg RSA -alias rmi -keystore rmi_keystore.jks -storepass changeit -validity 7 -keysize 2048 %*
```

In jmeter bin directory, you can see a script **create-rmi-keystore.bat** containing the same command. We can use this in commandline which will create **rmi_keystore.jks**  

I am using following info with my password to create **jks** file. You should your own password & info. 

![jks-setup](/images/jmeter-maven/jks-info.JPG)

For , jmeter GUI, We have to keep this in jmeter bin directory. So in this case, we will keep in **/src/test/conf**

 

### Add info to user.properties 
After adding jks file, we need to specify associated property so that jmeter can work properly. So, we need following properties based on info when I have created jks.

``` 
# DISTRIBUTED TESTING CONFIGURATION
# Type of keystore : JKS
server.rmi.ssl.keystore.type=JKS
# Keystore file that contains private key
server.rmi.ssl.keystore.file=rmi_keystore.jks
# Password of Keystore
server.rmi.ssl.keystore.password=123456
# Key alias : this is very important to be matched with command alies in keytool
server.rmi.ssl.keystore.alias=rmi
# Type of truststore : JKS
server.rmi.ssl.truststore.type=JKS
# Keystore file that contains certificate
server.rmi.ssl.truststore.file=rmi_keystore.jks
# Password of Trust store
server.rmi.ssl.truststore.password=123456
# Set this if you don't want to use SSL for RMI
server.rmi.ssl.disable=true
```

This should be in both **worker & controller** user.properties. 

Now, you may avoid using user.properties and directly put in ```<propertiesUser>``` section (i prefer)

### Add worker info to controller
Now we need worker IP addresses in controller user.properties. 
```
remote_hosts=192.168.4.6
```

We can also do this by plugin configuration. I prefer this way to keep it changeable during maven command. So, I will add my servers with ```<serverList>```. This accepts comma separated multiple values. 

```
  <serverList>192.168.4.6</serverList>
```

### Jmeter Remote [Controller Project](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-controller-remote)
- This will have JMX
- This will have JKS files
- This will have user properties

### Add RMI info to worker property 
- This will **not** have any JMX as it will injected by server 
- Keep created JKS file **rmi_keystore.jks** at **/sec/test/conf** folder 
- Use **user.properties** like controller like this 

``` 
server.rmi.ssl.keystore.type=JKS
server.rmi.ssl.keystore.file=rmi_keystore.jks
server.rmi.ssl.keystore.password=123456
server.rmi.ssl.keystore.alias=rmi
server.rmi.ssl.truststore.type=JKS
server.rmi.ssl.truststore.file=rmi_keystore.jks
server.rmi.ssl.truststore.password=123456
server.rmi.ssl.disable=true
```

I am keeping **user.properties** in /src/test/jmeter folder.

- We need to have two executions in jmeter plugins, just enough to install & run as remote server. 

```
<execution>
    <id>configuration</id>
    <goals>
        <goal>configure</goal>
    </goals>
</execution>
<execution>
    <id>start-jmeter-server</id>
    <goals>
        <goal>remote-server</goal>
    </goals>
</execution>
``` 

I am adding additional runInBackground property false, this is optional. 

- We need to Add worker's IP info . I am injecting via maven property  ```<hostname>192.168.4.5</hostname>``` into configuration. And keeping default server port *1099*

``` 
<configuration>
    <exportedRmiHostname>${hostname}</exportedRmiHostname>
    <serverPort>1099</serverPort>
</configuration>
```

So, please see worker project for final pom. 

### Jmeter Remote [Worker Project](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-worker-remote)
- This will have JKS files
- This will have user properties

### Executing Remote tests 
- Step 1 : Run Jmeter worker project ``` mvn clean verify ``` 

- Step 2 : Run Jmeter controller project ``` mvn clean verify ```  

In worker : 

![worker](/images/jmeter-maven/jmeter-worker-run.JPG)

In Controller : 

![controller](/images/jmeter-maven/remote-controller.JPG)

- Step 3 : Ger report from controller. 

### Notes : 
- SSL is disable to avoid manual process. As it is intranet setup, so, security issues can be ignored. 
- All are done with Oracle JDK8, so key standard is JKS. If you are using latest openjdk, you might need to use **P12** format. You may use my keystore command.  

``` 
keytool -genkeypair -alias pkcs12 -keyalg EC -dname "cn=CN, ou=OU, o=O, c=C" -validity 365 -keystore shantonu_key_store.pfx -keypass 123456 -storepass 123456 -v
```

in this case you need to change user properties based on command like alias is **pkcs12**, format is **pkcs12**, file name is **hantonu_key_store.pfx**

- If you have existing JKS file, you can convert to P12. 
- JKS to P12 : ```keytool -importkeystore -srckeystore keystore.jks -srcstoretype JKS -deststoretype PKCS12 -destkeystore keystore.p12```

- P12 to JKS : ```keytool -importkeystore -srckeystore keystore.p12 -srcstoretype PKCS12 -deststoretype JKS -destkeystore keystore.jks```
- For security, my repository wont have JKS keys of my PC
- For simplicity, I am using password 123456
- [detail RMI setup](https://jmeter.apache.org/usermanual/remote-test.html#setup_ssl)