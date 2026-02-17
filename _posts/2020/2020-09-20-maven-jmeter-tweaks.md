---
layout: post
title: JMeter Maven Plugin tweaks
date: "2020-09-20 05:02"
tags: [jmeter,ci-cd]
permalink: /2020/09/20/maven-jmeter-tricks-proxy/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can efficiently use Jmeter maven. This is continuation post of [this original article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).

### Jmeter under proxy 
When you are working in corporate network or private cloud, you may need to run your tests under a proxy. if you want to specify corporate proxy configuration , under  <configuration> use this 
```
<proxyConfig>
    <host>host_ip</host>
    <port>proxy_port</port>
    <username>user_name</username>
    <password>password_of_proxy</password>
    <hostExclusions>localhost|*.shantonu.com|any_host_for_exclusion</hostExclusions>
</proxyConfig>
```

#### [Jmeter-Proxy Example](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-under-proxy)
- In here I am using example proxy where **host : 96.246.184.18 & port : 9128**

![proxy](/images/jmeter-maven/proxy-config.JPG)

### Specify Jmeter version to use
- By default pllugin will get latest jmeter version associated with plugin version. But, When you need specific jmeter for your load use **<jmeterVersion>** under configuration to specify jmeter version. 

```
<jmeterVersion>5.1.1</jmeterVersion>
```

### Maven Builds 
- Always use -X -e for debug and error verbose mode. 
- Single Line command ```mvn clean verify``` may not clean project , so, i prefer to use ```mvn clean``` and ```mvn verify``` separately. 

### Script Writing 
- Make user variable for all possible information. This will make test cases dynamically changeable during execution. 
- Keep all these value injectable via jmeter properties using [__P](https://jmeter.apache.org/usermanual/functions.html#__P) or [__property](https://jmeter.apache.org/usermanual/functions.html#__property)
- Do not change **Test Plan** name
- Try to avoid non traditional component. If you use that, make sure your POM has this. Remote server pom also should have all configuration to execute the JMX


This is continuing post, I will add gradually. 