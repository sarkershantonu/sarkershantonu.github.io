---
layout: post
title: Performance test script Qualities
date: "2015-02-01 08:06"
tags: [performance-testing]
permalink: /2015/02/01/performance-test-script-qualities/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
In this article, we are going to see some basic quality of a performance test script which is also know as VUser script. This post actually continuation of [**this**](https://sarkershantonu.github.io/2015/01/31/vuser-performance-test-script/)

## Qualities of a VUser Script :

#### 1. Usages/Load Model :  
Vuser script should reflect a real user. That means, the real user usages model(work load model).

##### Example : 
when we add item in shopping cart(eCommerce site), our shopping card will add the item and user see that added item after some time(ex : 500ms or more). Or, when we provide log in request, user will wait for at least some logical time to log in(Ex : 200ms or more). That means, based on your performance goal and requirement. Understanding the usages model is very important. So, add relative delays based on your scenario with feedback from business users or real users(or from stakeholders) while collecting the Performance goal and requirement and add those delays or conditions respectively.

#### 2. Follow User Steps: 
This means referring user steps inside script. Vuser script must reflect business functions. Script should have reference from Performance Goal and Requirements. And, organize in such way so that a person can understand the scripts when he knows about those Goals.

#### 3.Efficient use of Resource:  
Vuser should occupy less memory and processing power. We need to careful about un necessary pre/post processor usages, new variable initialization. Re using same variable as well as do multiple processing in same execution will make the script more efficient.(Example : Try to reuse same correlation variable if it is changing or when you are parsing, get multiple data same time , try to run same post processing multiple time. Incase of Regular Expression, multiple grouping works very well)

#### 4. Initiation and Cleanup : 
Vuser should have cleanup steps. More often when we do test, there are lots of test data. Depending on system, a smart vuser should have cleanup steps to get those un necessary data out of the system. This is similar to TearDown/ @aftertest functionality if you are familiar with unit testing.

#### 5. Comments : 
Always use comments with good naming convention. In agile, it is said , your code should be self explanatory. Added to that, if you follow good naming convention and comments that reflects to requirements, it will help you as well as your successors to follow up your script. Both Jmeter and Load Runner(C code) has comment options that really helps for keeping track.

#### 6. Coding Best Practices : 
Vuser script is similar to code. Some tool like Load runner use C code in background. So you should follow best practices, avoid code smell, organize in maintainable way and try to get rid of all of anti patterns.

#### 7. Re Use build in functions : 
Reuses tool in built in functions, avoid creating new functions which are available inside tool.

#### 8. Assertion/ Validation: 
VUser should have assertion or validation after each step or transaction of group of transaction. This is fully based on you domain application. Example : if you are doing log in transaction, try to keep assertion with any item from the page that get loaded after login. This way, it will prove, you server responses after your login request and loads the page(send all items) after the request.

In some cases when you need to check whether server is responsive or not(http 200 message) you can avoid this. I used to avoid this for load test but I add this for stress testing. 

**Example** : when I need to check all the page of a website links and responses are ok or not, I avoid this. But, I use this when I need to verify after log in request, there is a real log in or after credit transaction, the change value is coming. 

- Thanks to [**Joerek van Gaalen**](https://www.facebook.com/joerek.vangaalen?fref=ufi) , he pointed out (i forgot). 

**Note** : Don't forget to deduct the time taken due to assertion/validation which is taken by tool not your server.

Thanks…:)