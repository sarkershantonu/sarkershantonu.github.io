---
layout: post
title: Jmeter-Plugins execution tweaks
date: "2013-09-06 05:02"
tags: [jmeter,ci-cd]
permalink: /2013/09/06/maven-jmeter-plugins-tweaks/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
[draft]
In this article we are going to see how we can configure Jmeter with plugins. This is continuation post of [this original article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).


### Maven Build Erors 
- To prevent maven build error, its better to have some threshold values to test case where a certain number of errors can be accepted. I prefer 2% error is tailorable. To apply this, use 
```<errorRateThresholdInPercent>2</errorRateThresholdInPercent>``` in configuration section. 

