---
layout: post
title: Introduction to Regular Expression
date: "2013-06-29 03:51"
tags: [regex]
permalink: /2013/06/29/regular-expression-intro/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Regular Expression"
gh-badge: [star,follow]
comments: true
---
In this article, we are going to learn basic Regular Expression.

### Why Regular Expression(Regix)
Regular expression is one of the daily necessary items for a developer as well as tester. My focus will be on how to cover both side. I personally use regular expression
- Jmeter, Gatling, Load Runner for extracting information from response data/headers/cookie/url
- Data Scraping, for extracting information from any HTML/CSS/XML element
- Selenium webdriver, for finding element
- Robotium, for finding element
- Genie, For finding element.
- NodePadd++ to modify regex based information.

So, my focus will be the basic terms and examples which are used by me.

First, let's have an idea about what is Regular Expression. A regular expression is the set of characters containing symbolic and literal meaning, together they create an expression that matches like as pattern match from a given character set. Detail description, you may find in [wiki](https://en.wikipedia.org/wiki/Regular_expression). The main objective is , getting objective character set from given set of characters.
So, a regular expression activity will have 3 parts.
a. Given text or set of characters or a doc( text/html/xml or any)
b. Pattern to match( the regular expression)
c. Matched Array(the result set)

### String Definition
Before start writing Expressions, we need to know some **Stringdefination/meaning** (literal) in the regex. Let's use see in the rgular expression the meaning of the symbols.
- Letters: ```a-z```
- Digits : ```0-9```
- Capital Letters: ```A-Z```
- any character: ```.```
- any single digit: ```\d```
- any Non Digit character: ```\D```
- Period: ```\.```
- white space:```\s```
- any Non White space: ```\S```
- any alpha numeric character: ```\w```
- any non alpha numeric character: ```\W```
- starts with indicator: ```^```
- ends with indicator: ```$
- makes/captures in a groups: ```( )```
- makes/captures in a sub groups: ```(a(bc))```
- makes/captures variable content: (.*)

### Conditional Logic expressions
- matches a or b: ```a|b```
- only one of a, b or c: ```[abc]```
- Not of abc, means no a/b/c: ```[^abc]```
- any single character of range a to z: ```[a-z]```
- any single character of range A to Z: ```[A-Z]```
- any single number between 0-9: ```[0-9]``` .It is similar to ```\d```
- m times repetitions: ```{m}```
- Minimum m time to maximum n time repetitions: ```{m,n}```
- any literal present ZERO or more times : ```*```
- any literal present ONE or more times: ```+```
- optional character indication :```?```

So, what are those. Those are meaning in the expression.

### Example:  
If our data string is like ***abcdefgh123ijklmnopqrstuvwxyz*** and we need to find **123** from there. 

So, our regular expression will be simple ```123```

we can add some intelligence here. What if we do not know the value is 1,2 or 3. If we need 3 adjacent digits. So , our expression will be ```\d\d\d```

As there is 3 times digits, we can write like ```\d{3}```.

If, we consider a digit but there can 1 minimum and 3 maximum. Then expression will be ```\d{1,3}```. 
 
In a similar situation when we need min 1, maximum unlimited the expression will be ```\d+```. 

Or no minimum and unlimited maximum digits , the expression ```\d*```

### Useful Links
1. For learning basic with [JAVA](http://www.vogella.com/articles/JavaRegularExpressions/article.html)
2. To [practice](http://regexone.com/)
3. To do experiment or test before apply , use this tool [**The Regex Coach**](http://www.weitz.de/regex-coach/)

And for advanced users , you may [**see this**](https://docs.oracle.com/javase/6/docs/api/java/util/regex/Pattern.html). It's a very enlarge support for JAVA.

Thanks...:)...