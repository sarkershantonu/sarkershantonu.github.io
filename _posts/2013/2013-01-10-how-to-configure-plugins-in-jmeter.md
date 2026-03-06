---
layout: post
title: How to configure plugins?
date: "2013-01-10 12:39"
author: Shantonu Sarker
tags: [jmeter]
permalink: /2013/01/10/how-to-configure-plugins-in-jmeter/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star, follow]
comments: true
---

# JMeter Configuration P1 : How to configure plugins?
In this article we are going to see how can we change property of JMeter along with its plugins. For basic idea about JMeter and installing plugins, see my this post.

Jmeter has a very big number of properties. I will try to include one by one incrementally.

 In the jmeter installed bin directory(in my case ***C:\apache-jmeter-2.8\bin*** ), we get a file named jmeter.properties. Open this with note pad. We can find various properties which are activated and some are not yet activated.

# Configuring by jmeter.properties [Not recommended]
- To enable/disabled correct graphs display which deal with threads after reloading the JTL file.
```jmeter.save.saveservice.thread_counts=true``` By Default it is deactivated and false. 


We can configure some of the default behaviors of the plugin by adding the following lines(only the property part, not description) at the end user.properties file(it is in C:\apache-jmeter-2.8\bin in my PC) :

# Configuring by user.properties [recommended] 
- To Enable or disable the gradient paint for graphs. Default is true. ```jmeterPlugin.drawGradient=true```
- To Disable final zeroing lines in all graphs Globally. Default is false. ```jmeterPlugin.neverDrawFinalZeroingLines=true```
- To Disable current X lines drawing in all concerned graphs Globally. Default is false. ```jmeterPlugin.neverDrawCurrentX=true```
- To Enable or disable graphs Y Axis scaling for better readability. Default is true. ```jmeterPlugin.optimizeYAxis=true```
- To Use relative time in time based graphs. Default is true. ```jmeterPlugin.useRelativeTime=true```
- To make Prefix or not the Plugin items in JMeter menus. Default is true. ```jmeterPlugin.prefixPlugins=true```
- To Force line width for all line graphs. Default is '1.0'. ```jmeterPlugin.graphLineWidth=3```
- To Draw markers in relevent line graphs. Default is true. ```meterPlugin.drawLineMarker=false```

### CSV format Change
- To Force CSV separator character. Default is ',' if decimal separator is '.', ';' otherwise ```#jmeterPlugin.csvSeparator=;```. This is deactivated. I decided to use ```jmeterPlugin.csvSeparator=','```
- To Force CSV time format ```# jmeterPlugin.csvTimeFormat=HH:mm:ss```. This is deactivated. I decided to use ```jmeterPlugin.csvTimeFormat=yyMMddHHmmssZ```. 
see [**link**](https://docs.oracle.com/javase/7/docs/api/java/text/SimpleDateFormat.html) for more formats

- To use a custom path for lib/ext (not for utility jars) ```search_paths=/app1/lib;/app2/lib```

### Logging
-To Log for Debugging ```log_level.jorphan.reflect=DEBUG```
-To Enable Proxy request debug log (it is disabled by default) ```log_level.jmeter.protocol.http.proxy.HttpRequestHdr=DEBUG```

Configuring part is long post. You can see my other posts for more configurations.

...Thanks..:)