---
layout: post
title: Writing VUser or Performance Test Script
date: "2015-01-31 08:06"
tags: [performance-testing]
permalink: /2015/01/31/vuser-performance-test-script/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how to write performance test case which is know as VUser script. We will try to learn generic way so that we can apply to **Jmeter, Loadrunner, WAPT** or any other tools in the market. 

- The steps might change in order but the idea behind all are almost same for every tools.
- We will discuses about performance test script for server side performance. So, there will be no reference for client side performance testing.

## What is VUser ?
VUser means virtual user . A real user behavior will be simulated by virtual user for performance test.

## What is VUser Script?
When we write real user behavior or activity simulation through a virtual user, then it is referred as VUser script. This name came from Loadrunner world. In Jmeter, it is called Test Plan. In generic, we can say Performance Test Script.

Thought VUser is not not real user, but, it should reflect real user scenario. In Jmeter we use different component to create a series of requests (may connected to each other or not) which are executed serially one after another. In Loadrunner, we write code in C using Loadrunner function. We might record those steps, but make sure that the script performs the activity of a scenario which we target for.

### How it works?
Vuser scripts simulate the functionality on the target application from a non GUI(with background process model). This is because GUIs are heavy as well as not possible to run with multiple(thousands) instances in running environment(like running 100s browsers with separate session of same application or generating 10000 chat client connected to server via chat GUI). 

So, Vuser script use a system (provide by respective test tool) to simulate target number of users. Some time this system can be build on multiple PC/Server, specific network setting, various Infrastructure configurations.

#### Example : 
Loadrunner has vugen for writing scripts and controller(combining with multiple pc) to run and they have a analyzer for showing test results in smart way. 

Jmeter has everything build in, you can use jmeter for writing script, again configure with multiple PC running jmeter as slave(remote execution model) to simulate load and after running you can use jmeter to see and analysis the results with different Graphs(Listeners)

This part actually fully depend on tool. See some of my blog posts on Jmeter. 

#### How to write VUser or Performance Test Script?
This part is totally tool specific, but I will try to keep it more generic from multiple tool using experiences.

##### Step 1 : 
Write manual steps of the test following performance goal, requirement and with test data.

##### Step 2 : 
Have a plan for test data initiation and cleanup

##### Step 3 : 
Record the full test plan with your tool and verify every step with another tool. If you application use multiple protocol, record in multiple time or multiple tools. Be careful with request you are working with. 

**Example**: if you are recording web request, verify recording steps with proxy like [**fiddler**](http://www.telerik.com/fiddler) with plugins or [**wireshark**](https://www.wireshark.org/download.html) or [**charlesproxy**](http://www.charlesproxy.com/) or [**blazemeter chrome plugins**](https://chrome.google.com/webstore/detail/blazemeter-the-continuous/mbopgmdnpcbohhpnfglgohlbhfongabi?hl=en)

##### Step 4 : 
Record script twice with exact same step and exact same data

##### Step 5 : 
Compare those two steps and get the differences.

##### Step 6 : 
Analysis those differences and get dynamic parameters.

##### Step 7 : 
Again, Record and compare with previous recording with
- Different credential to know more dynamic parameter based on credential
- Different test data to see dynamic parameter based on data.
- Different PC/Browser/network environment(will change the client and change the dynamic parameter)
- Different Version/release of the application (effective on web, example : our current application changes some parameter based on released version)

##### Step 8 : Analysis
Analysis the data coming and going from client and server. This is the main area of learning the system with RAW request from a transport level. This is definitely hard but, tools are there to help you understanding they system.

I should say, Jmeter is better to view each item clearly, compare to Loadrunner but, Loadrunner has advantages over co relation data(next step). These are some points that are follow for analysis for a web application

- From request, what are the changing sectors for your protocol.( For http , data changes in URL, Header , Body)

- For a specific part of your request, what are the changing items.  Usually, you see parameter and value. Focus on is value changes. How it changes, and why it changes.

And, for dynamic elements, you might face, the parameters are also changing. Get to know, why changing, how changing?

- So, after getting over all knowledge on changing parameter and value, you need to make a list of parameter and data that you need to generate to simulate the request. You need divide them like this
    - What are the items I am getting from my test data. (so, you have use static parameter)
    - Which are coming from previous request(so, you have to co relate them)
    - Which are based on environment (like web, we see ajax post fix keep IE for Internet explorer recording , FF for firefox)

If there are some request which are not from there, so we have generate these data applying same logic which is run by our client. Be prepare to make code or get help from development team to write that.(We use JavaScript in Jmeter which runs on via Mozila Rhino)
Before writing, I suggest you to do some research on those not found data based on..
- why we are using?
- Is it avoidable(i remember to send some CSS values . we avid but tests were ok).Re-run and check.
- What are the items inside the data? Simple value or encoded –> encrypted sterilized object. Make those in plain format and try to grab the logic behind that.

##### Step 9 : 
Based on analysis create **static parameters and co-relate dynamic parameters** which are changing based on
    - Test Steps
    - Test Data
    - Application version/release/environment
    - Client Environment where test will be executed(for web, browser agent, browser version, OS version etc)
    - Credential
    - Session/Date & Time /Cookie
    - SSO(if you are using) or any security system
    
##### Step 10 : 
Apply those manual algorithm inside script to complete script.

##### Step 11 : 
Apply data initiation and clean up script either in script or by external process.

##### Step 12 : 
Verify the script by replay with logs as well as debugging. (if tool supports)

##### Step 13 : (optional)
Arrange more than one created script for a single business required scenario to complete the full scenario. (like in jmeter, if you have 5 log in test cases, arrange them in separate test fragment and make a single scenario thread and use under that). Or, in Loadrunner , organize the Run settings.

##### Step 14 :
Add minimum reporting elements and you are ready.

Thanks..:)