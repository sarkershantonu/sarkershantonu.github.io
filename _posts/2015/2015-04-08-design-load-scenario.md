---
layout: post
title: Designing Load Scenarios
date: "2015-04-08 14:21"
tags: [Performance-Testing]
permalink: /2015/04/08/design-load-scenario/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
In this article we are going learn about **Load Profile** for performance testing on an Application. That means **how to identify and design** load test scenario for performance testing based on requirement. 

I am adding my experiences, feel free to comment your experiences too.

Before starting this article, I would recommend you to have clear idea on [Performance Goal](https://sarkershantonu.github.io/2014/12/15/performance-test-goals/), [Performance Requirement](https://sarkershantonu.github.io/2014/12/16/performance-requirements/). 

### Steps 1 : Understand your App and Users:
Get to know your product in more details from business requirements or any available requirement document (SRS,BRS etc). We need to know mainly
- High load (Peak users, This is stress condition, application should perform with expected behavior in this situation)
- Average load(This is Base line standards, application should pass minimum this standard.)
- maximum user application support. (spike users, application should be able tolerate sudden user increments, may be with certain specific behaviors like spatial message, wait screen user notification/feedback but it should not be broken)

### Step 2. Understand Business Goals:
Try to find out why those requirements(from step 1) are there. What are the business justification for that? And design scenario accordingly.

**Example**, if you get requirement **We need 100k concurrent User** access support then you need to find out
- Why this kind of requirement was made?
- What achievement will be done with this?
- what are the situation Business is expecting,
- What is the target for business/revenue.

### Step 3. Understand App Architecture : 
Before design scenario, you should be careful on understanding the architecture. spatially 
- How it was designed? Overall component diagram 
- How modules interacts to each other? Interaction diagram
- What are possible bottleneck areas you may find from previous experiences or from community?(have a Google search on those) 
- Does those areas related to selected scenario? If yes, include those checking inside test script

### Step 4. Understand your tools : 
This is very tricky & hard.And it might take long time. You need to care about  
- How your tool works?
- How tool generate and manage load
- How your project planned to run tests(Local execution/Remote execution/ CI execution etc). 
- What are the optimal setting and configuration of the tool that is best for your application. 
- How to tune tool and test cases for your application performance context(to be the best fit)

# Example 
Now, let's make some scenario based on a web application. I will try to make some scenario based on performance target.
 
### Target : High page availability : 
This is very typical case for web application. Main target , page available all the time and no error/server outage. 

To, fulfill this, the scenario should be 
- Total User/Thread = Total number of request in whole scenario
- Ramp up = This is value is tricky,
- For a gradually load generation it will be Total Single Execution period /Total User( User will be created in static incremental rate)
- For a spike load generation, it will be less than previous measurement. The less you assign , the more user will be created in small period of time.
- Sometimes, test tools used to iterate, usually this test have 1 iteration unless you need to run it for a long time.
- High availability checking(**http 200** validation always)

### Target : High user activity : 
This is very typical social media or forum web application behavior where user used to have long activity, not necessarily large number of data but long time session. 

So, for these kind of requirement, your Total User might be limited.

And, ramp up will be as less as possible but test execution will be longer. Usually 1 hour to 4/5 hours. This can be achieved by time driven tests or multiple iteration. 

### Target  : Large data exchange : 
Usually Banks or financial data transactions have these kind of requirement where a large amount of data exchanged during an user activity. 
- Number of user might not factor that much but data validation as well as data redundancy, integrity is important. These type of test includes long time execution with multiple iterations.
- Ramp up should be maximum allowed for load generators
- Total execution usually start with one hour, some cases I found up to 48 hours. 

This time length can be achieve by multiple iteration. Now a days tools have this built in inside tool for time driven tests.

**Note** : Usually , APM tools also run while doing the test. You need to know application architecture carefully to make these type of scenario to validate error conditions.

### Target : Complex/Dynamic pages activity: 
This is very tricky scenarios, because based application dynamic condition, pages changes behavior, like based on time, data, user credential. Usually, stress conditions are applied in such WebPages. So, there should be
- Less Ramp Up time
- Max/Spike Users condition
- Multiple iteration with different dynamic conditions which changes application behaviors. I suggest , keep multiple scenario running in single test session. So that, those pages stress can be validate.

### Target : Long time support/Capacity testing : 
This is very common case when it is needed for validating memory/IO/ CPU capacity. Usually, capacity will be stressed out via.
- short ramp up with certain spike users( to validate sudden resources usages)
- Long time execution , 2/4 hours with High user load condition
- Long time execution , 7-30 days with Average/High user load condition.

This type of test must need continuous monitoring some time with application profiler.

### Things to know
In all cases, You need to take care about
1. You full load scenario should validate High Load & Max User count.
2. System errors conditions.
3. High data usages conditions.
4. If you have SLA/Requirement for concurrency/throughput/HPS etc, they you need to apply inside transaction/step

**Notes** : 
- Iteration pacing is the delay for each user full scenario completion.
- Ramp Up is the Time we allow load generators to create users/thread

Thanks…:)