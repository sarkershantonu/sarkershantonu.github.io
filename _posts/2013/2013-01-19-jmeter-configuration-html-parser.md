---
layout: post
title: JMeter Config | HTML Parser
date: "2013-01-19 03:51"
tags: [jmeter]
permalink: /2013/01/19/jmeter-config-html-parsers/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter testing"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker
---

# JMeter HTML Parser Configurations 
In this article we are going to see how can we configure JMeter by changing property of JMeter. In this section we will see the different type of Parsers' settings in ```jmeter.properties``` or ```user.properties```.

In the JMeter installed bin directory(in my case C:\apache-jmeter-2.8\bin), we get a file named JMeter.properties. Open this with note pad.

### HTTPSampleResponse Parser configuration 
- To set the parsers [Space-separated list of parser groups], ```HTTPResponse.parsers=htmlParser wmlParser```
- To set HTML parser Class Name ```htmlParser.className=org.apache.jmeter.protocol.http.parser.HtmlParserHTMLParser```



- To set pursing file type ``` htmlParser.types=text/html application/xhtml+xml application/xml text/xml```
  
##### Note : 
This is Default parser, Other parsers:
  ```org.apache.jmeter.protocol.http.parser.JTidyHTMLParser```,``` org.apache.jmeter.protocol.http.parser.RegexpHTMLParser```

### WML Parser configuration 
- To define pursing class (we can use our own developed purser class) ```wmlParser.className=org.apache.jmeter.protocol.http.parser.RegexpHTMLParser```

- To set pursing file type(default, text type, vnd.wap.wml) ```wmlParser.types=text/vnd.wap.wml```


Thanks...:)