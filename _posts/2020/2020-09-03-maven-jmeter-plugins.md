---
layout: post
title: JMeter Plugins managing by maven
date: "2020-09-03 05:02"
tags: [jmeter,ci-cd]
permalink: /2020/09/03/maven-jmeter-plugins/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can configure Jmeter with plugins. This is continuation post of [this original article](/2020/08/28/maven-jmeter/).

### What is Jmeter Plugin? 
As jmeter is build with plugin architecture, community come forward with different types of plugins when required. And most of the plugins are open sourced. 
You can see jmeter plugins list from [jmeter plugin site](https://jmeter-plugins.org/). All plugins are also available in [**maven central**](https://mvnrepository.com/artifact/kg.apc) also. 

### Jmeter Plugins in maven
Now ware going to see plugin options in jmeter maven configuration. In maven central , you can see jmeter plugin set [here](https://mvnrepository.com/artifact/kg.apc). There are 61 plugins there. 

I would suggest to keep jmeter small in size, that means , Only include plugins which we need in the test case. 

In this example, we are going to see,how to include multiple plugins together as well as single plugin. 

From [this original article](/2020/08/28/maven-jmeter/), you can know the basic POM structure. Let's see the jmeter plugins part. 

Among jmeter plugins, one of useful plugin is their thread groups. These thread groups were actually introduced to match up with Load Runner's thread models. 

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

### What Happened in Jmeter build 
So, when we run the test, we can see jmeter build directory , there is a another jat added in **ext** folder. 

![jmeter-plugins](/images/jmeter-maven/jmeter-plugins-jar.JPG)

This is actually the ultimate thread group containing jar. 

That's all. We have used single jmeter plugin. 

### [Finally POM ](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-plugins/pom.xml)

### [Project-source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-plugins)

# Multiple Jmeter Plugin example 
I have added 4 plugins here (most commonly used jmeter plugins)

```
<jmeterExtensions>
    <artifact>kg.apc:jmeter-plugins-standard:1.4.0</artifact>
    <artifact>kg.apc:jmeter-plugins-extras:1.4.0</artifact>
    <artifact>kg.apc:jmeter-plugins-graphs-basic:2.0</artifact>
    <artifact>kg.apc:jmeter-plugins-graphs-additional:2.0</artifact>
</jmeterExtensions>
```

- Final [POM.xml](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-multiple-plugins/pom.xml)

- When we run, the jmeter has those JARs. 

![jmeter-multiple-plugins](/images/jmeter-maven/jmeter-multiple-plugins-jar.JPG)

- [Complete Source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-multiple-plugins)

### Note 
- if any plugin use outdated dependencies , use this 

```
<downloadExtensionDependencies>false</downloadExtensionDependencies>
```
Thanks :) 