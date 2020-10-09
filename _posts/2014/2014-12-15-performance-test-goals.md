---
layout: post
title: Why we need Performance Testing? 
date: "2014-12-15 05:40"
tags: [performance-testing]
permalink: /2014/12/15/performance-test-goals/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see 
- Why do we do Performance Tests? 
- What are the main Performance test goals?

It is really depressing that very less performance test project started with goals. (as far as I have seen). It is defined when it is gradually moving foreword. Commonly, it is necessary to have goals to save time. As we, see we have a lot of parameters to take care about for performance testing(I will make separate post on this) we should have goals. So, 

### What are Performance Testing goals? 
Performance goal refers to what exactly we want to accomplish from performance testing activity. Like what we want to measure/see. This measurement has different prospective. Let me come up with real examples : (better to understand)
Usually different performance test goals comes from different type of group of people from team. like 

#### Business Goals : (Business people are involved)
- We want a jump up a revenue , so what we can do to improve our performance?(which is major customer complains)
- We have a upcoming sales event/cycle. How many target clients we can drive for? What point should we not exceed?
- We might have a good reputation mentioned by Important people over Media on a particular date. What areas we need to take initiative to scale up the application?
- Specifically for online shopping application, if there is Black Friday or Cyber Monday event coming,  what areas they need to take care about to keep their sites up and running for selling.
- Similar things for ticket booking application in holiday season and any major event (like concert, sports).
- Marketing might need to know the application tolerance for how much offer they can provide to customer, when they can.
- How much budget we need to scale our application for certain number of users? 
- How quick we back on business(function) if we crashed?
 
 
#### Technical Goals :(DEVs & QAs)
- How fast is our application? How much data we are using?
- We want performance testing for measure our application resource consumption and timings.
- We are getting lots of user/QA feed back on certain functionality/transaction. So, we need performance test on those to debug bottlenecks. 
- How good is our Application Recovery process?
- We want to have performance review to see how our application behaves when we have a major request processing?
- How much our application is scalable?Where are failing?
- We are migrating / changing our application architecture, we want to know the benchmarks.
- We are applying new language/framework/platform to make application faster. Are we really faster then previous?
- We are providing continuous delivery every week So, in case of performance , where are we? Are we upgrading or going down?
- In Scrum, Lets have a performance cycle. So before that, lets have a performance test. 
 
 
#### Usability Goals :(QAs, BAs, UXs)
- How many user we are supporting with usual behavior? 
- What are the behavior when we are in high or extreme load.
- We want to see how our customers feeling while application is using?
- What are the critical issues that may occur in peak point?
- What are prevention plans need to be taken when user face such bottlenecks? (Risk Planning)
- How good is our Application handles error conditions on high load?How is recovery?
 
 
#### Operational Goals :(Network Admin, Security Admin, DevOps)
- Does our infrastructure supports the scalability which is provide by our application?
- We want performance testing for measure our application resource consumption and timings on operation/admin prospective.
- We are transferring our whole physical resource system (DB/APP server change or move to cloud) , so what is the bench mark, are we really improving?
- We are trying to add more resources in the system, so does our application supports performance improvements when we add more resources, or its just waste of money?
- What is happening maliciously by the application over our resources while running?(i faced that practically over DB logs which becomes so big while app is running that it overflows C drive and application crashes)
- What should be the recovery plans? What areas to take care about? 
 
These are some primary thoughts that I have worked with.  If you think there are more, please feel free to comment. I will add with your name
 
Thanks ..:)
 
 