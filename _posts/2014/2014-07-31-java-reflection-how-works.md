---
layout: post
title: What is Java Reflection?
date: "2014-07-31 01:07"
tags: [java,reflection]
permalink: /2014/07/31/java-reflection-how-works/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java Reflection"
gh-badge: [star,follow]
comments: true
---
In this article we are going to know about **Java Reflection**, basic, how it works? how we can use it? 

I will use Java example with eclipse. But you can use C# also.

## What is Reflection?
By name Reflection we know it reflect some thing. Actually, it reflects existing **class, methods, fields, interfaces**. We can get all information as well as we can access those, invoke those or some time manipulate those.  

In short we can call Reflection as a **class manipulator**. I have seen people get very afraid by the mane. 

It’s actually a very easy way to access class items instead of calling them. It is more over an API rather than technique to change existing class/packages. It will mainly work for meta data rather then main information.

## How it works?
We can use reflection to access classes when they are loaded to JVM. 

Unlikely using in compile time, reflection access all items in a class during runtime in JVM. That means, we can apply dynamic logics, make dynamic and flexible application with reflection. And we should care about the complexity that it might cause.

## Why we use it?
- I should say, it is mostly used when we need to take decision dynamically or runtime. That is is why it is mostly used with different patterns(like factory).
- We use it for testing, spatially in making stub or mocking.
- We use it with de compiler, spatially we want to know the artifact(source code)  from existing class or jar or war. (with help of other APIs)
- We can use in monitoring(what class loaded and what it is going to do)
- we use this for accessing private members or functions of a class.
- We can use for contracting source code with existing compiled code.
- Very handy when we make keyword driven test execution with framework.
- We can define source(as string) code at runtime.
- If we make a pluggable software where we can add feature while the main application is running, then reflection is the only way. It’s kind of responsible for new function and behaviors in Runtime.
- I found it very useful for monitoring(and debugging) client and server side running application from a third party point of view (or service).
- Runtime class creation, parameterize behavior , extensible, separate compilation, self-examinable are the major benefits.
- When we are writing adaptation based programming, this is the only way.

## Why we should not use it?
- As, reflection works run time, the application might get slow and unstable if we use this. We need to be very precise and careful while using reflection.
- Reflection does not work with Applets.
- Definitely Reflection violates the security & integrity
- Some time, Reflection gets sloppy. It might give good performance some time, and some time bad.

So, hard to decide the root cause. So, super carefulness needed. I found some statistics in Net regarding using reflection for field access(comparing different Java version)

![field-accesses](/images/java/reflection/field-access-time.jpg)

- Sometimes it is impossible to resolve an issue implemented using Reflection.  Program became more an more complex if we don’t take care before using.

### How we can use it?
In Java, there is whole library for doing this. If we use import java.lang.reflect , then we get all access. Inside the reflect package, we get several classes that provide different access mechanism to access several artifacts of a target class. This is a small illustration of what we get with reflection API(source: internet)

![java-reflection-api](/images/java/reflection/object-hierarchi.jpg)

I will write separate posts for accessing each of those.

Thanks .. :) 