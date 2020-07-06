---
layout: post
title: Performance requirements
date: "2014-12-16 07:46"
tags: [Performance-Testing]
permalink: /2014/12/16/performance-requirements/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
In the article we are going to see details about **Performance Requirements. What are those? How to deal with those?**

## What are Performance requirements?
Like all testing , we need requirement before performance testing activity. 

So, what is Performance Requirement, how does it look like? How to deal with it.

As we know performance testing is all about , timing & resources. So, Performance requirement will full of time and resource requirement related to application. That means basically related to the following questions.
- How many users?
- How fast?

And based on that we need to find out 
- What are the bottlenecks/problems?
- How can we solve?
- How to prevent those?

Before driving to deeper into requirements, please read about [**performance testing goals**](https://sarkershantonu.github.io/2014/12/15/performance-test-goals/).

As we know about [**performance test types**](https://sarkershantonu.github.io/2014/11/25/performance-test-types/), if we realize, we will get requirements based on Application and the infrastructure. And we need to have those related to time. Usually time are measured in Millisecond and size in bytes. So, based on that the performance requirements must be involve in following types..

## Application Requirements :

### Server Side :
- Number of user application can handle concurrently.
- Request/Transaction Processing maximum time
- Request/Transaction Required maximum Memory/CPU/Disk Space usages.
- Minimum Required Memory/Storage/Disk Space for running Supported number of users.
- Application (request/transaction) behavior in case of errors or extreme peak.

### Client Side:
- Request/Transaction Processing time. This involving , particular request time ,browser rendering time(for browser based application), or native app render time(if it is mobile application/desktop application) or even environment render(if it is running under custom environment/OS.
- Request/Transaction Required maximum Memory/CPU/Disk Space usages. Usually , it is based on where the application is running. There should be specification for the environment like for web app, which OS, which browser version on what settings under what conditions(Antivirus or any monitoring tools)
- Minimum Client environment specification and its verification.
- Application (request/transaction) behavior in errors or extreme peak.

And , we also need Application monitoring for all of those in server side and client side. This might involve with application monitoring and debugging tools as well as framework based tools and environment based tools(OS tools, browser tools, network tools)

And, before project, please define those monitoring requirements. It is also based on Goals. That means, if you are targeting for server update, so have spatial monitoring on server. 

I had a chance to work with some requirement for performance testing involving with monitoring activity. That means, those performance test are design to monitor not only application, including infrastructure. Those have specification for network / bandwidth consumptions, and resource consumptions in server and client.(PC/Tablet/Mobile). Example :

## Server Performance :
- Maximum CPU/Memory/Storage/Virtual Memory usages during certain scenario.
- Fault /Error recovery time(including reboot or initiation time)
- Resource Temperature monitoring during extreme conditions(full load, and going up)
- GC and Thread conditions in extreme peak.
- Max Log, size in case of App/DB Logs/Web server logs.

## Client Performance :
- Maximum CPU/Memory/Storage/Virtual Memory usages during certain scenario.
- For web application, browser behavior/time for Reponses.(Apps for mobile)
- Device Temperature monitoring during high data/complex operation (for Mobile/Tablet / device)
- GC and Thread conditions in extreme peak.
- Max client Log size and limit.
- For web app, network and application resource(file/requests) monitoring, spatially time and resource needed in client.
- As, now a days web Applications does a lot of processing in client side. So depend on architecture of the application, we need to trace those for client environment.

## Network Performance :
- Maximum/Minimum Bandwidth for application/transaction/request
- Behavior during extreme peak
- Fault or Error recovery time and behavior.
- As this is involves network devices, so tracing there behavior are used to be in specification.(like, we had a HUB, we needed to test what temperature during multiple request to server connected with this. Usually, this become complex when we send large data over network following lower network layers)

More over, depend on architecture, there should be performance requirements. For example, we had an asp.net application and we followed default view state and call back state policy , which become main issue for application slowness. We had to test default timing for a particular transaction, then we test that with different browser to verify we are going in right direction. And we also tested the resource and time needed in client for particular request. And then new version released after modification of the  view state implementation. And do full thing again to prove application performs well and takes less resources while running in client.

### Example : 
We had a small SOAP service.That takes an XML, and based on XML data, it process and returns XML. Client used to sell that service to other vendors for using. So, our requirements were like
- Max server processing time for particular XML type(we have different type) 750ms.
- Our server should server concurrent 120 requests and at least 2000 users in 1 hour block for particular XML type.
- Client should not get more than 1200ms time in response in any case(request and response time = network time+sever process time)
- Get the Max support of users by our server
- After Maximum users, when it is in extreme condition, server should not die and provide server busy message as XML return
- During High or Extreme Load Clients should not get any 4x or 5x messages

**Note** : As, our server need authentication tokens, we should not have any security issues during high or extreme load.

## Analysis & Reporting Requirements:
In real testing, there are some requirements related to analysis and reporting. Those are mainly performance goal based requirements. I think it is mandatory to have those goal based reporting requirements so, that we can find bugs during analysis phase.

Analysis should fully based on performance test goals. So that we can pinpoint the issue or bug or improvements and provide in well formatted reports for different type stakeholders. This is important because, performance testing is not easy to understand by any one. We need to format the results and issues for stakeholders, developers, other QA members, Business people, CTO/CEO/COO etc.

#### User Stories : 
In agile based projects, performance tester should come up with Performance Scenario. This is important because, it will make easy to understand by other members of the team. It is very easy to make, just follow standard user story making rules. Like, from my example, one story can be , a client(mobile/web) should be able to process certain type of XML in 1200ms when server is processing 80 other requests in 70% of resource loaded.

And, if you don’t have requirements, use my previous [**post**](https://sarkershantonu.github.io/2014/12/15/performance-test-goals/) to come up with performance requirements for your project.

So, in summary this shows the basic idea : 

![performance-requirements](/images/performance-testing/performance-requirements.jpg)

Download this from [Drive](https://drive.google.com/file/d/0Bzvlm2T8LMb1cHV0RHBEaDVHejA/view?usp=sharing) or [direct](/files/performance-testing/Performance-requirements.mup) : **open with mindmup**

Please comment bellow if you have more ideas.

Thanks … :)