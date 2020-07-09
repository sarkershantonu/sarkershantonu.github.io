---
layout: post
title: How to report a bug?
date: "2012-09-03 05:18"
tags: [testing]
permalink: /2012/09/03/bug-report/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on how to report a bug"
gh-badge: [star,follow]
comments: true
---
In this article we will know how to write a good bug report.

### What is a bug report?
A report that describes the process to the futurity of the software in front of every member (basically the programmers) is called a bug report. You may show to the programmers in person or give them careful and detailed instructions on reproducing that. Simply, a bug report is the communicating way to prove that the software has a failure case. 

### Goals of a bug report? 
- The fix should be faster so that the software becomes bug free
- The report should clearly describe the problem to the programmer so that the root cause can be identified specifically.
- It should enable programmers to see the program failing in front of them.
- A bug report may contain the following sections to describe itself. It is just a best practice.  There may be more or less sections depending on project.   

### Common elements of a Bug Report
- **Bug No** : The bug number of the tracking system
- **Link** : It is the public/private link of the bug
- **Bug Title**  : A title should describe the bug’s key point.(one line max)
- **Bug Summary** : A summary should describe the full bug at a single line( Should not exceed one line)
- **State** :  Any one of the bug states.**New/Open/Assign/Test/Verified/Deferred/Reopened/Duplicate/Rejected /Closed**
- **Prerequisites**: The pre installed items/requirements should be here. 
    - Name of operating system (if it has dependency on different OS) 
    - Name of software installed(if it has dependency on software, Ex- Dot Net framework)
    - Name of browser (if it has dependency on browser.  Ex- Firefox, chrome, safari.)
    - Name of proxy (it it has decencies on environment. Ex- NTLM, Authenticate Proxy etc)
    - Hardware conditions & configurations (it it has dependency on different hardware) 
- **Bug found version**: The version no of the software in which the bug was founded
- **Bug fixing version**: This is an optional tag describing which version will get the solve of the bug( following project’s release plan)
- **Severity**: The bug’s priority should be here. These are some priority tags (from wiki). Those may be change due to project scope. You may add priority value in there. 
    - Blocker – blocks development and/or testing work (you probably wouldn't know)
    - Critical – crashes, loss of data (internally, not, say, your edit preview)
    - Major – major loss of function
    - Minor – minor loss of function or other problem where easy workaround is present
    - Trivial – cosmetic problem like misspelled words or misaligned text
    - Enhancement – request for enhancement (feature requests)
- **Reproducing steps**: These are steps to reproduce the bug. Every steps should be distinct. In here a good tester will provide the shortest path to reproduce the bug. 
- **Actual Value** : The facts that found following the steps
- **Expected value** :The results that was expected following the steps. It will be perfect to link up the expected results with SRS/FRC documents. 
- **Assign To** : The responsible person who will take care of the bug.(initially, It may be assigned to team leads, they may distribute the responsibility)
- **Reported by** : Bug reporter's name  
- **Comments** :  Comments which are very much welcomed in a bug life cycle. Any member or the responsible person can comments on that. It can be use for describing current state of the bug in development lifecycle. 
- **Attachments** : Most of the bug trackers supports multimedia attachments. If necessary , you may attaché pictures, audio or even video. The best practice is to attaché picture(screen shots). 

### An Example 
Let's think an web application ***www.testWebApp.com*** has a log in page. 

A tester have found a bug that an user named Shantonu, password: 123456 can’t log in using Firefox browser(3.6.15) under Windows XP with Authenticate proxy conditions. Now, how he will report.

Step 0 , please check that bug is not listed before. So, 

- **Bug No**: 1(mostly, the reporting bug tracker will provide the value, no need to insert)
- **Bug Link**: mostly, the reporting bug tracker will provide the link which may public or private
- **Bug Title**: Failed to log In 
- **Summary** : User Shantonu(pass 123456) can’t login with Firefox 3.6.15 under Authenticate proxy on Windows XP Professional(5.1.2600 Service Pack 3 Build 2600).
- **State** : New as Newly posted. 
- **Prerequisites**: Please make sure that the following environment is set 
    -Windows XP professional 5.1.2600 Service Pack 3 Build 2600
    -Firefox 3.6.15 is installed (cache cleaned) 
    -Authenticate proxy is installed  
- **Bug found version**: 0.0.5.125
- **Bug solving version**: 0.0.6.150
- **Severity**: Blocker (as it is un usable on that conditions,it may be major if the release priority is not on proxy/browser) 

- **Reproducing steps**: 
    1. While running pc at windows, run Firefox 3.6.15 from start menu. 
    2. After opening, write the address (www.testWebApp.com ) in the address bar &press enter
    3. When login page appears, insert the user name as Shantonu and password as 123456 
    4. Wait & see that Failed to Login( or http bad request)
- **Actual Value**: The login fail. ( or HTTP bad requested) (it is better to provide a screenshot and the error details here, if possible, include the firebug* error steps)
- **Expected value**: User Shantonu should successfully login (you may add the specific FRS/SRS reference for better understanding)
- **Assign To** : Mr. X( as team lead or sleeted reported person or responsible person)
- **Reported by** : Shantonu Sarker 
- **Comments**:  (optional , if necessary for spatial instructions.)
- **Attachments** : Screenshot1 : Failed state with the attached screenshot

*Firebug is an add on for Firefox that shows the step by step execution using page source.

### Best Practices: 

##### Be specific: 
Be very much specific for the steps and all the sections.

##### Be descriptive:  
Provide more detail information rather than less. But be careful as If you say too much, the developer can skip some and if you say too short they have to come back and ask more questions. 

###### Example 
At the starting of my career, I wrote some bugs with one line steps where I had to explain several time to the developer. Later on I had to provide more detail on the comment section. So, bottom line is , you have to be descriptive enough to make all understand about the problem and you have to avoid over description. 

##### Be careful of pronouns & language: 
Be specific on component like don’t use words like "it", or references like "the window", when it's unclear what they mean. 

###### Example : 
I started sampleApp. It opens a warning window. I tried to close it and it crashed." It isn't clear what the user tried to close. 
Did they try to close the warning window, or the whole of sampleApp? It makes a difference. 

Instead, you could say "I started sampleApp, which put up a warning window with the title( let’s say : warning). I tried to close the warning window, and sampleApp crashed.
This is longer and more repetitive, but also clearer and less easy to misunderstand.

##### Revise: 
Read the report and see if you think it's clear. Try to reproduce the bug by following your own steps. Please check the spelling on the revision time.

##### Use multimedia :  
In modern world , every one like multimedia in case of communication. Try to use at least screenshots to describe the error. 

Thanks for your time that you pass reading the article….:) 

