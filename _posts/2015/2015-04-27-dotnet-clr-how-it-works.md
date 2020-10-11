---
layout: post
title: What is CLR? How it works? 
date: "2015-04-27 20:36"
tags: [dotnet, clr]
permalink: /2015/04/27/dotnet-clr-how-it-works/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on performance-analysis"
gh-badge: [star,follow]
comments: true
---
In this article, we are going to learn about Dot Net CLR environment and its parameters. We will know details about those parameters and impacts of the parameters in **performance bottlenecks**.

# What is CLR?
CLR stands for Common language Runtime. As concept, it is same as JRE. It gives MSIL code to have an environment where it can run. 

That means, MSIL or intermediate language running platform is CLR. So, main function is CLR runs Application. 

Let’s break down this functionality with basic understanding of CLR. I will not go much deeper, just those basics what a performance engineers should know. 

### Class/MSIL code verifier(CV) or Code Verification : 
This basically checks and verifies the code/classes that it going to run. So, CLR must know CLI(Common Language Infrastructure) specifications to do that. CLR has that inside. It also includes Type Checker.

### Code Access Security(CAS) : 
Inside runtime, there is an element called CAS which actually verifies security inside code, access security, execution and authentication related checks over MSIL code. It is ignored in desktop apps but widely used for web apps.

### A Compiler/Translator: 
That converts the the MSIL code into machine code to run over OS/kernel. Basically , this runs the application. This is called JIT. Just in time compiler. This takes the MSIL and executes. Inside of Jit, there are
- class loaders,
- code managers
- Debug Engine
- Exception Manager
- Thread support
- Com Marshaler

And , the base class library supports that comes with dotnet packages.

**Note** : Here are some difference between **debug mode JIT** and **Release mode JIT**. Generally, in release mode, JIT does more scoping ignoring mini scope and prioritizing global scope, so allocation of memory and CPU will follow that and application environment runtime behavior might depend on that

### Garbage Collector (GC) : 
This is most probably the well known item. Before CLR, GC was present for other language. Microsoft enhance this GC and include other items to make CLR. The main function of GC is to collect garbage from memory(RAM/Virtual storage inside run time environment).

As we know, **memory in windows system found in 8 types**(except free), GC is all about managing Stack & Heap memory. 

By mean of Heap, is managed heap. Un managed heap(regular heap) actually for c++ objects that we wont talk about.

So, to under stand GC, we need to know how dot net allocate its memory. Initially , local functions will be using Stack and when we create object of classes, it will be created in managed heap(new keyword). Here it comes the GC actions.

GC has mainly 3 functions

#### GC Functionality :  Allocation  
That basically allocate memory for newly created object in space. In the evaluation of GC, they allocate memory in different way / with different algorithm (Free list , bulk pointer, swap) lets talk about dotnet GC here.

Dot net categorized allocatable object into basic 3 generation based on **Most object die young**. That means, the new object is created the quick it will be collected.
- Generation 0 = Which keeps newly created objects and expired after each GC collection event.
- Generation 1 = Which holds the survived objects from Generation 0 after a GC collection. This is kind of intermediate space between Gen 0 and Gen 2.
- Generation 2 = Which holds the survived objects from Generation 1 after a GC collection.

So, how GC decide what to keep and what to delete. This is another function of GC called Identification.

![gc-allocation](/images/dotnet/clr/gc-alocation.gif) 
 
#### GC Functionality : Identification : 
This is a basic function for a GC to decide what object to keep , what to delete and what to upgrade to higher generation (from 0 to 1 to 2). 

Basic algorithm is object Tracing and Reference counting. Usually no object will be collected if it has live reference. (dead reference means dead objects, which will be collected in next GC). 

Tracing provide a graph map to show distance from GC root to current object. So, if an object is far from GC, it will last longer generation.

#### GC Functionality : De allocation/Reclamation : 
This refers to Collection event when GC collects unused memory and free up the place for new objects. 

Sometimes, GC performs De-fragmentation to organize free space. 

For performance engineers, there are lot to be taken care of.
- GC tracing & Reference counting , events, resources.
- GC allocation, de allocation
- de-fragmentation

**Notes** : 
- Modern dotnet comes with two type of GC, workstation GC and Server GC.
- **Workstation GC** is single threaded but faster & synchronous. It is good for desktop/Native application. 
- **Server GC* is multi threaded , asynchronous. It is good for web applications and services.

So, these are very basic items inside CLR from a overview.

![clr-internals](/images/dotnet/clr/clr-internals.png) 

In each of them , we can find separate components. In separate post on performance counters on each of the item, I will explain more about item insides.

Thanks..:)