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
In this article we are going to see installation process of Java. By mean of Java, I am referring JDK which comes with JRE. This blog has been update with new versions of java. 

## What is Java? 
Java introduced as programming language, which has its own runtime environment(named JRE) that runs java applications on top of JVM(java virtual machine)

# Java Installation in windows

### Download & install 
- For Open JDK : [Download from here](https://openjdk.java.net/) and follow Gui Instructions
- For Graal VM : [Download from here](https://github.com/graalvm/graalvm-ce-builds/releases/) and follow Gui Instructions
- For Oracle JDK : [Download from here](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html) and follow Gui Instructions

Make sure you choose windows 64bit

### Configure Java
- Open **System variables** windows
    - either : Start -> Control Panel-> System -> Advanced system settings -> Advanced ->Environment Variables -> System variables 
    - or , press windows key and type *edit the system environment variables* & press enter. 
- In system variables section , click New and add following variable names with values.
    - **java.version**, C:\Program Files\Java\jdk1.8.0_231
    - **JAVA_HOME**, C:\Program Files\Java\jdk1.8.0_231
    - **JDK_HOME**, C:\Program Files\Java\jdk1.8.0_231
- Open **Path** variable
- Click **New**
- type **%JAVA_HOME%\bin** and press ok  , this will add java in path variable. 
Note : My java installation path is "C:\Program Files\Java\jdk1.8.0_231", if it is different than your's , please use that. 

# Java Installation in Ubuntu

### For Open JDK8 : 
        
        sudo apt-get update && sudo apt-get install openjdk-8-jdk
### For Open JDK13 : 
      
        sudo apt-get update && sudo apt-get install openjdk-13-jdk

### For Graal VM : 
- [Download from here](https://github.com/graalvm/graalvm-ce-builds/releases/) for ubuntu
- Unzip 

        tar -xvzf graalvm-ce-1.0.0-rc14-linux-amd64.tar.gz
- More files to proper directory 

        mv graalvm-ce-1.0.0-rc14/ /usr/lib/jvm/
        cd /usr/lib/jvm
        ln -s graalvm-ce-1.0.0-rc14 graalvm

- if you have multiple version installed in pc, choose correct Java version 

        alternatives --config java

now choose your GraalVM java , like me if you had 3 java, and graal is no3, so you can install like this.        

        alternatives --install /usr/bin/java java /usr/lib/jvm/graalvm/bin/java 3
###  For Oracle JDK13 : 

        sudo apt-get update && sudo apt-get install -y software-properties-common
        sudo add-apt-repository ppa:linuxuprising/java
        sudo apt-get update && sudo apt-get install -y oracle-java13-installer

Installation does not mean you can use in command line. You need to add certain environment variable then you can 

### Configure Environment
Java to OS's PATH. Keep the java's bin directory path in the operation system's path .It will help a OS to find the commands.

#### Ubuntu 
- This will add in path variable 

        export JAVA_HOME=/usr/lib/jvm/openjdk-13-jdk
        export PATH=$PATH:$JAVA_HOME/bin
        
if open JDK 8 , change name "openjdk-13-jdk" to "openjdk-8-jdk"

### For CentOS(old post) :  
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

# Test Installation 
- Open Commandline and type 

        java -version 
        
You should be able to see java version details. 

![java-installation](/images/java/java-installations.JPG)        