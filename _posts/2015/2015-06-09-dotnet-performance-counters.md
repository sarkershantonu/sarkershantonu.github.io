---
layout: post
title: Dotnet Performance Counters
date: "2015-06-09 20:36"
tags: [dotnet, clr, performance-analysis, performance-reporting]
permalink: /2015/06/09/dotnet-clr-how-it-works/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on performance-analysis"
gh-badge: [star,follow]
comments: true
---
In this article we are going to know about different performance counters in dotnet. 

# Performance Counter : Exception 
As we monitor dotnet run time environment (CLR) during performance test, we need to know what to look for if we are measuring performance affected by Exception. 

#### What is an exception?
When a block of code (or statement) runs under try/catch block with expected not default path (exceptions), we called exception handling. 

And, if there are too much exception for a single statement, that become overhead. Because, exception in run time environment work in separate thread which is spatially created to manage exceptions. A sample exception handling block code. 

```
try{
//code block
}catch (<Exception type> anObject){
//Do something  
}
}
finally {
//do some thing which should be done all the time
}
```

And, fundamentally, each type of exception, when it is caught, is a independent object of specific/generic exception class. So, if a piece of code leads to series of exceptions, it might hamper run time environment.

In many projects, developers decide to implement business logic exceptions via try catch which is okay for small project scope, but for complex and multilayer business validation, it becomes overhead ]

#### Exception Trowing Rate(/sec) : 
- How many exceptions per second are thrown? : It shows this rate. 

Usually this rate represents exception rate between two sample of data collection not average. So, it is a vital one. 

According to Microsoft forums, a rate more than 100 exceptions/s is consider as poor performance. In practical , it depends on application.

#### Number of Thrown Exceptions : 
- How many exception are thrown? : This shows the number of exceptions since the application started.

If any exception is re-thrown , counted again.

#### Filtered Exception Rate(/sec) : 
It shows how many particular exception per second are thrown? It is same as exception throwing rate just with added filter. 

#### Finally rate(/sec) : 
It shows how many finally block executed(which caught an exception) per second. It does not shows finally blocks which are not throws exception. 

#### Throw to Catch Depth / Sec : 
This shows the level(depth) of exception, from level that throws up to where it is caught in rate(per second). That means, this shows the exception depth (nested exception) rate among two samples. 


### Notes : 
- This both counters includes handled and un-handled exceptions.
- Usually there will be two kinds of exceptions 
    - Dot NET exceptions: Thrown from dotnet managed code. 
    - Converted Un- managed exceptions: Thrown from converted un managed code(C++ libs, Com, or CLR core) that are converted into .NET exceptions.   
- All exception rates represents data rate between two sample of collection not average of all collected data. 
- Exception/sec is the most useful and usually used. 

Thanks... :)