---
layout: post
title: Elements inside DotNet CLR
date: "2015-04-25 20:36"
tags: [dotnet, clr]
permalink: /2015/04/25/dotnet-clr-elements/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on performance-analysis"
gh-badge: [star,follow]
comments: true
---
In this article, we are going to see major elements which are present inside DotNet CLR that are important for Performance Investigation. 

## What is dotnet?
Is it a framework? or a run time? or a platform or a system? In my opinion, it is a software development platform combined with different systems.

To think simply, Dotnet is a development platform for windows environments.

![dotnet-basic](/images/dotnet/clr/dotnet-basic.png)

**Note** : Now a days, with mono project and CLR being open sourced(dotnet core), it is possible to run certain version of DotNet over Linux. 

So, what is inside Dotnet. To have clarity, let’s know some history of Dotnet. The successor of dotnet was, VB. VB was a wonderful and easy platform to develop windows application along with COM(Component Object Model). After evolution of 32bit OS and now in 64 bit OS, it was hard to manage legacy support for old software and driver for devices. Microsoft came up with evolutionary idea to have a platform having multiple language support (spatially they need some language for OOP support which can be competent to Java) and generic compiled code which can be run-able the same way for all language generated(compiled) code. So, like as Java, Microsoft Introduce Intermediate Language Code. (IL, similar to Class files in Java). So, the We see the dot net has 2 major component.

A. IL code generator (Like as JDK)

B. IL code runner (CLR, Like as JRE)

A. What is IL code generator? This is a full set of language , its compiler, its IL Code generator , targeted for one thing. Creating your code into run-able intermediate language. Which is called IL code. Let’s see, what are items inside of this.

1. Different languages, script like c++, C#, J#, VB etc.

2. Compilers respect to each language , like c++ compiler, c# compiler, J# compiler, VB compiler.
image


3. CTS : Common type system which actually has all of the type definitions used for different languages supported by dotnet. Like as common type for all language. Simple Example : Int32 is a common type which is int in c#, integer in VB. So, it is easily understandable, CTS is followed by all language compilers. And, all CTS items must have direct run-able capability to CLR(IL code runner)

4.  CLS :  Common language Specification : This is common agreement between all languages of Dotnet. This is very important due to , framework or class designers will follow the specification to make a single IL code accessible from all language. In summary, CLS has the specification which should be common for all language. So, definitely, it is subset of CTS. I found this nice picture from internet defining CTS/CLS nicely.
image

5. Base Classes : Like JDK, Dotnet also have some Base class libraries which helps to build application. These are called Base Classes. This is provided by Microsoft commonly used for all languages (as it follows CLS). Example : ADO.Net, I/O, Diagnostics, Environment controlling libraries etc. From 3.5, Microsoft add some smart libraries named as Layer Cake.

6. Foundations : To make development attractive and targeted for specific user problems, Dotnet brings different type of application development as suit which contains different base classes and associated runtime system. Like, for web , ASP.net. For mobile, win mobile platform, for desktop, win forms , WPF etc.
image

So, after those components are being in interaction, dot net IL compilers generate IL code.
When IL code generated, it generated with Dotnet assembly, which contains
->IL Code
->Resource Files
->Type Meta Data
->Code Meta data or assembly Manifest
I will provide separate post for DotNet assembly only.
B. IL Code runner : Which is named as CLR, common language runtime. It is similar concept as JRE. The main responsibility of CLR is to run your code produced IL in optimized way. To run IL, CLR has major 4 components.
1. GC(Garbage Collector)
2. CAS(Code Access Security)
3. CV(code Verification)
4. Translator(From IL to Native)

[Jit : Just In time Compiler , is subset of CLR which compiles and executes the code
Language Code > Language  Compiler > IL > .NET Runtime > JIT Compiler > Machine code > Execution ]

This is part is very important as performance engineer where we have to provide evidence of performance issues caused by code. I will provide separate blog posts on each of those.

So, finally, the image has become this.
image
Image from Internet :
image
Note :
* -> Now a days, with mono project and CLR being open sourced, it is possible to run certain version of DotNet over Linux. 

One of the major source : This link
Thanks..:)