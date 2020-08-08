---
layout: post
title: Out Of Memory in Java
date: "2015-08-02 20:36"
tags: [jvm,java]
permalink: /2015/08/02/java-oom-why/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Java Exception"
gh-badge: [star,follow]
comments: true
---

In this article we are going to see Java OOM (out of Memory) Exception/Error details: What & why?. This is very important for Java developers and Performance engineers who need to monitor or analyze JVM errors to get root cause for those.

By the name Out of memory it is easily understandable on what is it. That means, program got no rooms or memory to allocate. But it is not straight forward. Due to JVM architecture, this memory consumption happens in different level in JVM work flow. So, out of memory exceptions are categorized based on where it occurs.

1. Java heap space : When JVM heap becomes full, then this type of error occurs. BTW, not all the time JVM needed to be full, the main cause is, heap can not allocate more memory. JVM tries by GC calling. This error can be happened due to
a. Heap space full
b. Heap is fragmented and biggest block of memory is not enough to allocate necessary amount of memory.
c. Heap area may be present but, young object space ration is set to minimum or default condition which cant initiate new memory allocation in young object space.
d. Application has memory leak , where memory grows UP or not released
e. Certain functionality of an application makes memory peaks which never drops.
and etc. This is one of most common problem for JVM OOM.

JVM tuning flags : -Xmx<size>, -XX:MinHeapFreeRatio=<Percentage Minimum >,-XX:MaxHeapFreeRatio=<Percentage maximum>, -XX:NewRatio=<Number> , 
-XX:NewSize=<Size>, -XX:MaxNewSize=<Size>, 

Summery of Java Memory : (source internet, I just edit JVM 1.8 part)



2. Perm Gen space : This is another common cause for JVM OOM. This occurs due to shortage of Permanent Generation space. From Java 8, this error will not occur as perm gen was removed from JVM, so before JVM 8, we can get this error.

Due to JVM work flow, when an class loader loads a class , in its initial state, if Permanent Generation space of JVM does not have enough space or fragmented to allocate required memory. 
So, it is easily understandable it occurs due to
1. Large number of class loading
2. Large size class loading that contain large number of static items.
So, while using 3rd party frameworks inside code, it is mandatory to be careful on how to use them efficiently when those framework classes usages static methods. So, eventually, when we deploy new version application in server, if old 3rd party class references are kept in memory , application might face this problem.

JVM tuning flags : -XX:MaxPermSize

And, if class Unloading is not enabled , we can use -XX:+CMSClassUnloadingEnabled if you are using mark & swap GC. So, while using parallel/serial GC use this flag (-XX:+UseConcMarkSweepGC) to keep the option effective.

Meta Space : From Java 8, the information stored in permanent generation is moved to meta space which actually lives in native memory. It might throw out of memory exceptions for similar causes like perm gen space.

JVM tuning flags :-XX:MaxMetaspaceSize=<size>

3. GC overhead limit exceeded : When a Garbage Collection spending more than 98% of total time in collecting & less than 2% of the heap is recovered after GC, this error is thrown from JVM as error to indicate of error.
This means, GC has rapidly failing to cleanup memory at its maximum efforts.
This amount 98% or 2% are configurable while GC tuning.

There are several causes, most of the cases, over use of manually calling GC might make this overhead.
JVM tuning flags : -XX:-UseGCOverheadLimit

These previous three type of OOM occurs in 95+% events . The rest of them are in following causes.

a. Unable to create new native thread : When host OS is unable to allocate new thread requested by JVM, JVM throws this error. This is fully platform & JVM dependent.

So, we can find this error in
> Java Native code proxies(process) trying to create a new thread.
> An running application trying to create a Java thread.
> OS is trying to create a new thread.
> OS refuses or has no native memory allocation for a new thread. (as we know when a thread is created, thread specific register, stack and all other memory allocated. Please see JVM architecture for more details)
And, When one time error occurred, this can make chain of thread to show exception, so those can create the error too.

You may define lower stack size parameter to increase thread creation limit by JVM to OS.
You can check the thread number by experiments. Sample code from google codes.

b. Native Get New TLA : When JVM can't create new thread in local area. Local area referred to the buffer used for memory allocation in multi-threaded application. This error is specific to jRocket JVM.
JVM tuning flags : -XXtlaSize

c. Requested array size exceeds VM limit : When we try to create an array larger then limit of VM. Usually it is depend on x64 or x86 version of JVM allocation. Beside, which version JVM uses the platform more efficiently. So, the limit will be Integer.MAX_VALUE-1 = 2147483647 = 231-1.

d. request [size] bytes for [reason]. Out of swap space? : When JVM fails to allocate virtual memory from OS. All OS virtual memory represented by physical & swap space to JVM, so JVM recognizes as not enough virtual memory space & consider low swap space (swapping happens when physical memory is getting filled and allocating to swap area). So, if this error occurs, that means, OS is near to boundary limit of total allowable memory space( physical+ virtual storage) . So, increasing physical memory or virtual memory (swap space) might solve problem temporarily.

Sometimes we might face similar error like Out of memory : Kill process or specific child. This is one kind of above causes where child process could not allocate memory. It might cause operating system extra overhead.

e. [reason] [stack trace] (By Native method) : While running native calls from JNI it might cause OOM with this format. So, in that case you need to investigate the native program for root cause, this actually Java External cause from native method invocation over JNI.

For OS Swap & JNI allocation problems, often we need to kill unwanted process to save memory usages.

IBM JVM 1.5 : Only for Java 5.0 Service Refresh 4 (build Feb 1st, 2007) and older the number of class loaders that are permitted is limited to 8192 by default and an OutOfMemoryError exception is thrown when this limit is exceeded.  Use the -Xmxcl to increase the number.
Example to 30000, by setting -Xmxcl30000,

I will try to add more incrementally.

Thanks..:) 