---
layout: post
title: Java Command Tools
date: "2013-07-12 00:41"
tags: (java,reflection)
permalink: /2013/07/12/java-command-tool/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Java Command Tools"
gh-badge: (star,follow)
comments: true
---
In this article we are going to see the commands and tools which are available after installing Java SDK. Mainly we will focus on the basic of the command and we will see commands related to administrating java project. I found this is helpful when you are using java for automation and managing java codes. 

Why we are learning this : We have to learning this for some specific focus. We need some administration task doing for test automation. Like as
- Running Selenium grid/ Stanalone servers
- Running JMeter remotely
- Running JUnit packages
- Running Android unit tests
- Appending command in the build system for build or continuous integration in JAVA projects.

After installing java we need to add Java to system variable:
Add Java to OS's PATH. Keep the java's bin directory path in the operation system's path .It will help a OS to find the commands.

For win 7:  Start -> Control Panel-> System -> Advanced system settings -> Advanced ->Environment Variables -> System variables -> PATH.
Now add the located path with this ; separator. 
(Note : To check path variable you can try echo %PATH% in command prompt)

For CentOS :  In CentOS the folder /etc/profile.d/ is the recommended place to add customizations to the system profile(adding path). While installing the Sun JDK, you might set the JAVA_HOME and JRE_HOME environment variables. For that
- Create a new file called java.sh(its a shell script that sets the environment variable)
vim /etc/profile.d/java.sh

In the file, we need to add environment variable initialization commands.  
export JRE_HOME=/usr/java/jdk1.5.0_12/jre
export PATH=$PATH:$JRE_HOME/bin
export JAVA_HOME=/usr/java/jdk1.5.0_12
export JAVA_PATH=$JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin

Now when you restart(to load profile.d file ) . 
Note : If you do not want rebooting, you have run source command
$> source java.sh

For Ubuntu, you need to just write the command in command line which I have added in the file.

Available Commands after installing JAVA :
When we install JAVA, we can see the command in the bin directory. (for windows 7, it is in C:\Program Files\Java\jdk1.6.0_25\bin or C:\Program Files(x86)\Java\jdk1.6.0_06\bin) Or, if you are using only JRE then you get them in the jre's bin folder. And, in case of jre, you will get less facility then jdk(as development command are missing)

For Java commands, there is common way to write , That is
(commandName) (CommandOption) (Class/JAR/ByteCodeName) (Parameters(Multiple are given in space))

And, available Commands are ( described with category) 

## Java Launching Tools :  
1. java (Java application launcher)
2. appletviewer (Java applet launcher)
3. javaw (Java application launcher(same as java) without console window)
4. javaws (Java Web Start launcher)
5. extcheck (Checks version conflicts between a target JAR file and currently installed JAR file)

## Java Development Tools :  
1. javac (Java programming language compiler commands)
2. javadoc (Java code documentation commands)
3. apt (java annotation Processor)
4. jdb (Java Debugging Helper)
5. javap (Disassembles compiled files(class) / print a representation of the byte codes)
6. javah (C Header /Stub File Generator to associate native methods with code written in Java)
7. jar (Compresses multiple files into one Java Archive (JAR) Runnable file)
8. idlj (IDL file to java compiler/builder)
9. orbd (To transparently locate and invoke persistent objects on servers in the CORBA environment) 

## Security Tools : 
1. keytool (key and certificate management utility)
2. jarsigner (JAR Signing and Verification Tool)
3. policytool (Manage policy files)- It has a GUI to work with 
4. kinit (obtains Kerberos v5 tickets(it's a network authentication protocol))
5. klist ( Gets all entries in credential cache and key tab)
6. ktab ( Help the user to manage entries in the key table)

## Scripting tool : 
jrunscript (Command line script shell)

## Converting tools : 
1. native2ascii (Convert text to Unicode Latin-1)
2. HtmlConverter (Converts applets containing HTML page to a format which uses a Java Plug-in)

## Deployment Tools :  
1. pack200 (Converts a JAR file into a pack200 compressed file)
2. unpack200 (Converts a pack200 compressed file into a JAR file)
3. javafxpackager (Packages JavaFX applications for deployment)

## Monitoring Tools : 
1. jps (JVM Process Status Tool, shows the instrumented HotSpot JVMs on the target system)
2. jstat (JVM Statistics Monitoring Tool)
3. jstatd (RMI server application , monitors the creation and termination of instrumented HotSpot 4. JVMs and provides a interface to allow remote monitoring tools to attach to JVMs running on the local host)

## Troubleshooting Tools : 
1. jhat (Java Heap Analysis Tool, parses java heap dump and launches web server to brows them)
2. jinfo (Java configuration Info helper that prints configuration of a process /core file/remote debug server)
3. jmap (prints shared object memory maps /heap memory details of a process or core file or a remote debug server)
4. jstack (Java Stack Trace) 
5. jsadebugd (Serviceability Agent Debug Daemon)

## Web Service Tools : 
1. wsgen (Generates JAX-WS portable artifacts.)
2. wsimport (Generate JAX-WS portable artifacts.)
3. xjc (Binding compiler for Java Architecture for XML Binding)
4. schemagen (Java Architecture Schema generator for XML Binding.)

## RMI & Server Tools :  
1. rmic (Generate stubs and skeletons for remote objects.)
2. rmid (RMI activation system daemon.)
3. rmiregistry (Remote object registry service)
4. serialver (Return class serialVersionUID)
5. java-rmi (Http to CGI request, forwarding to server commands)
6. servertool (Administrating task like register, unregister, startup, and shutdown on a server)
7. tnameserv (Provides access to the naming service.)

## Tools with a GUI  :
1. jvisualvm (Manual page Java Visual VM )
2. jconsole (Monitoring tool that provides information about the performance and resource consumption of applications running on the Java platform)

Command options are depends on the command that we are using. This is actually a vast list of options available. We just need to know which one to use when. I will provide separate post for each commands with their options. So for a JAVA Command, the syntax will be 

        java ( options ) class ( argument ... )
        java ( options ) -jar file.jar ( argument ... )

And for JAVAW Command , the syntax will be 

        javaw ( options ) class ( argument ... )
        javaw ( options ) -jar file.jar ( argument ... )

#### Note : 
- Option : Command line options
- Class : Invoking class name
- file.jar : Invoking JAR file name
- argument : the arguments to pass while invoking.  

Examples : 
- To know running java version : 
    
        java -version

- To compile Java Class/program
    
        javac _JavaclassName_.java 

- To run byte code with parameters

        java _theclassName parameter1 parameter2 . . . 

Thanks..:)