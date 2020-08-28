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
- Target Request Per Minuit is 30

##### The test case
We will run only to navigate links present. 
- Step 1 : Going to main url
- step 2 : Going to all links of jobs based on locations
- step 3 : Going to all links of jobs based on criteria

For step 2 & step 3, I have used **regular expression extractor** which will help us to get all links dynamically . We will get all links as loop. I wont explain details here as this is only maven execution.(comment if you want to know how)
 
##### Keep All configuration as property 
- To have dynamic behavior, I am keeping all variable as property in **user define variables**. These are jmeter properties, we can inject this way using maven. 
![jmeter-test-info](/images/jmeter-maven/test-case-udv.JPG)

##### Thread Group : 


##### Test Script details 
- In the test 


### Create a Blank Project 

### Specify test script(JMX)
This part is about the test site. 


### Configure Maven Plugins 

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

