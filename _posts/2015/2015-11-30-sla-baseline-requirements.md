---
layout: post
title: Performance SLA or Baseline requirements
date: "2015-11-30 06:50"
tags: [Performance-Testing]
permalink: /2015/11/30/sla-baseline-requirements/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance Testing SLA"
gh-badge: [star, follow]
comments: true
---
In this article we are going to see how we can formulate or introduce performance requirement in the team where is no requirement in place. Mainly we will see how to introduce Performance SLA or Baseline to create awareness.

To know more about performance requirements please read [**this post**](https://sarkershantonu.github.io/2014/12/16/performance-requirements/). 

## SLA : (Service Level Agreement):
I am not going details with definition, but in short,  SLA is the agreement at the end point of a **service/solution/software**, in our case a product. We will see details of different SLA with a web app example.

SLA can be also be described as

### Baseline : 
For comparing , when we select a value as Ideal/standard or basis of all comparison, it is called based line. You can google for more detail info, but this is just simple to understand. All baseline values has preconditions details as standard.

Form [**previous post**](https://sarkershantonu.github.io/2014/12/16/performance-requirements/) , we know , performance is all about how fast and how many users.

So, Let's assume we have an web application like below architecture(2 tire architecture) .
- User interact with browser with web server.
- Web server has app server that talks to Database
- Database is shared with multiple downstream systems & publishers.(full back end) 

![basic-web-app](/images/performance-testing/sla/basic-web-app.jpg)

Both SLA & Baseline can be represented as response time and/or throughput. I will give example for SLA of response time only which can be easily reused as baseline where is no SLA in place.

So, let's divide this into modules
- Browser
- Web UI
- Database
- Back-end systems( Downstream & publisher)

So, if we have simple SLA for response time only, it will at least ensure ,
1. Exactly what we are delivering or expecting from the application. 
2. What worst can perform no matter how badly we develop. 

if divide SLA for all of those items, we will get something like this.

![app-arc](/images/performance-testing/sla/app-arc.jpg)
 
In each type of SLA, we need the worst case scenario in place. Like , Maximum time required for the purpose/event/functions. 

## End User SLA : 
It is the user time for each interaction which involves
- Action (clicks, type, drag, right click, select etc) 
- Responses time associated to that particular action
- Complete Rendering all responses in the Browser to see full results of that action. 

**Example**: Lets consider LinkedIn a page. When an user go to www.linkedin.com , browser send GET URl requests. And, the requests goes to webserver and responded with page & resources which are rendered and showed to user. And, now user put user name & password & press sign in, he get logged in and see his home page. In here, we can see an user have different actions and responses from web server.

So, Application SLA will have this response time specified. What should for click log in, what should URL enter & get all item loaded(page load) , what should be typing to text box(user name & password) . 

These are mainly full page allowed events that an user can do. If page is divided into multiple small page items, it also applies for individual small item.

### How to measure ? 
1. We can always measure by stopwatch manually. (which may be last thing you should follow as it involves human errors) 
2. Browser build in developer tools
3. There are some browser plugins (performance analyzer) to measure this time inside browser
4. Proxy Tools like fiddler.
5. Browser based automation(Selenium or any other tools)
6. Jmeter/Load runner driven client performance testing. (see details in Jmeter page)

## Application SLA :
Application SLA refers to request serving time up to client end, in our example Browser. All page and events are served by application to user need time to process.The difference of client SLA & Application SLA is, Application SLA involves only requests processing time up to client. So, no client activity involved here.

For **example**, rendering, client side validation. So, this involved only with
- Time to process a request from user (request processing, for our example, http requests)
- Time to response to user after data processing(for our example, Preparing responses and send to client)

For **example** : If our web application page has a html response and has resources, the time to get the requests and responses of particular GET request and send them to client will be the time of application SLA. But, if client browser need to render those or process those , that time of processing is not part of Application SLA.

Another **example**, let's assume a Game as web application which get/send all data from server via webservice but in browser it does JavaScript based game play. So, webservice response/requests will be count as Application SLA where as full game play user experience will be count as End user SLA.

### How to measure?  
Usually we can follow all process described end use SLA, and deduct the rendering time (as well as client activity time) . 

And we can use also load testing tools to measure request and response time, like Jmeter, load runner etc.

## DB SLA :
This is contract between Database and Application. If we consider the application connected to DB, for all  UI calls DB server requests (via procedure/sql queries etc). 

So, each request processing will take time to do. It should have maximum time to response to application request no matter how many parameters send for processing the request(those also should be specified) .

So, the request processing time inside DB to the application UI is defined as DB SLA.

It can be response time as well as throughput. In this context, through put is more useful for the team. They will increase the throughput capacity when the response time is below SLA.

### How to measure? 
1. The easy way is, Unit test/timer for individual DB calls inside application code.
2. DB queries for monitoring
3. Load test tools directly requesting to DB with set of queries , exactly the same way application send request to DB.
4. Tools like Toad, PL SQL or any other monitoring tool can get these timing from DB

### Other system SLAs : 
As we have mentioned , DB can be connected to back end systems, or downstream systems, each tire should be specified with SLA. Each handshaking should have timing on there own so that we can define intra-component request process timing & throughput as SLA. 

##### Notes :
- We should consider Latency time to calculate SLA for each application tire. 
- If you have network SLA time specification, isolate that with latency time.
- For network timing, try to be rational and measure full network time distribution. 
- For detail time distribution, [**see this**](https://developer.chrome.com/devtools/docs/network#resource-network-timing)
- When defining SLA/baseline , try to avoid ambiguity. Be specific on the measurement values.
- Try to define worst case scenario. if you need, you may gave average case scenario.


### How to define SLA 
**How to define SLA at Requirement Phase? Or in initial phage on an Agile development Team?** 

Usually BAs don't know more about technical details spatially when the project is in requirement analysis phase or initial phase in agile. 

So, how can they know about the system? 

This is very crucial and important. Most of the projects I have seen in my career with performance problems happens due to Performance Requirements are not in place. If we can define application performance standard from the beginning, that can be more effective. So, let's introduce Business Level SLA like following. 

### Business SLA : What is it? 
When the SLA is defined according to business transactions for an application, that timing is referred to as Business SLA. So, business SLA is not related to product initially. It is related to business. And every work/functionality that will be perform by application from business perspective will be defined as business transaction.

Usually Business level SLA is measured by Time only, and later on specified with system throughput.

#### Example : 
Let consider linkedin.com. When we do log in (as we gave example in end user SLA), then the only one business transaction will be happening, that is LOGIN. So, before being linkedin was developed, if business SLA was defined for 2sec on Login , then full team can easily define what time should be taken for rendering load page, send login request processing etc.

So, a Business Transaction is the set or group of interrelated performed user actions and expected responses. And, the Business SLA time is the total time to perform the full transaction.

#### Benefits of business SLA :
1. No need full application details to define Performance Requirements in beginning of a project.
2. Usually Business won't care about mini steps, they will care about whole transaction/ function which they put as requirements. 
3. You can measure real cost of the application from the beginning.
4. You can get client/user/stakeholder to have realistic view on application performance before application started
5. You can define Business and revenue goal based on performance requirements.
6. If you are developing application with 3rd party resource providers, you can define this standards to get better control over application functionality and performance.
7. A particular transaction or business function flow/steps may change on longer term but business SLA remain same which ensures requirement validation though changes occurs.
8. And if we can put this SLA with task from beginning or requirement phase, the whole team will be aware. And this awareness might save from your business risk. 

#### Personal Opinion :  
As business personal, think of **Time** as **cost*, how many the business functionality that you involve in the product, define time and aware the team for the time as cost for each functionality. 

![sla](/images/performance-testing/sla/business-sla.jpg)

So, when we are gathering requirements and have SLA for each business transaction or new functional requirements, developers or QAs can breakdown the business SLA into end user SLA values and before each release, it is easily measurable that they are following requirements or not.

## Summary : 
- Business SLA is set of End user SLAs
- End User SLA is the total time of Application SLA & Client side activity.
- Application SLA is the total time of request processing of end user requests , DB SLA & all back end system SLAs
- DB SLA is the dependent system's request processing time (application request or back end system SLA)
- Back end System SLA is the time to process request send to the system from caller systems. 

##### Note : 
This example is with typical web application, for webservice, mobile apps or even enterprise solutions , you can follow this breakdown technique to have better clarity on SLAs.

Thanks.. :)