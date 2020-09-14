---
layout: post
title: Managing Properties in Jmeter Maven
date: "2020-09-13 05:02"
tags: [jmeter,ci-cd]
permalink: /2013/09/13/maven-jmeter-Properties/
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
We can change any property file and this will affect in jmeter startup. But, it is safe to change any property key/value in **user.properties** file . Usually properties in this file will override other prperties values. 

So, if you need to change any properties from jmeter.properties, put in **user.properties** file. 

### Default Property Path
By default all properties are pointed to **/src/test/jmeter**, the test case directory. 


### To change configuration directory 
- by default the configuration directory is **/src/test/conf**. When we want to change , we can use 
```<confFilesDirectory>path_to_cofig_files</confFilesDirectory>```

What are the config files? usually jmeter internal configurations, like log4j2.xml. Or, if you are using any custom JAR which may have any configuration files.

### To change jmeter.properties : Best Practice 
This is recommended way to inject custom property in jmeter. Infant, if you want ot change any jmeter internal property , use this way. User property will always override system property. So, if you have any changed values, do it here. 

I also prefer to parametrize Load Test properties. 

#### [Example Source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-with-user-properties)

In my example i am using these properties. 
```
 <propertiesUser>
 			<base.url>www.bdjobs.com</base.url>
 			<jobs.url>jobs.bdjobs.com</jobs.url>
 			<app.protocol>https</app.protocol>
 			<app.port>443</app.port>
 			<connect.timeout>30000</connect.timeout>
 			<response.timeout>40000</response.timeout>
 			<thread.name>my_testing_threads</thread.name>
 			<thread.number>20</thread.number>
 			<rampup>60</rampup>
 			<startup.delay>5</startup.delay>
 			<test.duration>600</test.duration>
 			<target.rpm>10</target.rpm>
 			<jmeter.save.saveservice.thread_counts>true</jmeter.save.saveservice.thread_counts>
</propertiesUser>
```

A skater approach is to parametrize even these property with maven property. So that when we need , we can change these values when we execute. 

#### [Example Source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-with-maven-properties)  

In here you can see I have following maven properties , which is adding values inside jmeter plugins user properties 

- Maven Properties 

```
    <properties>
        <BUILD_TAG>${project.version}</BUILD_TAG>
        <base.url>www.bdjobs.com</base.url>
        <jobs.url>jobs.bdjobs.com</jobs.url>
        <protocol>https</protocol>
        <port>443</port>
        <connect.timeout>30000</connect.timeout>
        <response.timeout>40000</response.timeout>
        <thread.name>BDJOBS</thread.name>
        <thread.number>20</thread.number>
        <rampup>10</rampup>
        <startup.delay>5</startup.delay>
        <test.duration>600</test.duration>
        <target.rpm>30</target.rpm>
        <jmeter.plugin.version>3.1.0</jmeter.plugin.version>
        <encoding>UTF-8</encoding>
        <project.build.sourceEncoding>${encoding}</project.build.sourceEncoding>
        <project.reporting.outputEncoding>${encoding}</project.reporting.outputEncoding>
        <project.resources.sourceEncoding>${encoding}</project.resources.sourceEncoding>
    </properties> 
```

- And properties are injected inside maven plugins 

```
<configuration>
    <propertiesUser>
        <base.url>${base.url}</base.url>
        <jobs.url>${jobs.url}</jobs.url>
        <app.protocol>${protocol}</app.protocol>
        <app.port>${port}</app.port>
        <connect.timeout>${connect.timeout}</connect.timeout>
        <response.timeout>${response.timeout}</response.timeout>
        <thread.name>${thread.name}</thread.name>
        <thread.number>${thread.number}</thread.number>
        <rampup>${rampup}</rampup>
        <startup.delay>${startup.delay}</startup.delay>
        <test.duration>${test.duration}</test.duration>
        <target.rpm>${target.rpm}</target.rpm>
    </propertiesUser>
</configuration>
```

so, what advantage I am getting? In this way, we can actually change property values with maven commands. 

For example, let's say, we want to change our **thread.number** from 20 to 50, **target.rpm** 30 to 40. So, with maven command I will change property 

``` 
mvn -Dthread.number=50 -Dtarget.rpm=40 clean verify
```

In this way , we can reuse same test case for different load configurations, different environments etc. 

### To change jmeter.properties : I wont recommend
This way we can change jmeter properties, for example, to change log level of Jmeter's own logging system 
``` 
<propertiesJMeter>
    <log_level.jmeter>DEBUG</log_level.jmeter>
<propertiesJMeter>
```

### To change saveservice.properties : recommend for custom sampler
**saveservice** is mainly used for jmeter internal JMX serialization work.  It is used to define how XStream (de-)serializes classnames. 

Use this only when you have your own developed sampler included in JMX. 

``` 
<propertiesSaveService>
    <HTTPSampler2>org.automation.jmeter.protocol.http.sampler.my_custom_sampler</HTTPSampler2>
</propertiesSaveService>
```

### To change upgrade.properties : recommend for updated components
- If you have done any update or include any other component in Jmeter, you can use this to include. This also apply having company specif classes used in test project.

``` 
<propertiesUpgrade>
    <my.old.ClassName>my.new.ClassName</my.old.ClassName>
</propertiesUpgrade>
```

Thanks :) 