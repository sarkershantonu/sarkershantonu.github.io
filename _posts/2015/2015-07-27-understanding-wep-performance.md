---
layout: post
title:  Understanding Web Performance
date: "2015-07-27 21:29"
tags: [performance-testing]
permalink: /2015/07/27/understanding-web-performance/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
In this article we are going to know about an web application performance ? what does it means by performance. 

These are very generic ideas , spatially for **managers**, **decision makers** or a person who is **very new to performance testing**.

### Knowing Web Application 
Do you really know what is your web application performance? I am trying to break down, you can see each politest for understanding.

#### Understand Web App User Load model or Business mode : 
This is very important , before trying to know any of performance activity, you need to know how user interact with your system. What they expect/ what your company target. This will breakdown your performance expectation. 

User activity monitoring from browser tools might help to know your user better. Now a days all browsers have build in tools for user experience measurement.

#### Understand Web App load : 
Do you know how much you application can take load? Load of what? User load, data load. 

By mean of load, i referrer to knowing the application's height usages model. 

To know this , you need simple load testing. 

You need to measure, **what max user supports, max data load support**. 

While testing the load, you need to stop when you are getting error.

#### Understand Web App stability : 
Do you know how much you application is stable? What do you mean by stable? It means can you application work properly under any circumstances. 

From previous load test activity, we will know application average and high load condition. So, how the application is stable under this high/avg condition. 

To know that you need to perform stress testing for a longer period of time. This period depend on your required environment. It can be 1 hour, 2 hours, 8 hours or even 1 week. 

The target of this is to know stability of application in given load situation which is normally referred to stress testing.

#### Understand Web App tolerance: 
Do you know what will happen if your application gets sudden peak of user or data transaction or low network / IO bandwidth? 

To know the tolerance of your web application, you need to perform spike test. A spike test refers to , sudden growth of user/ data usages for a small number of time. 

This will test your system , how they can tolerate sudden peak.

#### Understand Web App capacity : 
Understanding maximum capacity and stability is very important. For this you need to perform load testing and stress testing together. 

Than mean , long term maximum supported load scenarios and stress scenarios together. 

You will know about  , the bucket(server/IO/NET) capacity. This is very important in cloud environment spatially in scale in or scale out capacity measurement. 

This is measured by **X**, means, for **example**, your application supports **5000 users** , but it can be scale up to **2x (2x5000=10000 users)**.

#### Understand Web App boundary : 
This is the boundary checking. What will happen if  application is under extreme load and stress with error/exception condition. 

This test will define your extreme condition and boundary. Usually this is measured with capacity (X) and expected errors. 

Mainly this is king of precaution test for expected error behaviors. This is very critical for , financial domains and security concerned domains.

#### Understand server throughput : 
Do you know what is your server (app/data etc) power or capacity? 

This is measured by throughput. More powered server has better throughput. It is measured by **Hit per second(HPS)**. 

More often it is also expressed in **Transaction per second** where transaction referrers to **business specified transaction**. 

The more throughput you have does not mean the fast websites, but it means server power is more. Because, faster response time has many factors and definitely throughput is one  of them. 

So, that is why all Load generation tools have this measurement. And, from **SLA** agreement, this term is clearly **specified**.

#### Understand resource usages : 
Do you know , how much resources you have to run your web application and how much your application uses? And is it enough? By resource, i want to mean
- Network bandwidth
- Disk IO 
- Memory
- CPU

**Do you monitor in you system server?** If not, then how can you be ensure the performance that you need.

To monitor the whole system, you need to know about your resources for each component of your whole environment. Most of OS have their own monitoring system.

You may visit [**Sysinternals-Suite**](https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite) if you are monitoring/debugging windows environment.

Windows also have [**perfmon**](https://techcommunity.microsoft.com/t5/ask-the-performance-team/windows-performance-monitor-overview/ba-p/375481) builtin which you can monitor the whole system.

Beside that, now a days companies use APM solution which covers all of you monitoring in single application. To use an APM, you need an agent in each server that does the job for you.

(there are some outsourced APM, you need to get & configure for your system)

#### Understand Web App Activity: 
As you monitor you infrastructure, there is become essential to monitor application it self. That means, **application server monitoring, DB monitoring, middle layer monitoring** etc. 

Based on technology each items has its own different performance counters. For dotnet, java, ruby, python, php, nodejs etc has its own performance counters according to its architecture and working mechanism. 

To pinpoint your bottlenecks and validate improvements, you must know your application activity. Each technology component has its own monitoring tools.

**Java** : [Java Mission Control](https://www.oracle.com/java/technologies/jdk-mission-control.html) , [**Visual VM**](https://visualvm.github.io/), [**JDK/Command line tools**](/tag/jdk-tools/)

**Dotnet** : PerfView & Framework tools along with all Sysinternals-Suite,[ILSpy](https://github.com/icsharpcode/ILSpy) ,[**Glimpse**](https://docs.microsoft.com/en-us/aspnet/mvc/overview/performance/profile-and-debug-your-aspnet-mvc-app-with-glimpse), [**dotnet-monitor**](https://github.com/anurse/dotnet-monitor)

And again, APM tools these days can track application activity also, with server monitoring and browser activity monitoring.

Thanks..:) 