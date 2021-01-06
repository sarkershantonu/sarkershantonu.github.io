
In this article we are going to see how we can install Jmeter plugins in CLI linux. 

This is very useful for aws, remote servers with no gui, installing over SSH, Docker configuration etc. 

### Step 0 : Dependencies 
- For downloading , you need CURL/WGET
- For Running jmeter , you need an oracle jdk8+
- Create a folder where you used to store all artifacts. 
- We will use ``/opt`` to install jmeter after configuration. 

### Step 1 : Update 
``` 
sudo apt-get update
```

Step 2 : Download Jmeter 
I am going to use jmeter 5.3 in this example, you can use other versions. 
```
curl -O https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.3.tgz
```

Step 3 : Extract Jmeter archive
``` 
tar -xvf apache-jmeter-5.3.tgz 
```

Step 4:Optional : Remove Unnecessary Folders
- Remove **docs**
- Remove **printable_docs**
``` 
rm -rf $JMETER_VERSION/docs $JMETER_VERSION/printable_docs 
```

Step 5 : Download CMD Runner in lib
- Goto lib folder
- Download current CMD runner version 2.2.1
``` 
cd apache-jmeter-5.3/lib
curl -o https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.2.1/cmdrunner-2.2.1.jar
```
Step 6 : Download jmeter plugin Manager
- Goto lib/ext folder
- Download Jmeter plugin Manager , current version is 1.6
``` 
cd ext/
curl -o https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.6/jmeter-plugins-manager-1.6.jar
```

Step 7 : Download Plugins
- get back to lib folder and execute cmd runner with plugins 
- We have to exclude unwanted plugins. I am excluding  jpgc-hadoop,jpgc-oauth
```
cd ..
java  -jar cmdrunner-2.2.1.jar --tool org.jmeterplugins.repository.PluginManagerCMD install-all-except jpgc-hadoop,jpgc-oauth
```

### PluginManagerCMD Details 
From github [**repository**](https://github.com/undera/jmeter-plugins-manager/blob/master/src/main/java/org/jmeterplugins/repository/PluginManagerCMD.java), you can see how CMD runner processing the installation. .

In this example I am using  **install-all-except**, but you can use 
- status 
- install
- install-for-jmx
- uninstall
- available
- upgrades
- help

Now, what plugins to exclude? 
You can see the whole list here https://jmeter-plugins.org/repo/ 
If you get the names, you can see which are not needed. And then put those after **install-all-except** with space. 

### Available Plugins 
From https://jmeter-plugins.org/repo/ 

### Notes 
1. In all download you may use ```wget``` instead of ```curl -O```