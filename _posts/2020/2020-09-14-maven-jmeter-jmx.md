---
layout: post
title: Managing Jmeter Test Scripts(JMX) in Maven
date: "2020-09-14 05:02"
tags: [jmeter,ci-cd]
permalink: /2020/09/14/maven-jmeter-plugins-jmx/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can manage Jmeter Test Cases in maven plugin. This is continuation post of [this original article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).

### Defaults : Run All Tests 
By default maven jmeter plugins assume your all test cases are present in **/src/test/jmeter** folder. So, by default, it runs all. So when you just specify jmeter executions, it will run all the test, no need specify any test. 
``` 
<execution>
                            <id>jmeter-tests</id>
                            <goals>
                                <goal>jmeter</goal>
                            </goals>
</execution>
```
### To specify only JMX to run 
If you want to run specific tests, you should add in configuration with testFilesIncluded 
``` 
<configuration>
                        <testFilesIncluded>
                            <jMeterTestFile>test1.jmx</jMeterTestFile>
                        </testFilesIncluded>
```

Now, if you want to add multiple test cases, just add multiple test file 

``` 
<configuration>
                        <testFilesIncluded>
                            <jMeterTestFile>test1.jmx</jMeterTestFile>
                            <jMeterTestFile>test2.jmx</jMeterTestFile>
                        </testFilesIncluded>
```


### Selecting All test
What are the config files? usually jmeter internal configurations, like log4j2.xml. Or, if you are using any custom JAR which may have any configuration files.