---
layout: post
title: Performance Test approaches
date: "2015-03-20 08:06"
tags: [performance-testing]
permalink: /2015/03/20/performance-test-approaches/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see some true facts regarding Performance testing approaches, spatially **what to do, When to do, what to start with** 

This post is fully based on my personal experiences, other people may find different opinion. I would request my blog readers to have comment and write you opinion as well as what you find about same topic from your experiences. 

Performance test, is a kind of test which measures **how well** application is performing rather than **what is** performing.

### Performance Testing In Agile
Usually people from non agile environment think. Performance testing all about timing , so it should be done at the end. Some says, some says not. But the fact is, performance testing is usually based on 3 key aspects
- **How much time?**
- **How much size?**
- **How many users?**

And, sometimes  **can it scale?**

# Test approaches

### Proactive approach
In Proactive approach, it is more about basic engineering things. Like, Prevention is Better then cure. That means, having pre planned for performance , set best practices to achieve that, getting measurement to ensure that. 

This involves **profiling, performance measurement, unit testing for timing, best practices for optimized codes, choosing fusible architecture** to build the system from the beginning of software development. 

It might also involve in **infrastructure monitoring** from the beginning, be it application servers, network or Database.

### Re-active approach.
For reactive approach, It is about, **lets see how it performs**. And, may be generating bugs/issues. 

Those might leads to **Re-develop** the whole application which often very expensive in sense of time and money. 

So, if you think, you are an external person, involve in performance testing, some of you bugs might leads to rewrite the whole application and because of fusibility, those might be often ignored or brutally rejected by over confident developers. Even though , you did a great job.

## Proactive approach Steps
Proactive performance testing is the best, but, due big budget involve, this might be little impractical for startup companies. 

But, for performance prospective, if you are concern about performance seriously, you should start performance testing activities from the scratch of development process.

##### Step 1 : 
Gather Performance requirement from business goals and construct SLA(if Business unit don't provide you). 

SLA is very simple, and if you don’t follow SLA templates, at least have some minimum un cleared performance requirement for each use case or user stories(for agile world). like, what if the application is crashed, what should be minimum time to log in. 

Try to get all **What if** scenarios from requirement to get clear focus on performance goal and requirements.

##### Step 2 : 
Start with reviewing architecture document. And often , software architecture comes with proof of concept projects. 

Which leads to testing the prototype application to meet up the requirements. Provide feedback to architect/Dev team based on your testing activities. 

May be you should involve them. Have some profiling results to know Memory & CPU foot prints. Analyze them with the context and justify the architecture.

**Example** : For a small internal banking application, data driven dynamic architecture might fit but for large scale financial transaction involved application , it will not suit or even micro kernel architecture might feel irrelevant.

##### Step 3: 
From , step 1 activities, list all possible timing and sizing based on step 2 activities. Construct  clear performance requirements. 

Construct your **load/stress/spike** scenarios. 

Even, plan for including some of these in application's test regressions suite/pack.

##### Step 4. 
Define best practices for coding that match with requirements that you have done. 

You might need to have research over technologies that you use, but it worth knowing this. You can do that with help of developers. This is necessary because , programming is really a problem solving. 

**A problem can be solve in thousand ways, but on particular need and context a few are applicable**. To define the best fit for you project, set some best practices.

You might add some code review/Matrix values, like Unit testis coverage delta, or code complexity, or code execution time.

##### Step 5: 
Choose your tool that suits your development culture. 

Now a days, there are lots of tools for different performance aspects. 

**Example**,  for a browser based application , you can choose Jmeter/Load runner for testing, and fiddler/selenium for client behavior observation , profiler for memory and cpu consumptions in server and finally tools to monitor the entire system. These days, all application comes with debug tools(like Glimps for ASP.Net). You can use that from beginning to have quick feedback.

##### Step 6. 
Prepare test case which is adoptable to change behavior of application. 

I saw lots of performance test scripts written in such poor way that, changing test code need more time implementing functionality. 

This is not right. Organize you test script in such way , so that it can be parameterize and adoptable based on functionality changes. I know this is challenging , but if you are choosing application architecture wisely and have good separation of concern , it is very easy to adopt. Some time you see, performance requirements also changes, so **if you don’t make it adoptable, it will not be a good maintainable state**.

And, necessarily, based on requirements, add some result analysis scripts to get quick feedback after each execution.

##### Step 7. 
Run the test after each dev release. 

Now a days , development has adopted agile principle and versioning. Don't wait for QA release and then perform test, it will take long time to have impact. Start doing test in each dev release. 

Usually, in Kanban, each ticket will lead to a release. Do a test after each ticket is done before going to QA/release cycle.

##### Step 8. 
As, testing in dev build is very short time, you need quick analysis as feedback to developer. 

Integrate debugging tool feedback , profiler results with test results, so that problems are quick to find. (Easy root-cause analysis).

Your team, may or may not add this activity inside regression or CI server but it is nice to have those.
BTW, this approach may not work for op shore team as it is very close to development activities.

## Proactive approach Steps
This works for both onshore and offshore teams. This just like as **black-box** way of performance testing. 

That means, after any public release version of application, you need to test. You do not need to care about what process dev team use or how they implement. 

And, as this is external activities, most tests are very related to UI model of application. So, things are very straight foreword.

##### Step 1 : 
Gather requirement from Business team. Usually this is very hard in this way because product is in production and they might not planned initially. So, get this very specific based on UI references.

##### Step 2 : 
Choose tools that fit with the application. Follow ideas for proactive step 6. I know this is very difficult to make adoptive test case, but you need to follow as much as you can. Some time you may face, code is not working for different releases.

##### Step 3. 
Run test & Analysis them for a particular release version of application.

**Note** : you might follow some steps from proactive approach if necessary but usually this external testing does not need to do those.

Thank..:)