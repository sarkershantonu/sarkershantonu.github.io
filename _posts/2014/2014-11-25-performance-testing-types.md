---
layout: post
title: Performance Testing types
date: "2014-11-25 02:43"
tags: [performance-testing]
permalink: /2014/11/25/performance-test-types/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
**How many types of Performance tests we can do? why we test them?** 

In this article we are going discuses about performance test types from a technical prospective. In previous two articles i have explained about Load Testing and Stress Testing. And, there is another type, called capacity testing. I will not talk about those generic criteria of performance testing. These are based on my own activity on performance testing over web application.

Now a days, web applications are more scalable and robust. Not like as old time, the web architecture has been change. So, for performance testing of a full web application become more challenging as Performance testing is more related to system, how it works and what are the weak points.So, I would say Performance testing is mainly 2 types.
- Application Performance
- Infrastructure Performance

# A : Application Performance :
By the name Application Performance, it is easily understandable what I am referring. Its the core performance of the application. Mainly measuring
- How the functionality works, what are timings
- How much resource(CPU/RAM/DiskSpace/NetSpeed) they consume
- What are the bottlenecks & Complexity?
- Is there any Resource/Process Dependency delays?(like, 3rd party service, component, critical resources)

And, How we expect those behavior. This comes from user feed back or performance requirements. However, Application performance testing is two types.
- Client side Performance
- Server side performance.

### Client side Application Performance: 
This refers to performance in client side. That means performance of client activity. Now a days web applications are more client centric. They use more client resources. Spatially when you are considering single page application or HTML5 application or Angular.js applications, or even Ajax toolkit application, all of them do client side functionality. They talk to server very often and get data preloaded or in delay time. They try to make application more smarter and that makes more complex the situation. That means, if your client is doing or processing before sending requests to your server , if there is some issues, it wont go to server. And, user will get performance problem though servers remain Idle. **Client side performance** testing refers to the testing of client side executing codes based on
- Ajax performance
- Java Script performance(Used JS or Different JS Frameworks)
- Application framework Performance (Asp.Net/PHP/Ruby/Python or any language that you used with)

Now, question is How to test that? Primarily, its very resource hungry and has dependency with browsers/client that you use. For browser, I have used selenium with firefox/chrome/IE/phantomJS for running those test. (like fully single pc based application execution, so you need more PCs for more user activity). Now a days, business owners and stakeholders or even users are more concern about this. Spatially on **how the application behaves during high peak**. How much it takes for a transaction( Transaction is a set of unit request for particular business goal). There are some key points for client side performance testing
- Its all about client side function execution ,rendering, calls. So, usually, load and stress conditions are not applied like server side performance.
- Single user based test scripts are usually made to determine time of every transaction.
- That single user activity is monitored on different situation of load.


##### Example : 
Let's say, your bank is transferring money , your server is idle, so how much time it takes for a transaction requested from client. In this condition, server response time will be deducted from full transaction(as it is server issue). We will do the same thing when there are average load, let’s say 1000 transactions, Or high load (say 10000 transaction) or even Over loaded condition(25000 transaction). We need to measure this incrementally because, client side code often based on server side response resource(like next javaScript /Ajax loading). For different condition, we might have different server response time but , the particular functionality/process involving local javaScript/ajax/Application should take the same time(because we are overlooking server response time).

Because of different type of timings to measure and keeping math simple, most of the time we need to measure user experience time manually in reports.(jMeter has selenium/browser integration, so it will easy to get this values with built-in functions)

### Server Side Application Performance : 
It’s the most common in the performance world. Usually , all performance test tools refers to server side performance testing. Basically we need to test application performance in server. That means
- Request send and receive Time (that will contain request processing time in server)
- Request resource(CPU/RAM/Disk Space/Network) needed in server
- Bottlenecks or dependencies in the server from you application.

So, we need to test server for
1. Regular Load user hits
2. High Load user hits
3. Extreme/Over load user hits(to see, how it acts on fail, fail recover, fail safe, application and data integrity) 

And, we perform Load Testing, Stress Testing and Capacity testing(I hope I do not need to explain those).

