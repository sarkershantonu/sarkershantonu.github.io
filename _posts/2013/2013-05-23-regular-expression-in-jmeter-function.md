---
layout: post
title: Regex in JMeter Function
date: "2013-05-23 08:31"
tags: [performance-testing,jmeter]
permalink: /2013/05/23/jmeter-function-regex/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker
---

In this article we are going to see how we can use regular expression with a function to retrieve information from response data. We will see full detail of the function.

```${__regexFunction((?i).*?abcd.*,$2$,ALL,,,ReturnOnNoMatch,myVariable,InputVariableTextToParse)}```
- This is the function with Seven Parameters.
- First Parameter(mandatory) :The regular expression which will be applied to response data. It grabs all the matches.
- Second Parameter(mandatory) : This is the template string that will replace the function at run-time. To refer to a group captured , we need to use the syntax: ```$[group_number]$. Ie: $1$, or $2$.```
- Third Parameter : We have to insert our choice of matching in here for the use in case of multiple matches.We can choose in 4 ways.
  - An integer - Tells JMeter to use that match. '1' for the first found match, '2' for the second, and so on
  - RAND - Tells JMeter to choose a match at random.
  - ALL - Tells JMeter to use all matches, and create a template string for each one and then append them all together.
  - A float number between 0 and 1 - tells JMeter to find the Xth match using the formula: ```number_of_matches_found * float_number``` rounded to nearest integer
- Fourth Parameter : If ALL selected from 3rd, this argument item(character/string) will be added between every value during append
- Fifth Parameter :  Default returning value if no match found
- Sixth Parameter : A reference name for reusing the values parsed by this function. Stored values are ```${myVer}```  and ```${myVer_g#}``` where ```#``` is the group number from the regular expression 
  - ```0``` can be used to refer to the entire match.
- Seventh Parameter :  Input variable name. If specified, then the value of the variable is used as the input instead of using the previous sample result.
  - It can also store variable for further use
  - As it can use reference variable, we can use previous results as parameters.
  - Vastly used for quick data and report processing.

Thanks..:)