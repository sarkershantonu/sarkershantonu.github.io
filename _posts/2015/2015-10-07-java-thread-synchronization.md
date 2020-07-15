---
layout: post
title: Java Thread & Synchronization
date: "2015-10-07 12:45"
tags: [java]
permalink: /2015/10/07/java-thread-sync/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java Thread"
gh-badge: [star,follow]
comments: true
---
In this article we are going to learn about Java Thread & Synchronization, basic introduction. 

The theory part which is necessary for applying threading & synchronization. I will try to cover minimum information needed for understanding.

## What is a Thread ?
A thread is a mini/light weight processing unit used by Run time Environment(JVM) to process which are isolated among each other. 

Why it is lightweight, because, a thread can't be independent but it is part of a process. So, technically, a thread is a single processing unit for a whole task/process. 

To have clear idea, lets introduce some related terms.

- **Multi tasking** :  When CPU preforms multiple process from single user.
- **Multi processing** : When a CPU performs multiple processes from multiple user
- **Multi Threading** : When multiple threads performs under a single process to a CPU. 

So, by architecture, a thread will have
- Single process ID, name (or Identifier from Operating system) which are commonly shared.
- Single resource unit shared among all threads under a process. The resource can be **memory, CPU time**.  

![thread-process](/images/java/thread/thread-process.jpg)

To know memory management details , you can read [**JVM architecture**](https://sarkershantonu.github.io/2015/08/02/jvm-architecture/).

**Note** : As you know, from CPU world , there is shared CPU core technology called **Hyper Threading/Hyper Transport** which is core sharing technology that enables two processes running under same CPU core. Please dont confuse with this. 

Hyper threading makes two logical processing unit for a single core which is actually recognized by OS as two processing unit. Where as, **multiple threads** (2 or more) is recognized as a **single process** to OS.

## How thread works?
A thread is a implementation of ```runnable``` interface with ```run()``` method. 

So, when a thread is created, it actually initiate an execution unit in JVM which actually runs the statement declared in ```run()```. 

Usually, when we create a thread, we need to call ```start()``` to start the thread and ```start()``` actually calls ```run()``` safely.

Thread can **wait, join, stop** for other threads.

A group of thread can work like as, 
- **Preemptive multithreading** : In here, CPU time shared process where each thread get time to run in CPU(queued or randomly chosen or highest priority get CPU time first). This is fully controlled by JVM. 
- **Cooperative multithreading** : in here, Highest priority always get CPU time first. Unless , we explicitly make unselfish, it behaves like as selfish multithreading. ```yield()``` is used with same priority to make unselfish.

**Note** : In any java profiler, we can actually see the running thread. For [**visual VM**](https://visualvm.github.io/), see the **Threads** tab. A thread dump contains currently running thread information. 

![visual-vm-threads](/images/java/thread/visual-vm-threads.jpg)

## A Thread Life cycle : 
A thread generally have 4 State in its life cycle.
- Ready
- Running
- Hold/Sleep 
- Stop/Death of a thread

![thread-cycle](/images/java/thread/thread-cycle.jpg)

### How thread states changed :
- From **ready to running**, it is done by ```start()``` method calls, which actually runs ```run()``` method.
- From **running to hold**, it is done by ```wait()``` or ```sleep(ms)``` . And, eventually back to running by either time out or ```notify()``` / ```notifyall()```(for ```wait()``` calls only). 

**Note** : Before **jdk1.2**, ```suspend()``` and ```resume()``` was used , but it is **deprecated** due to **thread safety**.
- From **running to stop or death** , calling ```stop()``` which is **deprecated** also . It is handled by [**JVM itself**](http://stackoverflow.com/questions/16504140/thread-stop-deprecated).

### Types of thread : 

##### User Thread : 
The thread which are use for user tasks and managed by users, they are user thread. Stopping of a thread is done by users.
##### Demon thread : 
The thread which are managed by JVM it self and act like as service. (example, GC). It used to be low in priority due to it’s nature. Stopping of a thread is done by JVM.

We can change thread type before creation, but **we can’t change type when started**.

### Properties of a thread  :
- priority: (int, 1-10), representing priority of a particular thread to JVM. Default value 5 as normal. If it is created under a thread group, it gets the value from group. And, if the group default max value changed, it changed to max.
- Name(char[]) : representing name ,
- ID (long): Id of a thread.
- threadStatus(int): shows thread stated or not
- group (ThreadGroup) : Represents a set threads with common purposes, easy to manage all together.

All of these are readonly so, only getters are available

Thanks.. :)