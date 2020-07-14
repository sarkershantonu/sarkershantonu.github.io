---
layout: post
title: Jmeter Best Practices
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

##### How to get Session id/ JSON id / Cookie id / token/ view state? 
When these are generated dynamically, we have to parametrize those and use it with next requests. Without that , we will get session time out. To solve that, we need to extract those values from response data. So we will 
- Add a Regular Expression Extractor as a child of the request(of which response data will contain those information)
- Use the variable mentioned in Regular Expression Extractor, in the requests send after getting.
**Note** : I will provide separate regular expression related post

##### How to test Web Service (SOAP) with HTTPS(with credential)? 
- Add a HTTP Authorization Manager
- Add a SOAP/XML-RPC Request Sampler
- In Authorization Manager 
    - Provide service's url(without asmx or wsdl) where it prompt for credential. 
    - Provide user name and password 
    - leave domain/realm (if you do not need)

Then perform like normal SOAP request.

**Note** :
- You may need to install SSL key. For that,  download from here and install from jmeter ssl manager(CTRL+M) , it is in option menu. for detail see this. 
- you may need to change this in **user.properties**

        https.use.cached.ssl.context=false

#### Use Delay : (for stress only)
While testing for Stressing server, try to use delay to create real life user scenario. This will help keep test case like as real life. For example, you have weak log in database, and you want to avoid DB testing, add delay like 3/4 second after log in request(use constant timer, as a child of the next request of the log in request)

#### Recording & Parametrization : 
If you use HTTP proxy server for recording and want to parametrize the URL in the script, add the URL variable in the root test plan and then record under of that. After recording you will get every request using the URL will be parametrized. 

#### Test Execution : 
- Before running **give more RAM to Jmeter** . How to do that? Open jmeter.bat(for windows) or jmeter.sh(for linux) with text editor , you will get a line for HEAP memory. default 512m. Make it 1024m or 2048
        
        set HEAP=-Xms2048m -Xmx2048m

** Why this is important?** it will allocate JVM more space. When you try large test cases with many users, it will be needing more memory. 

- Before making the test plan, Configure jmeter.properties according to your need following the architecture of the application.

- If you can not avoid listener during test execution, try only Summary Report or aggregated report.

- Try using stepping thread or ultimate thread group.(Jmeter plugins) 
- There are some issues may arise for holding the thread for hours or more(due to garbage collector and time out). See those issues from jmeter log (see log file or click ! symbol during execution) and fix according to that.

**Example**: if you get timeout exception, then change the ramp up time. 
If you get response exceptions from server(while testing soap, getting server busy) , you need to add some logical delay(use constant timer). 


Thanks...:)