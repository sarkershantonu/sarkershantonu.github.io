---
layout: post
title: How to run JavaScript in Jmeter?
date: "2015-07-01 08:05"
tags: [jmeter]
permalink: /2015/07/01/javascript-in-jmeter-bsf-jsr223/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JavaScript in Jmeter"
gh-badge: [star, follow]
comments: true
---
In this article we are going to see how to run JavaScript in Jmeter. 
In Jmeter , we can execute JavaScript in 3 ways.

# 1. Using Run time Function: 
This is one of the most easy way of using java Script. Syntax :
        
        ${__javaScript(<Your desire script>),<JmeterVariableName>}

JmeterVariableNames is **Optional**

## How it works : 
JMeter support javaScript over Java using [**Rhino**](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/Rhino). So, it has limitations to support only Rhino supported functions. So, if you function involving page rendering or system specific logic, it might not work. For detail declarative use full java Script runner samplers.  

### When to use?
When we need to run small, simple javaScript function

### Where to use ?  
- Use this where ever you are adding parameters or values
- If you use a jmeter variable name, you can call this by that variable name.

**Example** : If we use this function helper , 
        
        ${__javaScript(currentdate.getDate(),DateNow)}

we can get this results by **${DateNow}**
For help inside Jmeter , use Function Helper  **(Menu ->Option -> Function Helper)**

![FunctionHelper-JavaScript](/images/jmeter/javascript-function-helper.jpg)

 
# 2. Using BSF Samplers : 

In Jmeter there is BSF (Bean Scripting Framework) sampler.
If we add from Samplers -> BSF Sampler, we can see this scripting interface supporting a list of language to run on top of jmeter. JavaScript is one of them.

![BSF-Sampler](/images/jmeter/bsf-javascript.jpg)

Select JavaScript as you language and use this. That's all

The editor is in below. Scripting part is in below with JSR223 as both are similar. 

## How it works : 
Apache Bean Scripting Framework runs on top of Java applications. As Jmeter is a java application , it runs on top of it. From Java 6, it shipped free with JSR223 so, both BSF and JSR223 sampler actually works same way on top of JSR223 script specified language. Think like as interpreter running over JVM. 


# 3. Using JSR223 Sampler : 
We can use JSR223 sampler to write JavaScript. This is JSR223 specified script interface. So, it supports multiple language and JavaScript is one of them. 
From samplers ->  JSR223 sampler

![jsr-Sampler](/images/jmeter/jsr-javascript.jpg)

And select JavaScript as you language and that's all to use this. 

How it works : It works same like as BSF from Java 6. For scripting, JSR sampler has spatial property in jmeter.properties. If you are adding long script, you may increase buffer size(in KB).

This size applies in both BSF and JSR sampler. Default 100kb. 

![jsr-buffer](/images/jmeter/jm-properties-jsr-buffer.jpg)

### Scripting in BSF/JSR224 : 
1. We can get parameters from parameter field. This is like as argument passing inside script. 
2. We can use following Jmeter function access like as other script languages.
**FileName, Label, log - the Logger, Parameters , args , SampleResult ,sampler , ctx, vars, props, OUT** . In the example I have use put. 
3. We can access to all jmeter variables directly  by **${variableName}** inside script.

**Example** : I use this a JSR223 sampler, BSF sampler, and Dummy sampler to show the results. The [**JMX**](/files/jmeter/javascript/blog_JavaScript.jmx) can be found in [**here**](/files/jmeter/javascript/blog_JavaScript.rar)(zipped).Use Jmeter with Plugins. 
In JavaScript function example I use this : (This will only add two value)
 
    ${__javaScript(500+300)}

In BSF & JSR223 I use this JavaScript : (This will show current date in full format) 

        var currentdate = new Date(); 
        var datetime = "Current Date and Time: " + currentdate.getDate() + "/"
                        + (currentdate.getMonth()+1)  + "/" 
                        + currentdate.getFullYear() + " @ "  
                        + currentdate.getHours() + ":"  
                        + currentdate.getMinutes() + ":" 
                        + currentdate.getSeconds();
        vars.put("JSR_output",datetime);

*I changed this JSR_output to BSF_output to separate jmeter variable names . I have include all in a dummy sampler so that I can see output in View Results Tree.

**Caution** : Before adding large javaScript, it is important to understand how it will work. Following that you should take decision. I suggest script normalization is important. By mean of script normalization, I am referring, use simple script. If your java script contains multiple js files/classes, keep it in single file, all together execute them. 

#### Note : 
- Both BSF and JSR223 sampler has Pre processor and Post processor element. Which works same way just in different context. (those are under pre processors/post processors  menu items. 
- In Both BSF and JSR samplers, you can avoid writing in editor by providing local JavaScript file path but remember it will ignore the script you written.  
- This is running Java Script not any java script framework like angular or extJS or any other. This is very specif version of Java Script execution over Java. So, please recheck your functions before using this. But, if you are using in transaction controller, you can ignore(uncheck) pre-processor time, so you have to use Pre-Processor element of BSF/JSR. 
- For large complex java script, it might take long time to complete the logic, so , do not forget to exclude this value form results. For this reason, I use sampler JSR/BSF not Post or Pre processor items. 
- Interpreter is not saved between invocations.

Thanks.. :)