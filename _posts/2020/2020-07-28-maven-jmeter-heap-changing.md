---
layout: post
title: High Performing Jmeter by maven
date: "2013-07-28 05:02"
tags: [jmeter,ci-cd]
permalink: /2012/07/28/maven-jmeter-plugins/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---

In this article we are going to see how we can configure Jmeter (JVM) HEAP configuration during test. 

This is very important when you are testing for a big test or limited resources  
[draft]


- As this is performance testing , we will run test in maven verify phase(as integration test)
- There is no Java coding involve, so, no source/test code. those will be empty folders. 
- JMX Script folder : /src/test/jmeter
- Properties folder : /src/test/jmeter
- jmeter config folder (like log4j2.xml) : /src/test/conf
- Test Data(CSV) folder : 

### Run the test 

# Customize Property 
### Jmeter Properties
### User Properties
# The Test Case(jmx file) 





# How to's? 
### JMX Configuration

### JVM Configuration
- to run jmeter JVM with **3gb*** memory, and **768mb** of metaSpace

```
<jMeterProcessJVMSettings>
    <xms>3072</xms>
    <xmx>3072</xmx>
    <arguments>
        <argument>-XX:MaxMetaspaceSize=768m</argument>
    </arguments>
</jMeterProcessJVMSettings>
```

- Applying same thing in Another way 

```
<jMeterProcessJVMSettings>
    <arguments>
        <argument>-XX:MaxMetaspaceSize=768m</argument>
        <argument>-Xmx3072m</argument>
        <argument>-Xms3072m</argument>
    </arguments>
</jMeterProcessJVMSettings>		         
```

- to run jmeter JVM with **3gb*** memory, and **768mb** of metaSpace and enable profiling (for initial diagnosis) 

```
<jMeterProcessJVMSettings>
	<xms>3072</xms>
	<xmx>3072</xmx>
	<arguments>
		<argument>-Xprof</argument>
		<argument>-Xfuture</argument>
		<argument>-XX:MaxMetaspaceSize=768m</argument>
	</arguments>
</jMeterProcessJVMSettings>
```
