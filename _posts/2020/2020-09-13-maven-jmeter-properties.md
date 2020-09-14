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
In this article we are going to see how we can add jmeter properties & configurations in maven plugin. This is continuation post of my [previous article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).

### Properties in jmeter 
- **jmeter.properties** : these are jmeter internal component properties 
- **merge-results.properties** : These are properties for listner which aggregrates multiple JTL files 
- **reportgenerator.properties** : HTML report generator properties 
- **saveservice.properties** : JMX file save, read service properties
- **system.properties** : Jmeter system properties 
- **upgrade.properties** : Jmeter upgrade properties 
- **user.properties** : User customizable properties 
- **global.properties** : Properties used in client-server testing. 

### Properties to work on 
We can change any property file and this will affect in jmeter startup. But, it is safe to change any property key/value in **user.properties** file . **user.properties** will override other properties. 

So, if you need to change any properties from jmeter.properties, put in **user.properties** file. 

### To change user.properties : Best Practice 
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


### To change Property folder 
- By default all properties are pointed to **/src/test/jmeter**, the test case directory. 
- To change the directory 

```
<propertiesFilesDirectory>./src/test/properties</propertiesFilesDirectory>
```

### To change configuration directory 
- by default the configuration directory is **/src/test/conf**. When we want to change , we can use 
```<confFilesDirectory>path_to_cofig_files</confFilesDirectory>```

What are the config files? usually jmeter internal configurations, like log4j2.xml. Or, if you are using any custom JAR which may have any configuration files.

### Use  Custom Property file 
- To use own property file , we can inject with customPropertiesFiles. I am adding local.properties in project 

``` 
<customPropertiesFiles>
    <file>./src/test/conf/dev/local.properties</file>
</customPropertiesFiles>
```

#### [Example Source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-with-custom-properties)
In this example, I have testing with ```./src/test/conf/stage/server.properties```. This is similar like a development environment where 
- developers can test locally 
- developers can test dedicate dev server
- tester can test in qa server
- CI/CD can test in staging server. (i am using this)

in the property file I have following in server.properties 

``` 
thread.name=BDJOBS
base.url=www.bdjobs.com
jobs.url=jobs.bdjobs.com
app.protocol=https
app.port=443
thread.number=5
rampup=10
startup.delay=5
test.duration=600
target.rpm=5
connect.timeout=30000
response.timeout=40000
```

and I am including this property in plugins 

```
<customPropertiesFiles>
    <file>./src/test/conf/stage/server.properties</file>
</customPropertiesFiles>
```

So, you can see the [**POM.XML**](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-with-custom-properties/pom.xml), which is clean and small. 

And, when we run the test , we can see this. I am using jvisualVM to validate only 5 threads are created to test the app. 

![image-custom-file](/images/jmeter-maven/custom-prop-file-thread-number.JPG)

### To Replace Properties 
Usually custom properties are merged with existing properties. If we want wa can replace. 

``` 
<configuration>
    <propertiesReplacedByCustomFiles>true</propertiesReplacedByCustomFiles>
</configuration>
```

### To change global.properties 
This are spatial properties, used to send instructions to remote slave PC in jmeter master-slave execution. 

For example, if we want to run each slave node with 20 threads & 15s ramp-up

```
<propertiesGlobal>
    <threads>10</threads>
    <testIterations>5</testIterations>
</propertiesGlobal>
```

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

### To change system.properties 
if you want to include any system property , you can use this. For example, you want to provide folder path which used in test script, you can use this. 

``` 
<propertiesSystem>
    <my.system.property>my.system.property.value</my.system.property>
</propertiesSystem>
```

Thanks :) 