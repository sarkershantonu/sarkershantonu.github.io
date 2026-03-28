---
layout: post
title: JMeter Config | TCP Sampler
date: "2013-01-19 22:51"
tags: [jmeter]
permalink: /2013/01/20/jmeter-config-tcp-sampler/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter testing"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker
---

In this article we are going to see how can we configure JMeter by changing property of JMeter. In this section we will see the different mode settings for TCP Sampler in ```jmeter.propertie```.

In the JMeter installed bin directory(in my case C:\apache-jmeter-2.8\bin), we get a file named JMeter.properties. Open this with note pad. Search for tcp sampler section in notepad and get the following.

# TCP Sampler Configuration
- To set default handler class ```tcp.handler=TCPClientImpl```
- To set byte value 111 for end of line , it will be from -128 to +127, ```eolByte = 111``` 
- To set this to a value , outside the range -128 to +127,  (to skip eol checking) ```tcp.eolByte=1000```
- To set  TCP Charset ``` tcp.charset= ```
 
Note : It is used by ```org.apache.jmeter.protocol.tcp.sampler.TCPClientImpl``` default to Platform defaults charset as returned by ```Charset.defaultCharset().name().```

- To set status.prefix(start with the string, in here Status=) and suffix (strings for enclose the status response code, in here Full stop.)
``` 
tcp.status.prefix=Status=
tcp.status.suffix=.
```
- To specify status.properties (property file to convert codes to messages) ```tcp.status.properties=mytestfiles/tcpstatus.properties```
- To set length prefix , for LengthPrefixedBinaryTCPClientImpl implementation,2 is default ```tcp.binarylength.prefix.length=2```

Note : In that part, I could not use all. I will try this with an example later on.

Thanks..:)