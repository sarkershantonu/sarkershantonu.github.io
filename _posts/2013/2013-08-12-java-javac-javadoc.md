---
layout: post
title: How java, javac, javadoc work?
date: "2013-08-12 05:59"
tags: [java,reflection]
permalink: /2013/08/12/java-javac-javadoc/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java Reflection"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how to work **Java** CLI tools works with java **Sources** & **Classes**. So, The main topics are **java, javac, javadoc** tools on java classes and java source code.

## What is a Java Source & Java Class?
Java Source is plain text file containing Java Code. where as class is compiled sourced code(aka byte code).First we make source code , then compile into byte code(class file or jar file) and then run byte code.

**Java Source ->Java Byte Code ->Running byte code in JVM.**

## Class Types
- **User Classes**, which are defined by developers(our made byte code). We can set location by -classpath option
- **Extension Classes**, which are used by user classes or environments. These are 3rd party extensions that helps for a particular purpose. (usually as .jar files under jre/lib/ext folder)
- **Bootstrap classes**, which comes with Java Run-time Environment(in rt.jar).

## Security Factors : 
Class loaders loads Classes and interfaces to use them with a security policy. 

A program can load a class/interface by calling loadClass method of a class loader object. It calls internal class loader that applies the security policy. 
- If enabled, policy is configured by system and user policy files 
- If policy is not enabled, by default all are "Trusted"
- Bootstrap classes are always "Trusted"

## Java commands : (to run byte code)
When we run java launcher(java command), it first look for bootstrap classes, then extensions and then user classes. 

Java command reads system property (from **sun.boot.class.path**) and gets the bootstrap class first. We can redefine using **-Xbootclasspath**.

Java command loads extensions using [**extension mechanism**](http://docs.oracle.com/javase/7/docs/technotes/guides/extensions/index.html) . 

Byte code must be in JAR files(loose class files will not be found). We can not change the location. **Same name classes under different JARs are undefined**.

For User class, Java command follow **-classpath** for JARs/Class files. 

The user class contains fully qualified names(with package name) and stored in tree formation folder followed by the name.

(A dot will create a child folder. i.e. If a qualified class name = com.package.MyClass , then the my class will be com/package/MyClass.java file. and byte code will be com/package/MyClass.class). 

Java command puts the user class path string in the **java.class.path** system property. where
- The default DOT(**.**) means that user class files are all the class files in the current directory (or under it, if in a package).
- The value of the **CLASSPATH** environment variable, which overrides the default value.
- The value of the **-cp** or **-classpath** option overrides both the default value and the CLASSPATH value.
- The JAR is specified by **-jar** option, which overrides all other values. If this option is used, all user classes must come from the specified **archive**. 

If , classes are in a JAR file, java command gets class list from manifest (I will provide a separate post for JAR file specification)In general, classes referenced by a
- The JAR files in the JAR-class-path are searched after any earlier class path entries, and before any entries that appear later in the class path.
- If the JAR-class-path points to already searched JARs ,then these will not be searched again. (For  optimization and avoiding circular searches)
- If a JAR file is installed as an extension, then any JAR-class-path it defines is ignored.(it will not be consider as user class, will be handled like as other extensions are handled)

## Javac and Javadoc Commands: 
- Like java, **javac** and **javadoc** loads class files to run
- For source code processing both need object type used in source code.
- The class files are used to resolve source code references but,
- Both resolve references to classes and interfaces that may be present in class files, source files, or both (though have nothing to do with implementation of javac or javadoc)
- The tools classes in **tools.jar** are only used to run javac and javadoc.
- Both javac and javadoc supports bootstrap and extension class path changing with **-bootclasspath** and **-extdirs** options. (not modify to the classes that runs the javac or javadoc themselves).
- If a referenced class is found in both a class file and source file, javadoc always uses the source file but javac uses class files(automatically recompiles any out of date class files , these rules have specifications)
- By default, **javac/javadoc** search the user class path for both class and source unless **-sourcepath** is specified (for source files only)

Thanks...:)