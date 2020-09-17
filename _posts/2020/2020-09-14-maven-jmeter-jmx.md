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
By default maven jmeter plugins assume your all test cases are present in **/src/test/jmeter** folder. So when you just specify jmeter executions, it will run all the test, no need specify any test. 

``` 
<execution>
	<id>jmeter-tests</id>
	<goals>
		<goal>jmeter</goal>
	</goals>
</execution>
```

### Specify Folder for Test Cases 
To change default test case folder , we need to use **testFilesDirectory**

```
<configuration>
    <testFilesDirectory>/src/test/testcases</testFilesDirectory>
</configuration>
```

### Specify JMX to run 
If you want to run specific tests, you should add in configuration with testFilesIncluded
 
``` 
<testFilesIncluded>
    <jMeterTestFile>test1.jmx</jMeterTestFile>
</testFilesIncluded>
```

Now, if you want to add multiple test cases, just add multiple test file 

``` 
<testFilesIncluded>
    <jMeterTestFile>BDJOBS1.jmx</jMeterTestFile>
    <jMeterTestFile>BDJOBS2.jmx</jMeterTestFile>
</testFilesIncluded>
```

#### [Multiple JMX Example](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-multiple-jmx)

![multiple-jmx](/images/jmeter-maven/multiple-jmx-run.JPG)

![multiple-jmx-results](/images/jmeter-maven/multiple-jmx-run-results.JPG)

### Specify JMX to run by Regular Expression 
If you want to run test cases with specific regular expression patterns, you can use regex. 

For example, you want to run different type of login scenarios where each jmx contain each type of log-ins, so you should use like this. In here all login related test cases has prefix **login**. 

``` 
<testFilesIncluded>
	<jMeterTestFile>login*.jmx</jMeterTestFile>
</testFilesIncluded>
```

#### [Multiple JMX Example with regix](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-include-jmx-regex)

![multiple-jmx-regex](/images/jmeter-maven/multiple-jmx-run-regix.JPG)

![multiple-jmx-results-regex](/images/jmeter-maven/multiple-jmx-regex-results.JPG)


### Excluding JMX
If you have many test cases in jmeter folder and you want to exclude test cases, you have to use **testFilesExcluded** 

``` 
<testFilesExcluded>
	<excludeJMeterTestFile>test3.jmx</excludeJMeterTestFile>
</testFilesExcluded>
```

Like include , exclude also supports multiple files 

``` 
<testFilesExcluded>
	<excludeJMeterTestFile>test3.jmx</excludeJMeterTestFile>
	<excludeJMeterTestFile>test4.jmx</excludeJMeterTestFile>
</testFilesExcluded>
```

### Excluding JMX with Regex
Like include you can also use regex to exclude. From include example, if we want to exclude all login test cases, we will use like this 

```
<testFilesExcluded>
	<excludeJMeterTestFile>login*.jmx</excludeJMeterTestFile>
</testFilesExcluded>
```

#### [Multiple JMX Example with regix]()

![multiple-jmx-results-regex-exclude](/images/jmeter-maven/test-exclude-regex.JPG)



### Notes : 
- Multiple tests will run serial , not in parallel. 
