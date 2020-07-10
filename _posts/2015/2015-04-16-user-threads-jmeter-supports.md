---
layout: post
title: Jmeter User/Thread Support
date: "2015-04-16 19:54"
tags: [Jmeter]
permalink: /2015/04/16/user-threads-jmeter-supports/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter Advance"
gh-badge: [star, follow]
comments: true
---
In this article we are going to learn how to calculate **number of users a single jmeter** instance can support?

This is very important as, after creating scenario and test cases, we need to run using Jmeter. Before going deeper into the conversation, we need to consider following facts , assumptions and steps to know the number.

### Operating System
x86 operating system and x86 both has memory expansion limitation upto 4gb where 3.2gb(+/-), so to have optimal output from Jmeter, you need to use x64 for both Operating system and Java edition.

### Java Memory Optimization
Jmeter is Java tool. It run with JVM. To obtain maximum capability, we need to provide maximum resources to Jmeter during execution. In jmeter, bin directory, we get jmeter.bat/sh. Open this file with text editor.(windows - .bat, Linux- .sh). First, we need to increase heap size
**HEAP=-Xms1024m -Xmx8192m**

It means, heap size minimum 1GB, maximum up to 8GB. I ran this to my 16GB PC. Configure following you own PC configuration.

Keep in mind, OS also need some amount of memory, so don't allocate all of you physical RAM.

Then, add memory allocation rate . **NEW=-XX:NewSize=128m -XX:MaxNewSize=512m**

This means, memory will be increased in this rate. You should be careful, because, if your load generation is very high at the beginning, this might need to increase. I used to run gradually load, so, max new size 512MB is okay. But , if you are testing for large application with many threads , you need this new size to be bigger.

Keep in mind, the bigger size will fragment you heap space inside JVM, so, GC need to work harder to clean up.

### How Jmeter executes? 
- During test execution, Jmeter will manage data all over RAM. And, use virtual storage as buffer. So, All of you user threads will be in memory which are running concurrently. In summery, estimate your concurrent number user/thread (active threads) in load scenario. Those will be in memory.

- Jmeter is Java GUI application. It also has non GUI edition which is very resource intensive(CPU/RAM). If we run Jmeter in non GUI mode , it will consume less resource and we can run more thread.

- As, JVM manages application with some Demon thread inside JVM, we need to consider some resources for those items. Those are kind of managers of application as part of JVM. So, technically, Jmeter cannot get full memory that we allocated as heap space , a significant amount of memory can be deducted in JRE. It is not exact, usually, I deduct 1GB or more during large request execution.

So, after following all of those lets measure. Initial steps will be.

#### Step 1:  
Calculate total size of the requests inside test cases. (use View Results in Table Listener). Usually, total time of single user is ignored due to JVM GC collection time cannot be measured, so , we are assuming no GC will be necessary for execution.

#### Step 2: 
Consider the Network speed. Measure how much bandwidth you need to run 1 user with total request. Your PC resource may support all of those users, but, those requests might not get bandwidth to execute. (use View Results in Table Listener). We just need to validate the maximum bandwidth of PC/test environment should be higher than total concurrent users(target)

#### Step 3: 
**The total number of concurrent user = (total allocable memory)/(Size of the all requests)**

#### Example : 
Let's assume we have Amazon C4.xLarge instance (Ubuntu server+Java8x64+4vCpu+7.5Gb+750MBps), and our test case has 5 http request total consumes 4.5MB data for a single user/thread.

So, if we set Jmeter up to 6GB(Xmx6144m). Then we should be able to run scenario where the concurrent user count = (6144-1024)/4.5 = 1137.7 , consider as 1100 concurrent user.

Note : This is very typical calculation assuming best possible scenarios like
- No Listeners are included in Jmeter script
- No monitoring inside running jmeter servers
- No network overhead/barriers.
- Jmeter scripts are optimized.
- JVM demon process are allocated with 1GB Ram, if you run less number of concurrent users with lighter requests, it might be less than 1GB.

This is from my test execution experience, please comment yours.
Thanks..:)..
