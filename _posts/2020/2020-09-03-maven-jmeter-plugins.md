---
layout: post
title: JMeter Plugins managing by maven
date: "2020-09-03 05:02"
tags: [jmeter,ci-cd]
permalink: /2020/09/03/maven-jmeter-plugins/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can configure JMeter with plugins. This is continuation post of [this original article](/2020/08/28/maven-jmeter/).

### What is JMeter Plugin? 
As JMeter is build with plugin architecture, community come forward with different types of plugins when required. And most of the plugins are open sourced. 
You can see JMeter plugins list from [jmeter plugin site](https://jmeter-plugins.org/). All plugins are also available in [**maven central**](https://mvnrepository.com/artifact/kg.apc) also. 

### JMeter Plugins in maven
Now ware going to see plugin options in JMeter maven configuration. In maven central , you can see JMeter plugin set [here](https://mvnrepository.com/artifact/kg.apc). There are 61 plugins there. 

I would suggest to keep JMeter small in size, that means , Only include plugins which we need in the test case. 

In this example, we are going to see,how to include multiple plugins together as well as single plugin. 

From [this original article](/2020/08/28/maven-jmeter/), you can know the basic POM structure. Let's see the JMeter plugins part. 

Among JMeter plugins, one of useful plugin is their thread groups. These thread groups were actually introduced to match up with Load Runner's thread models. 

In this test case, I am using **ultimate thread group** with our existing properties. It looks like this 

![ultimate-thread-group](/images/jmeter-maven/ultimate-threadGroup.JPG)

Now, lets add this ultimate thread group plugin. From [**here**](https://mvnrepository.com/artifact/kg.apc/jmeter-plugins-casutg), you can see latest version 2.9. 

So adding directly like this under configuration. 

```
<jmeterExtensions>
    <artifact>kg.apc:jmeter-plugins-casutg:2.9</artifact>
</jmeterExtensions>
```

And that's all. 
### Run Test 
Lets Run the test using ``` mvn clean verify ```

### What Happened in JMeter build 
So, when we run the test, we can see JMeter build directory , there is a another jat added in **ext** folder. 

![jmeter-plugins](/images/jmeter-maven/jmeter-plugins-jar.JPG)

This is actually the ultimate thread group containing jar. 

That's all. We have used single JMeter plugin. 

### [Finally POM ](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-plugins/pom.xml)

### [Project-source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-plugins)

# Multiple JMeter Plugin example 
I have added 4 plugins here (most commonly used JMeter plugins)

```
<jmeterExtensions>
    <artifact>kg.apc:jmeter-plugins-standard:1.4.0</artifact>
    <artifact>kg.apc:jmeter-plugins-extras:1.4.0</artifact>
    <artifact>kg.apc:jmeter-plugins-graphs-basic:2.0</artifact>
    <artifact>kg.apc:jmeter-plugins-graphs-additional:2.0</artifact>
</jmeterExtensions>
```

- Final [POM.xml](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-multiple-plugins/pom.xml)

- When we run, the JMeter has those JARs. 

![jmeter-multiple-plugins](/images/jmeter-maven/jmeter-multiple-plugins-jar.JPG)

- [Complete Source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-multiple-plugins)

### Note 
- if any plugin use outdated dependencies , use this 

```
<downloadExtensionDependencies>false</downloadExtensionDependencies>
```
Thanks :) 