---
layout: post
title: String operations in JMeter functions
date: "2013-05-23 08:31"
tags: [performance-testing,jmeter]
permalink: /2013/05/23/jmeter-function-string-operations/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker
---

In this article we are going to see some necessary string operations that can be done using JMeter function.
JMeter provides a lots of functions for operation over string/data. Some technique are describe below.

### ORO Regexp
```${__escapeOroRegexpChars([^"].+?,MyVer)}```
- This will escape the ORO Regexp meta characters to java \Q\E Regexp engine. From example, it will be \[\^\"\]\.\+\?
- It has two parameter, first one(mandatory) the string to escape and the second one is the variable name to save.

### Get Character with ASCII value
```${__char(65)```
- This function converts from a integer value(parameter) to Unicode character . In the example, it will give A.
- The parameter value is integer(default Decimal, can be Hex, binary, octal)
  - This allows us to add characters to a field.
  - Helpful for identifying items.

### Unescape Function
```${__unescape(\t\n\r)}```
- The __unescape function returns a string result of evaluating a Java-escaped string like as ```__char()``` above.
- It has one parameter which is mandatory. This is more like Jaca-escaped string.
- This allows  us to add characters to a field.
- Helpful for identifying items.

### EscapeHtml
```${__escapeHtml( "Shantonu" & "Test" )}```
- It escapes characters in a string using HTML entities,
- It supports HTML 4.0
- It has one parameter, the string to escape. This function will hide spatial string (our chosen) and shown with HTML formatting. The example will be converted in to ```Shantonu``` & ```Test```

### UnEscapeHtml
```${__unescapeHtml("Shantonu" & "Test")}```
- It is opposite of Escape HTML , so  we will give HTML formatted text and get string formatted data. From the example we will get "Shantonu" & "Test"