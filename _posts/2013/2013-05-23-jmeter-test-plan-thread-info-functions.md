---
layout: post
title: JMeter Test Plan Thread Info by functions
date: "2013-05-23 08:31"
tags: [performance-testing,jmeter]
permalink: /2013/05/23/jmeter-function-thread-info/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker
---

In this following article we are going to see how can we retrieve current Test Plan , Thread and sample information. These are static, so they are rarely used.

### Test Plan Name
- To get name of current running Test Plan ```${__TestPlanName}```
- Only used in function that calls the full test plan.

### Thread Number
- To get number if thread currently running ```${__threadNum}``` 
- It is independent thread wise.
- not useful for test plan

### Current Sample Name 
- To know the current sampler name ```${__samplerName()}``` 
- Not useful for test plan
- Sometimes it can be used with header manager/cookie manager to get value from current sample