---
layout: post
title: Java Commandline Options
date: "2013-07-13 14:10"
tags: [java,jdk-tools]
permalink: /2013/07/13/java-javaw-cli-options/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java"
gh-badge: [star,follow]
comments: true
---
In this article we are going to elaborate the Java Application Launcher(java/javaw) with Commandline Options

### What is 'java' & 'javaw'?
- Java is command to launch Java Application from byte code. 
- javas is **non-console version** of java .So, it just works without console window.


## Syntax
As we know the standard format of commands in java, the java/javaw command also have the format(in command prompt)

        java [option] [jar/class name] [parameters..]
        javaw [option] [jar/class name] [parameters..]

## CLI Options 

- version : If we want to know which version java is running (the PATH defined version)

- showversion :Display version information and continue 
- help or -? : Showing help
- client : Select the Java HotSpot [**Client**](http://docs.oracle.com/javase/7/docs/technotes/guides/vm/server-class.html) VM(Currently is not active for 64bit JDK)
- server : Select the Java HotSpot [**server**](http://docs.oracle.com/javase/7/docs/technotes/guides/vm/server-class.html) VM(Active for 64bit JDK)
- agentlib : Loads native agent library.

            Syntax  : -agentlib:libname[=options]

- agentpath : Load a native agent library by full Path Name


        Syntax  : agentpath:libname[=options]

[More from agent command line options](https://docs.oracle.com/javase/7/docs/platform/jvmti/jvmti.html#starting).

- **classpath**: Set's the class path when calling with java/javaw. It is also valid for javac/javadoc/apt tool

            Syntax : -classpath classpath1;classpath2...

We can also use set before classpath to set class paths.
Note : Each classpath should end with a filename or directory depending on setting the class path To. 
- **cp** : It is same as classpath, just shorter version. 

- D : Set a system property value

        Syntax : -DPropertyName=value

- disableassertions : Disables assertions(default) for a specific package/sub package.With no arguments , disables assertions. With one argument ending in "...", the switch disables assertions in the specified package and any sub packages.
If the argument is simply "...", the switch disables assertions in the unnamed package in the current working directory. With one argument not ending in "...", 

the switch disables assertions in the specified class.

        Syntax : -disableassertions[:<package name> [arguments...] | :<className>]

Note : It switches apply to all class loaders and system classes . 
Exception : in the no-argument , it does not apply to system. This makes it easy to turn on asserts in all classes except for system classes. 

A separate switch is provided to enable asserts in all system classes. 

- da: Same as disableassertions
- disablesystemassertions : Disables asserts in all system classes
- dsa : same as  disablesystemassertions
- enableassertions : Enables assertions, just opposite of disableassertions.

        Syntax : -enableassertions[:<package name> [arguments...] | :<className>]
        
- ea :  Same as enableassertions
- enablesystemassertions : Enable asserts in all system classes 
- esa : Same as enablesystemassertion.
-jar : Execute a JAR file. with arguments. We have to define the MAIN containing class name.

        Syntax : -jar Main-Class:[class name]

Note : When we use this option, the JAR file is the source of all user classes, and other user class path settings are ignored. I will provide a separate post for detail jar commands.

- javaagent : Loads a Java programming language agent.

        Syntax : -javaagent:jarpath[=options]

- jre-restrict-search : Includes user-private JREs in the version search.
- no-jre-restrict-search :Excludes user-private JREs in the version search.
- splash:imagepath Show splash screen with image specified by imagepath.

        Syntax :  -splash:[imagepath]

- verbose:(Any one of following options)
class : Displays information about each class loaded.
gc : Reports on each garbage collection event.
jni: Reports information about use of native methods and other Java Native Interface activity.

There are some nonstandard options present. They are  : 
- X : Shows help for all non standard options
- Xint : Runs the interpreted-only mode. 

Note: 
- Compilation to native code is disabled
- All bytecodes are executed by the interpreter. 
- The performance benefits of Java HotSpot Client VM's adaptive compiler will not work.

- Xbatch : Disable background compilation.(helpful for making resource free, compilation done in foreground)
- Xbootclasspath: Specifics list of boot class files

        Syntax : -Xbootclasspath:[bootclasspath ]. It has two other variations.

- Xbootclasspath/a:path  : Appends a path to the default bootstrap classpath.
- Xbootclasspath/p:path  : Pretends a path in font of the default bootstrap classpath.

Note : For all of these cases, The list of directories, JARs, ZIPs will be written with semicolon(;) separator.

- Xcheck:jni : Validates the parameters passed to the JNI function , runtime environment data before processing the JNI request by JVM. 
- Xfuture : Perform strict class-file format checks(Used in backwards compatibility, and code structure reviews)
- Xnoclassgc : Disable class garbage collection
- Xincgc: Enable the incremental garbage collector
- Xloggc:file : Logs the reported every garbage collection events(with -verbose:gc) into file.
- Xmn(size) : Sets the size of the heap Nursery*.
- Xms(size) : Sets the initial Java heap size(any format Xms256m, Xms256000k, Xms256000000)
- Xmx(size) : Sets the maximum of Java heap size
- Xss(size) : Set the thread size
- Xprof : Profiles the running program, and sends profiling data to standard output. 

- Xrs : Reduces usage of OS signals by JVM.

Note :
- **Ctrl-Break** thread dumps are not available.
- User code is responsible for causing shutdown hooks to run.(implicitly have to use exit or start commands)
- XX:+|-DisableAttachMechanism : Specifies whether tools(Ex- jmap/jconsole)are allowed to attach to the JVM. (Default disabled)

- XX:AllocationPrefetchStyle=n : Selects prefetch style used during allocation(default=2)
- XX:+AggressiveOpts : Enables aggressive optimization.
- XX:SoftRefLRUPolicyMSPerMB=0 : Enables aggressive processing of software references.
- XXLargePageSizeInBytes=n :Specifies the maximum size for large pages.

- XX:ParallelGCThreads=n : Sets the number of GC threads in the parallel collectors.
- XX:MaxGCPauseMillis=n : Sets a target for the maximum GC pause time..
- XX:(size) : Sets the size of the heap Nursery*. Sames as -Xmn(size).
- XX:+|-UseCompressedOops : Enables compressed references in 64-bit JVMs.(True by default)

- XX:PredictedClassLoadCount=n : Specify this number shown in the output from -verbose:class. in case our application loads a lot of classes, and especially if class.forName() is used heavily.

Note : This option requires that the UnlockExperimentalVMOptions **-XX:+UnlockExperimentalVMOptions** flag be set first

- XX:+PrintCompilation :Prints verbose output from the HotSpot dynamic runtime compiler.
- XX:+PrintGCDetails : Prints garbage collection output
- XX:+PrintGCTimeStamps : Prints garbage collection output along with time stamps.
- XX:TLABSize=n : Set the size TLABs(Thread local allocation buffers)
- XX:+UnlockCommercialFeatures : Unlocks the use of commercial features. See Commercial features are at the Oracle Java SE Products web page. 
- XX:+UseConcMarkSweepGC : or - XX:+UseG1GC : Enable either the Concurrent Mark Sweep (CMS) or the G1 garbage collectors.
- XX:+UseLargePages : Enable large page support.
- XX:+UseParallelOldGC :Enables the parallel garbage collectors, which are optimized for throughput and average response time.

* Nursery is a part of the java heap reserved for allocation of new objects. (similar work like as buffer or temp storage)

Note : Most of the commands options are tested by me. But, I could not make all working as I do not have enough resources and scenarios.

## All CLI options

            -d32          use a 32-bit data model if available
            -d64          use a 64-bit data model if available
            -server       to select the "server" VM
                          The default VM is server.
        
            -cp <class search path of directories and zip/jar files>
            -classpath <class search path of directories and zip/jar files>
                          A ; separated list of directories, JAR archives,
                          and ZIP archives to search for class files.
            -D<name>=<value>
                          set a system property
            -verbose:[class|gc|jni]
                          enable verbose output
            -version      print product version and exit
            -version:<value>
                          Warning: this feature is deprecated and will be removed
                          in a future release.
                          require the specified version to run
            -showversion  print product version and continue
            -jre-restrict-search | -no-jre-restrict-search
                          Warning: this feature is deprecated and will be removed
                          in a future release.
                          include/exclude user private JREs in the version search
            -? -help      print this help message
            -X            print help on non-standard options
            -ea[:<packagename>...|:<classname>]
            -enableassertions[:<packagename>...|:<classname>]
                          enable assertions with specified granularity
            -da[:<packagename>...|:<classname>]
            -disableassertions[:<packagename>...|:<classname>]
                          disable assertions with specified granularity
            -esa | -enablesystemassertions
                          enable system assertions
            -dsa | -disablesystemassertions
                          disable system assertions
            -agentlib:<libname>[=<options>]
                          load native agent library <libname>, e.g. -agentlib:hprof
                          see also, -agentlib:jdwp=help and -agentlib:hprof=help
            -agentpath:<pathname>[=<options>]
                          load native agent library by full pathname
            -javaagent:<jarpath>[=<options>]
                          load Java programming language agent, see java.lang.instrument
            -splash:<imagepath>
                          show splash screen with specified image
Thanks...:)