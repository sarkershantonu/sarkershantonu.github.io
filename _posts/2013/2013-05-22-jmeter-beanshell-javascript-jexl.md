---
layout: post
title: Running BeanShell/JavaScript/JEXL in Jmeter
date: "2013-05-22 08:31"
tags: [performance-testing,jmeter]
permalink: /2013/05/22/jmeter-beanshell-javascript-jexl/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how can we run scripts (BeanShell/JavaScript/JEXL) inside jmeter with functions. 

We know there are number of post and pre processors are there to do that. But in here we will see how can we run functionally in a simple manner.

### Bean Shell Script : 

```
${__BeanShell(beanShellScript,myVer)}
``` 

It has two parameter(both mandatory), first one bean shell script as string or file locator. Second one the name of variable. 

Example with file locator is
${__BeanShell(source("testFunctionfile.bsh"),myVer)} 

- It returns the value depend on what script we use.
- If the **property** ```beanshell.function.init``` is defined, we can use the name of a sourced file. 
- Single function can be called in multiple threads. In that case we need to use execute() to synchronize.
- This can be used to define common methods and variables 
- There is a sample init file in the **/bin** directory: ```BeanShellFunction.bshrc```

### JavaScript : 

```
${__javaScript(new Date(),currentDate)}
```

The JavaScript runner function has two parameter, first one is the java script expression(mandatory) and second one is the variable name where captured data will be stored.

JMeteruse JavaScript Standalone interpreter inside [apache rhino](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/Rhino) to run the script

### [JXEL Script](http://commons.apache.org/proper/commons-jexl/) :  

```
${__jexl(aString.length(),myVariableLength)}
```
- The JEXL script runner function has two parameter, first one is the JEXL script expression(mandatory) and second one is the variable name where captured data will be stored.
- JEXL can create Class(in JAVA) and call methods. So, dynamic scripting possible with this function. 

The **__jexl2** does the same purpose with more support. 

**Note** : These variables are set before any of the script execution, so we can work with them in BeanShell/ JavaScript/ JEXL script.

- log - the logger for the function (*)
- ctx - the current JMeter context variable
- vars - the current JMeter variables
- props - JMeter Properties object
- threadName - the threadName (String)
- Sampler the current Sampler, if any
- SampleResult - the current SampleResult, if any

This is spatially for JEXL 
- OUT - System.out - e.g. OUT.println("Printing message")

Thanks...:)