# B : Infrastructure Performance :
By the name we can guess that it says. Infrastructure Performance refers to physical and logical Infrastructure consumption and performances caused by our application. That means, the affect because of the application on the physical or logical resource. Like, if we need to deploy our application in IIS, what resource are needed. What will happen in different load conditions and complex scenarios or even high volume of data transfer. How much bandwidth application takes for sending /receiving requests. Or, what should be minimum condition of client resource.
It is more related to monitoring and monitoring based stress and load. It’s the load & stress condition performance of the infrastructure.
In my opinion, there are three types.
- Server Performance
- Network Performance
- Client Performance

### Server Performance : 
It is server’s core performance while running and serving the application. The CPU/Memory/Disk Space usages.  We need to find what happened when different type of request provide to server. What are different dependencies and what are the bottlenecks. Even these can related to hardware failure or software failure. For server performance testing, we need to use different type monitoring tools. Some are Server monitoring tools, some are application monitoring tools.(like dynatrace, perfmon, java or Dotnet base application have monitoring tools built-into frameworks, we may need to develop our own tools for monitoring)

### Network Performance : 
It’s network core performance when our application is running in server. That means,
- Network Latency time(like more router, more address translate, more time need)
- Request send and receive time
- Network Dependency time (like waiting for another network for some process or authentication)
- Network Speed
- Network Packet Size & Performance
- Network Protocol dependency.

Basically all the stuffs related to network infrastructure.

### Client Performance : 
Like as server, it is related to client device resource monitoring while application is running. In past days, application uses less client resource and do most of stuffs in servers. But, these days due to cheap hardware, applications are using more client resources for data processing. Application like WPF browser application or JavaScript based client side application. Those are more resource hungry in client side. So, we need to define client configuration requirement for our application. And how they behave in different condition. 

And, now a days, (for web application) we have different type browsers/clients. And, they have their own resource usages(like chrome, takes a lot of resources in background, so as others). (example : I have worked with browser based ERP type application, which uses dotnet components and there was lots of parameters and pre-conditions for client hardware, like minimum pc configuration, windows version, browser version, network speed, monitor resolution, minimum GFX ). In this criteria we need to monitor client (**CPU/RAM/DISK/GFX**) in different stress conditions like
- High volume of request data 
- Complex UI rendering and processing(for games, frame rates, triple buffering, anti-strophic filtering, vertical synchronization,
- Multiple Event firing(how application and client handle those concurrent events)
- Complex Business Request processing(like long javaScript call, DB procedure request sending, or serializing objects)
- Big size cookie or data processing while in memory.
- If its client gaming, then complex render scenarios. 
- If its streaming, streaming quality, quantity, rendering. 

Spatially when we are running client side application performance testing, We have to remind that as it is related to client, so these following may have affect on client for using with application.
- Plug-ins that we are using in the application(flex, silver light, flash, rich text editors etc)
- Client side compress methods(client need to compress/decompress and use Send/receive server data)
- Client Rendering hardware(now a days, network gaming over browser based games are popular and those games uses local GFX processing power for tendering)
- Client side Security measures(like client side authentication validator, or spam protector)
- Full Screen conditions and associate with existing other apps.

So, In summary Types

![image-perf-type](/images/performance-testing/performance-testing-types.jpg)

Link to [Drive](https://drive.google.com/file/d/0Bzvlm2T8LMb1MGlLUnR3Vl9vUVU/view) (Use Mind Mup) or [download](/files/performance-testing/Performance-Testing-type.mup)

### Notes: 
Modern applications (web or Hybrid) are smarter now a days. They behave depend on load to server. Like, if the server is in extreme condition, it wont show all pages or don't do regular functionality . Some are showing server busy message to users(like twitter). So, it totally depend on application smartness how its handles extreme conditions. In those extreme conditions most of the time time caused by DBs. And people says, its data base issues, but in my opinion, your application should be smart enough to handle all kind of issues. There may be an issue in any sector, why it will be expose. That is why, I some time do security testing like injection/XSS/CSRF in load condition to see data or application integrity in extreme condition. If you application can not handle extreme cases , how it can be scalable. And, that is why Smart applications these days have
- Risk Planning
- Application Behavior handing in all possible scenarios.
- Data integrity and security policy and precautions.
- Application fail safe measurement. (that is why we do capacity testing)
- Server fail safe precautions.
- Simple & Smart UI design
- Small server Requests & responses
- Zipped/compressed data communications
- Load Balancers for database and application
- Distributed architecture
- Application and Server monitoring & Debugging facility. Some framework provide web interface also. 

These are some initial thoughts, please feel free to share your's.

Thanks…:)