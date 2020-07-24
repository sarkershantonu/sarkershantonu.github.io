---
layout: post
title: jrunscript, Java CLI script shell
date: "2013-07-22 10:06"
tags: [java,jdk-tools]
permalink: /2013/07/22/jrunscript/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Java"
gh-badge: [star,follow]
comments: true
---
In this article we are going to elaborate the **jrunscript** commands.

# What is jrunscript?
jrunscript is Java command line script shell, supports both an **interactive** mode (read-eval-print,input code and response) and a **batch** mode(-f option,all input together) of script execution. 

### Syntax 

    jrunscript (options) (arguments) 
    
This is scripting language independent shell, but by default JavaScript is used. **To set other languages, we have to use options**. 

# Cli Options : 
- classpath or cp (path) : Specify where to find the user's .class files that are accessed by the script.
- D(name)=(value) : Sets a Java system property.
- J(option) : Pass option directly to the JVM on which jrunscript is running.
- l (language): Use the specified scripting language.
- e (script) : Evaluate the given script.
- encoding (encoding) : Specify the character encoding used while reading script files.
- f (script-file) : Evaluate the given script file (batch mode).
- f - : Read and evaluate a script from standard input (interactive mode).
- q : List all script engines available and exit.

Most of the options are used in the batch script running mode. In interactive mode, it works just like as command shell.  We can also run a JavaScript file directly

**Example** : 

        jrunscript test.js arg1 arg2 arg3

Thanks...:)