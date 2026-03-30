---
layout: post
title: Calculation with JMeter functions
date: "2013-05-23 08:31"
tags: [performance-testing,jmeter]
permalink: /2013/05/23/jmeter-function-calculations/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker

---

In this article we are going to see the function in JMeter used for Calculations. Calculation like randomizing, incremental, simple adding etc.

### Counter 
```${__counter(FALSE,myVeriable)}``` This is a simple counter that increments in +1.
- It uses Integer variable , so limit is 2147482647
- Counter function is fully independent
- It has 2 parameter, First one(mandatory) take TRUE/FALSE and 2nd one is the name of Variable to store the data.
- TRUE means, it will count user separate among users
- FALSE means, the count user will be globally. All users will be counted centrally.

### Sum 
- Integer : ```${__intSum(4,5,myVeriable)}```,  It takes minimum 2(up to nth) integer value as variable and returns result in a variable as sum of those.
- Long ```${__longSum(9999999999,22222222222,myVeriable)}``` , It takes minimum 2 (up to nth) Long valueas variable and returns result in a variable as sum of those.

### UUID 
```${__UUID}```
- It returns a pseudo random type 4 Universally Unique Identifier (UUID), it follows 1970 starting UUID formats. 

### Randomization 
- ```${__RandomString(5,shantonu,myVeriable)}```, It returns a random string from given set of characters(second parameter) of length(first parameter which is mandatory ) and stores in a variable(third parameter)
- ```${__Random(1,100,myVariable)}```, It returns a random integer value from given set of range (first parameter for min & second parameter for max) stores in a variable(third parameter)

Thanks..:)