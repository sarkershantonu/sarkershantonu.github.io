---
layout: post
title: Java Command Tools
date: "2013-07-12 00:41"
tags: [java,jdk-tools]
permalink: /2013/07/12/java-command-tool/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Java Command Tools"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see the commands and tools which are available after installing Java SDK. 

Mainly we will focus on the basic of the command and we will see commands related to administrating java project. 

I found this is helpful when you are using java for automation and managing java codes. 

### Goals 
We need to learn these when we are doing management or maintenance java application or source. Like 
- Running Selenium grid/ Standalone servers
- Running JMeter remotely
- Running JUnit packages
- Running Android unit tests
- Appending command in the build system for build or continuous integration in JAVA projects.

To install & configure java, please see [**this post**](/2013/07/02/java-installation/)

Before you read forward, you may need to have clear idea on followings : 

### What is JRE
- it is Java Run time Environment. JRE creates environment (JVM) to run ByteCode. 

### What is JVM
- Java Virtual Machine , which runs java code 

### What is JDK
Java development Kit, contains set of tools for java development. Here are basic components
- JRE
- Java Development Libraries
- Development Tools 
- Runtime tools
- Management Tools   

### Bytecode 
Bytecode is compiled java code ready to run. So, when I refer bytecode, i may mean following
- Class file (single compiled java class)
- JAR (java archive) 
- WAT (java web archive)
- JWS (java web start) , not exactly a bytecode but can be used to run java app. 
- JNLP(Java Network Launch Protocol), a xml configured file to run java app remotely. 

# JDK tools 
Let's see JDK tools in category 

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
3. Java Mission Control (oracle JDK only)


### Java commands Syntax

    commandName CommandOption ByteCodeName Parameters(Multiple are given in space)

like, for JAVA command, the syntax will be 

        java ( options ) class ( argument ... )
        java ( options ) -jar file.jar ( argument ... )

And for javaw Command , the syntax will be 

        javaw ( options ) class ( argument ... )
        javaw ( options ) -jar file.jar ( argument ... )

**Note** : 

- Option : Command line options
- Class : Invoking class name
- file.jar : Invoking JAR file name
- argument : the arguments to pass while invoking.  

### Examples : 
- To know running java version : 
    
        java -version

- To compile Java Class/program
    
        javac _JavaclassName_.java 

- To run byte code with parameters

        java _theclassName parameter1 parameter2 . . . 

Thanks..:)