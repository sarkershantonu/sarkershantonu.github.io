---
layout: post
title: Java Installation
date: "2013-07-02 00:41"
tags: [java,reflection]
permalink: /2013/07/02/java-installation/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Java"
gh-badge: [star,follow]
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

### For win 7:  
Start -> Control Panel-> System -> Advanced system settings -> Advanced ->Environment Variables -> System variables -> PATH.
Now add the located path with this ; separator. 
(Note : To check path variable you can try echo %PATH% in command prompt)

### For CentOS :  
In CentOS the folder /etc/profile.d/ is the recommended place to add customizations to the system profile(adding path). While installing the Sun JDK, you might set the JAVA_HOME and JRE_HOME environment variables. For that
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

        source java.sh

For Ubuntu, you need to just write the command in command line which I have added in the file.

Available Commands after installing JAVA :
When we install JAVA, we can see the command in the bin directory. (for windows 7, it is in C:\Program Files\Java\jdk1.6.0_25\bin or C:\Program Files(x86)\Java\jdk1.6.0_06\bin) Or, if you are using only JRE then you get them in the jre's bin folder. And, in case of jre, you will get less facility then jdk(as development command are missing)

For Java commands, there is common way to write , That is
[commandName] [CommandOption] [Class/JAR/ByteCodeName] [Parameters(Multiple are given in space)]

And, available Commands are ( described with category) 
