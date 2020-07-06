---
layout: post
title: Tips on Scripting Performance tests
date: "2015-02-02 08:07"
tags: [Performance-Testing]
permalink: /2015/02/02/tips-performance-test-script/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
In this article we are going to know about some tips and tricks on writing scripts for performance testing in popular performance testing tools.(aka vuser script).

This tips might be helpful for writing performance test script. I would recommend you to read [**my previous post**](https://sarkershantonu.github.io/2015/01/31/vuser-performance-test-script/).

#### Tips 1: 
I prefer, separate vuser script for separate test cases. I have seen some engineers use same test case having multiple steps based on condition to perform multiple steps to perform a scenario. That makes the test case very complex and after a time , it is hard to understand. So, better, if you have different verity of test step for a single scenario, i suggest put them separate test case. And mix-up those test steps during execution. 

**Example** : If you site has 5 ways to log in transaction, try to make 5 different test cases for each way. Like in Jmeter, I use test fragment and mix those scenarios while test execution.

#### Tips 2: 
For debugging and checking all of you correlation values , use logging or debug sampler(jmeter). It helps to get the problems quickly.

#### Tips 3: 
Keep your application architecture matching tools with you which you will need frequently
- For regular expression : Regular expression tester.
- For Data Format conversion (based on what your application uses): Base64 encoder/decoder, URL Encoder/Decoder, Unix Time Stamp converter.
- For File comparing or string comparing : Compare it, winDiff, Beyond compare.
- For smart string view and search : Notepad++(my favorite)


#### Tips 4: 
If your application is a web application, use browser based tools (with plugins to get best out of that). I use [**blazemeter chrome extension**](https://chrome.google.com/webstore/detail/blazemeter-the-continuous/mbopgmdnpcbohhpnfglgohlbhfongabi?hl=en).

#### Tips 5: 
Try to familiar with different type of data format like how base46 encoding look like, How URL encoding look like. How they converts string. It will help you to find what is inside.

#### Tips 6: 
Understand all locally executable functions clearly. When you are creating Vuser, that simulate load, you have to understand how can you simulate those executable functions. Example, let say for a chat application, you might have simulated log in, but after login , local client set some parameter(based on implementation) before initiate communication. You will find same behavior for web application where you use JS/Ajax calls for various functionality. And , this is become complex if you are testing single page application. You need to keep track on all of those JS execution as well as full sequence and logic. Don’t trust on some thing happens automatically. Be clear on all of your gray area of understanding the system.

#### Tips 7: 
Try same test with another performance tools to have different view of the system that will help you clear understanding on what you are doing. This helps spatially on correlation suggestion. I use [WAPTPro](https://www.loadtestingtool.com/pro.shtml) (personal choice). You may see my [post](https://sarkershantonu.github.io/2013/01/08/Introduction-to-wapt-pro/) to know about it from basic level.

#### Tips 8: 
Do not trust auto co relation. For co relation, you tool need to determine about you application architecture which is impossible. Tools can help to suggest but, try co relation manually. Often, tool suggestion are good for platform you are using (like , for web, if you use asp.net, load runner or wapt will suggest you to co relate view state as it is part of asp.net by default). My suggestion will be, if you ever use co-relation which are suggested , verify this with regular expression tester. To , do that, just copy recorded response data and past on regular expression tester body and test the regular expression that the tool suggested. Load runner by default use Left & Right boundary to make co relation function. Just convert that left and right boundary expression meaning to single line regular expression to verify.

#### Tips 9: 
Be master on **pattern matching** from the mind. It will help applying regular expression (you need to understand the regular expressions too) as well as heuristics which defines changed behavior among requests. I think , from a skill prospective, this is the most hard and important part. If you are good at pattern matching, performance testing is easy. It will help you to solve all complex algorithm understanding as well as co relation difficulties. Bonus part is, you will learn the system from business to deployment(**Application architecture, DB, infrastructure, networking, Operating system internals, deployment system** and everything related to your system).

#### Tips 10: 
You should store test script in  version management tools similar to general codes. It will keep you track and knowledge about your script more clear.

#### Tips 11: 
Based on your requirements, try to group your request under Transaction which will give you sum of all child request time. Example : keep all request for a log in under LogIn transaction which will help to know what it total log in time while getting the results.

#### Tips 12: 
If you are writing custom function for logic behind application, use script language which keep less overhead. 

Example: I prefer writing code in Java/Groovy rather than bean shell. 

This is an ongoing post. I will add more ideas incrementally…

Thanks..:)