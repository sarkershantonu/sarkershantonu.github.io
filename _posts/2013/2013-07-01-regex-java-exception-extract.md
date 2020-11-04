---
layout: post
title: Extract Email by Regular Expression
date: "2013-07-01 03:51"
tags: [regex]
permalink: /2013/07/01/regex-java-exception-extract/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Regular Expression"
gh-badge: [star,follow]
comments: true
---
![image](/images/regex/regex-tut-1.jpg)

In this article, we are going to see how can we extract information from a **Exception/Trace** messages using Regular Expression. 

This is regular basis need, spatially when you are analyzing a trace message that you found after an automated test process or unit test.

For basic idea about regular expression,[this old post](https://sarkershantonu.github.io/2013/06/29/regular-expression-intro/).

When analyzing a trace message, we have to retrieve information from a single trace message from trace stack. A sample example (android trace message)

```at widget.List.fillFrom(ListView.java:709)```

In here, the format of the trace is ***packageName.className.methodName(FileName:lineNumber)***

So, by construction all type of names that are used in java are made of alphabets, so the expression of every name will be ```[a-zA-Z]+.```(any character, single of multiple which are are under rage of a-z, A-Z)

Every line number may have single character to 4/5 character(if we write very long class). So , for line number the expression will be ```\d+```(any digit more than 1 time)

Now, let's look at the message: 
- it begins with ```at``` 
- and have a **space** then the original message.
- And in the end it closes with ```)```.

And after every name there is a Character(dot character or braces) .

So if we add those conditions together, we get these ```at\s[a-zA-Z]+.[a-zA-Z]+.[a-zA-Z]+.[a-zA-Z]+.[a-zA-Z]+:\d+\)$```

Now we group our necessary items that we need to get from the expression. As we want package  name, class name, method name, file name, line number: ```at\s([a-zA-Z]+).([a-zA-Z]+).([a-zA-Z]+).([a-zA-Z]+.[a-zA-Z]+):(\d+)\)$```

If we do not want package name and class name , we just omit the braces: ```at\s[a-zA-Z]+.[a-zA-Z]+.([a-zA-Z]+).([a-zA-Z]+.[a-zA-Z]+):(\d+)\)$```

So, in this way we can get our necessary information from a expression .

Thanks ...:)