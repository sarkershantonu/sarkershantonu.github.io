---
layout: post
title: Load Generator Performance Matrices 
date: "2015-08-26 02:54"
tags: [performance-testing]
permalink: /2015/08/26/performance-matrices-load-generators/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Java, JVM"
gh-badge: [star, follow]
comments: true
---
In this article, we are going to see popular performance metrics/graphs used in performance report for indicating performance of an application.

In [previous article](https://sarkershantonu.github.io/2015/07/22/performance-reporting-kpi/), we knew about KPI. KPI is summary of all metrics. So let's discuss about detail performance matrices.

### Performance Metrics Sources
As we know, while doing performance testing, we have several kinds of tools providing performance measurements. So, these are actually different source of performance metrics.
- Load Generating tool s (like load runner, jmeter, wapt, Gatling etc)
- Server/ Client monitoring tool : (like perfmon, perf, proc mon etc)
- Profiling tool : (Java profilers, Dotnet profilers, Debuggers, Tracers etc) 
- APM tools : (Dynatrace , Newrelic, AppDynamics etc) 

And added to that, manually we need to provide performance metrics based on performance or business goals.

To know more detail about performance goals, you may visit this posts
1. [Performance test goals](https://sarkershantonu.github.io/2014/12/15/performance-test-goals/) 
2. [What are Performance requirements?](https://sarkershantonu.github.io/2014/12/16/performance-requirements/)

In this first part, I will describe only the measurement that we used get from load generating tools. 

# Load Generators Graphs :
For performance testing, we may use **load runner** or **Jmeter** or any other tools. I am keeping this as generic.  

Load generators creates scenario (different type of user load/stress/soak/spike)externally. Externally means, how those requests are absorbed from client who use it. 

For example, if you are testing web server, we will consider traffic over specific protocol. If you are testing web service, it will client requesting to web service over protocol. 

Or, if you are testing Chat server , it will be requests(raw/text/xml) over protocol (UDP/web sockets/XMPP). 

So, all cases, this is kind of External activity on test system, and we can monitor/measure external behavior. 

So, for these kinds of tools, following metrics  can represent performance.

## Response time: 

This is actually a very key indicator of a test system. Response time refers to how the application is responsive to requests. Form any load generator tool we can get response time. And more often , it comes in different type
- Maximum response time 
- Minimum response time
- Average response
- Mean response time
- 90th percentile response time 
- 95th percentile response time 
- 99th percentile response time 

These are all statically representation of all request sent from tool. To know detail about each , you may google it.

#### Where to use this? 
- When we need to represent performance data to business users so that they can reach to customers regarding improvements.
- When we need to show performance to client/user.
- When we need investigation for response time distribution to Dev/technical team.

#### How to use with graph? 

- **Response time Vs time Graph** (X axis time, Y axis Response time ): This means, what was the response time for overall/particular steps when time grows.

For business , this means, over time, ```application is usable and performing as stable as beginning```. It is consistence behavior over time .

- **Response time Vs User/Thread Graph** (X axis User/Thread, Y axis Response time ): This means, how was the response time overall/particular steps when increment/decrements of User/Thread.

For business , this means, over time, ```application is usable and performing as stable as increase/ decrease of user```. It is consistence over usages.

#### Best practices: 
- To measure maximum delay, Max response time use
- To benchmark or understand server, 90th percentile response time use (95 & 99 are helper of 90th percentile , often shown beside that)
- To check SLA response time Avg. response time is used.

**Note** :
- Usually Response time is measured by millisecond. We might need to convert into second.
- For detail visibility, sometimes we need to provide Latency time separately.


## Throughput : 
Throughput refers to power of an individual system/server. So, it is the main indication of server/system performance. This is very important performance indicator for capacity planning or achieving target SLA. Throughput used is representing in two ways.

- **Hit per second (or min/hour)** : Hit per second(or any unit) refers to server power to serve request. This is basic unit count as hit. It is calculated like as total hit or request to server/(time taken to send the request).

- **Request /Transaction per second (or min/hour)** : Request per second (or any unit) refers to how many requests are served in server. Usually tools provide each request as each transaction. So, it is also called transaction per second. In all load testing tools, we can also group multiple request into single transaction and measure that transaction as unit (as a whole) to calculate this. In this way, we can represent a business transaction in single measurement. Example : For log in , we go to log in, insert credential and send log in request. By default all these three request will be considered as three transactions, but we can group all together and represent as single transaction.

Now a days, in load runner/jmeter , we can see Hit per second and throughput are measured in separate graph.

#### Where to use this? 
- It is mostly use for technical or support team to measure performance as capacity.
- Business users may use this only Business Transaction format(how much business transaction per second, example : how many debit/credit transaction may represent banking software strength.)
- This is must while server migration. This is the key indicator in benchmark.
- This is key indicator for scalability testing. Spatially, scale up & scale down tests.
- This is also used for testing load balancing & its distribution.

#### How to use with graph? 
- ***Throughput Hit/sec over time*** : (X axis time, Y axis Hit/sec) : This represent hit/sec over time growth. For unit, you can also use per min or hour. Usually SLAs are defined by hour.
- ***Throughput Transaction/sec over time*** : (X axis time, Y axis Tr/sec) this represents transaction/sec over time growth. Usually this is business transaction or logical transaction based on application requests. For business transaction , SLA definitions are measured per hour.
- ***Throughput Hit/sec over user/thread increment or decrements***: (X axis user/thread, Y axis Hit/sec)  this represents Hit/sec over user/thread grows. This represents scalability. More often, it is used to measure for server scale up & scale down capability checking.
- ***Throughput Transaction/sec over user/thread increment or decrements***: (X axis user/thread, Y axis Tr/sec) this represents Transaction/sec over user/thread grows (same as previous). This represents scalability. More often, it is used to measure for server scale up & scale down capability checking.
- ***Byte Throughput over time*** : (X axis time, Y axis Byte/sec) : This is simplified representation of Transaction/sec over time where transaction represented as byte(size of the transaction). This graph shows at a glance throughput of server in byte. This is very useful for both technical and Business users to understand Throughput in simple manner. 

#### Best practice: 
To understand quickly, these are widely used.
- HPS(hit/s) over time
- Tr/min over time (business transaction)
- Byte throughput over time.

## Error Percentage: 
This represents how much error occurred during tests. Usually for a web application following error can be occurred.
- **Http errors** : For a web application,  all http messages will be consider as error except accepted one. Example, http-200 is always considered as not error where http 500 will be considered as error. All tools like Jmeter support configurable http error checking where you can select your type as not error. Example : IP whitelisted sites used show 404 for forbidden, which refers , the site is up but it is not accessible. For this kind of activity, we need to exclude 404 as error while testing from blocked IP.
- **Assertion error** : Like as jmeter , all tools supports step verification. So, if step data/time verification fails, it will show error. This is application specific response assertion.
- **SLA/Response timeout error** : For most of request, when we apply SLA or response time out, when server failed to show on the condition, this error occurs.
- **Server Error/Exception** : Like as JSP or ASP server, application server may show application error or exception which will be consider as response error.
- **Protocol error**: Like as http protocol, all other protocols that we may use in script have its own error types. Tools will consider those as error all the time.

And, many more based on application implementation.

#### Where to use this? 
- It is mostly used for technical/Dev team to know the error rate.
- Error changing rate often used for application debugging for a certain part of a system.
- Type of error is mostly used to identify key bottleneck for large system.
- While validating SLA, error % indicates stability of the system. So, it is important where SLA verification is present.

#### How to use the graph? 
- ***All or Type of Error% Rate over time*** : (X axis Time, Y axis error%)  This represents over time grows, how many % of requests caused error. You can represent in plain error count(not percentage)
- ***All or Type of Error% Rate over user/thread increment or decrement***: (X axis user/thread, Y axis error%)  : This represents how many % of requests caused error on user/thread increment or decrement. You can represent in plain error count(not percentage)

#### Best Practice : 
Error% Rate over time is often using for representing application consistency.

**Note** : Sometimes this error percentage is also represented as Error only(count of error)

## Network Bandwidth:  
This is another vital performance indicator. Now a days , we used to have different network protocols and their bandwidth limitations. Infect, different network & proxy configuration can create different network environment.

This measurement indicates how much bandwidth application needs, and how application will perform on predefined bandwidth.

For network emulation , like as Jmeter, most of tools support your custom bandwidth which help you to create your application required real user scenario.

And, most of load generating tools provide measurement of bandwidth consumption. Usually the parameter name is

**Request bandwidth(KB/s)** : Shows how much data sent received for requesting particular request/transaction.

#### Where to use this? 
- Mostly used for viewing required bandwidth measurements
- Very useful for Cloud Environment application testing due to cost estimation
- When application migrates from one technology to another, more often it is used with benchmark, showing low resource consumption
- This is very important for applications which have major user base using verity of network environment. Like mobile usages, pager users, small handheld device users. For this kind of low resource users, this is used to a key performance indicator.
- When you application need to test in different network configuration and comparison  between them, then this measurement defines different standard. For example, if you are comparing application responses among 115kbps VS 10Mbps , this will show actual bandwidth consumption and real application behavior on response time.

#### How to use the graph? 
- ***Overall/Specific Request Bandwidth over time***: (X axis Time, Y axis Bandwidth KB/S) 
- ***Maximum Overall/Specific Request Bandwidth requirement***.(It is a bar chart, each bar for request, bar height is bandwidth) 
- ***Maximum response time over bandwidth***: (X axis Bandwidth, Y axis Response time): It will show how application behaves on different bandwidth. 

#### Best Practice :
- It is often ignore for Intranet sites
- It is a must for public facing websites.
- It is used for mobile apps or firmware client facing application.
- It is important if your application used in low bandwidth areas, like rural areas where bandwidth is very expensive as well as rear.
- It is very important for cloud hosted application to measuring the bandwidth requirement & costs.

Thanks :)   
