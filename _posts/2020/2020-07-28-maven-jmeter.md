---
layout: post
title: Jmeter with maven
date: "2013-07-28 05:02"
tags: [jmeter,ci-cd]
permalink: /2012/07/28/maven-jmeter/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
[DRAFT]
In this article we are going to see how can we perform Jmeter testing using maven, so that we can use this in CI/CD. 

## What is Jmeter? 
Jmeter is a performance testing tool which can be integrated with CI/CD.

## What is Maven 
Maven is Java Build automation tool. 

## Why Maven with Jmeter? 
Usually we test with any Java code. Ideally an acceptance test should have some form of performance testing with it. We are going to use maven jmeter plugins to test a web application like a development project build. 

This will allow us to "Shift Left" performance testing. And this will allow any CI/CD system (like jenkins) , execute the test and show reports.

# Goals
- We will run test 
- we will generate reports 

# Steps 


### Create a Jmeter Test Script
We need to create a jmeter script that we are going to use to generate load. For the example , i am using 
- Base URL = bdjobs.com
- Threads = 20
- Rampup = 10s
- Looping = Infinite (test will stop by time)
- Period = 2min (120s)
- Target Request Per Minuit is 30 (RPM)

##### The test case
We will run only to navigate links present. 
- Step 1 : Going to main url

![http-defaults1](/images/jmeter-maven/test-case-http-defaults.JPG)

![http-defaults1](/images/jmeter-maven/test-case-http-defaults-con-timeout.JPG)

![http](/images/jmeter-maven/test-case-http-request.JPG)

- step 2 : Going to all links of jobs based on locations
- step 3 : Going to all links of jobs based on criteria

For step 2 & step 3, I have used **regular expression extractor** which will help us to get all links dynamically . We will get all links as loop. I wont explain details here as this is only maven execution.(comment if you want to know how)

![loop-location](/images/jmeter-maven/test-case-loop-for-all-locations.JPG)

![loop-category](/images/jmeter-maven/test-case-loop-for-all-catagory.JPG)

We will use  **Constant Throughput Timer** to fill up our target of 30RPM

![ctt](/images/jmeter-maven/test-case-ctt.JPG)

I am going to use 2s delay for each step of request. So, finally test look like this 

![final](/images/jmeter-maven/test-case.JPG)

##### Keep All configuration as property 
- To have dynamic behavior, I am keeping all variable as property in **user define variables**. These are jmeter properties, we can inject this way using maven. 

![jmeter-test-info](/images/jmeter-maven/test-case-udv.JPG)

##### Thread Group configuration
- To get the target RPM i am using 20threads in infinite loop with 2min(120s) duration. This will stop test after 2min. 

![thread-test](/images/jmeter-maven/test-case-thread-config.JPG)

Note : We will see some socket exception for time limit, for this test, please ignore this. In real test , use some bigger time. 

##### [Test Jmx](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-with-basic-report/src/test/jmeter/BDJOBS.jmx)

### Create a maven Project 
Now, lets's open your favorite IDE (i am using intellij IDEA) & create a blank maven project . For this example, I am using 

```
    <groupId>org.automation</groupId>
    <artifactId>jmeter-with-basic-report</artifactId>
    <version>1.0-SNAPSHOT</version>
```

##### Test configuration as maven properties 

Add properties section in pom.xml
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

##### Add jmeter maven plugins
- Create a build section 
- Create Plugins section
- add maven plugin. I am using 3.1.0 version for this example
```
<plugin>
    <groupId>com.lazerycode.jmeter</groupId>
    <artifactId>jmeter-maven-plugin</artifactId>
    <version>${jmeter.plugin.version}</version>
<plugin>
```
- Get Jmeter Jar Configuration as plugin configuration 

```
<plugin>
            <groupId>com.lazerycode.jmeter</groupId>
            <artifactId>jmeter-maven-plugin</artifactId>
            <version>${jmeter.plugin.version}</version>
            <executions>
                <execution>
                    <id>configuration</id>
                    <goals>
                        <goal>configure</goal>
                    </goals>
                </execution>
                <execution>
                    <id>tests</id>
                    <goals>
                        <goal>jmeter</goal>
                    </goals>
                </execution>
                <execution>
                    <id>check-results</id>
                    <goals>
                        <goal>results</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
```

In here you can see there are three goals. 
1. configure : where jmeter is build with dependent JARs from maven repo
2. jmeter : Where jmeter runs the tests
3. results : where jmeter first look for result files and then process results to generate reports.  

##### Configure Maven Plugins 
This part we are going to configure maven plugins with our properties that we specified in maven properties. For this, add configuration section after executions

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

##### Specify test script(JMX)
This part is about the test site. 




### Adding properties 

### adding plugins 

### adding load test properties

### Adding Basic report


# Final POM.XML
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


# Run your Scripts 
Just Maven verify stage ```mvn clean verigy```

# How the Script runs

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

# [Project Source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-with-basic-report)
