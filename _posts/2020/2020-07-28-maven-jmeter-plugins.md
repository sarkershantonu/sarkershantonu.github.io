---
layout: post
title: Jmeter-Plugins with maven
date: "2020-09-03 05:02"
tags: [jmeter,ci-cd]
permalink: /2020/09/03/maven-jmeter-plugins/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can configure Jmeter with plugins. This is continuation post of [this original article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).

### WHat is Jmeter Plugin? 
As jmeter is build with plugin architecture, community come forward with different types of plugins when it is needed. And most of the plugins are outsourced. 
You can see jmeter plugins list from [jmeter plugin site](https://jmeter-plugins.org/). All plugins are also available in maven central also. 

### Jmeter Plugins in maven
Now ware going to see plugin options in jmeter maven configuration. In maven central , you can see jmeter plugin set [here](https://mvnrepository.com/artifact/kg.apc). There are 61 plugins there. 

I would suggest to keep jmeter small, that means , Only include plugins which we need in the test case. 



### [Finally POM ](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-plugins/pom.xml)

### [Project-source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-plugins)