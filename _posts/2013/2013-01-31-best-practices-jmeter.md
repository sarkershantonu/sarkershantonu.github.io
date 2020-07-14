---
layout: post
title: Jmeter Best Practices?
date: "2013-01-31 20:52"
tags: [Jmeter]
permalink: /2013/01/31/best-practices-jmeter/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter Best Practices"
gh-badge: [star, follow]
comments: true
---
In this part I will share some finding of mine using Jmeter. I have not done all on purposely. Some of them are from different blog that I have read so far.

### Always Follow 
- Use latest Version(for maximum support for low resource uses)
- Use latest jre
- It is better to use 4gb+ RAM for high load execution(with quad core CPU,the more user , the more resources)

### Test Plan
- Use JMeter GUI for Test Plan and Test Debugging.
- Divide your test plan into different Thread Group based on User Scenario Type. Each user behavior should be represented by each thread group. 
- Use Transaction Controller for measuring time specifically for a request as well as whole set of request..
- Use Simple Controller and Random Order Controller to send request differently under a thread group
- Try to avoid un-necessary uses of Post-Processor and Assertions. 
- Avoid Body(unescaped) if you use Regular Expression Extractor. Try to use it efficiently.
- Use Response Assertion and Size Assertion (or Duration assertion)
- Avoid Xpath/XML/XML Schema Assertions (high memory and CPU hungry) 
- It is good to use script(I am using perl, Groovy is also good)
- It is better to use recording by http proxy than manually entry of http request(time saver). Use filter for excluding and including necessary requests.
- Use parametrize values and separate text file(with CSV Data Set Config) to reading those value for testing(Ex- Username and password or search text)
- Use variables in test plan to use it all over test plan.
- Use test action (a sampler) to apply time specific behavior. 
- It is better to use thread group using from plugin. If you use default thread group, try to parametrize that, so that it can be run-time configurable.

This is commandline user and loop count parameter jmeter test plan run command  

        jmeter -t TestPlan.jmx -Jusers=10 -Jcount=50
        
### Test Debugging 
- Debug you test case using View Results Tree listener.
- Disable view result size limit by enabling this line from jmeter.properties(you can see any of my configuring jmeter for basic idea)
 
        view.results.tree.max_size=0  
  
### Test Execution
- Run JMeter in Non GUI mode on Test Execution. 
- Unless you need on purpose, try to avoid executing test in distributed way. It is very resource hungry.
- if we need Remote testing, Try to run jmeter in StrippedBatch mode(You can see this post for how to run jmeter in this mode)
  
### Reporting
- Remove all Listener while execution , save only the test results.We can extract reports from result file. 
- Use .CSV format to save results. either you can edit jmeter.properties or user.properties for enabling CSV file result saving options(For help,you can see this post)
- Best to use Aggregate Graph, Response Time Graph, and  plugin graphs(see this post for plugin installation)

Thanks...:)