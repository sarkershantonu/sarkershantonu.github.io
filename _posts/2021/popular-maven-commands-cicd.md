In this blog, we are going to see maven Commands that can be used in CLI or CI/CD.

This is very useful if you are a **DevOps** person creating ci/cd system. This will also help you to set up runtime environments using Jenkins.

# Maven Lifecycle & Plugins 
- 

### Maven Lifecycle Examples 
- clean project ```mvn clean```
- compile project ```mvn compile```
- build project ```mvn build```
- test project(before build) ```mvn test```
- deploy a project 
- 
### Maven Property Example 

- Inject a property , the syntax is ```-DPropertuName=PropertyValue```. example , let's say you have a property **artifact.name** and value **app.2.4** and you want to change this value to **app.2.5**.

So, the maven install command will be ```mvn install -Dartifact.name=app.2.5```. 

### Maven Profile Examples 

- Select a profile 

### Maven with Corporate Proxy 
Best way to do is to put proxy information in settings.xml. You can also put proxy info directly 

- Adding proxy information in regular maven commands ```-Dhttps.proxyHost=your_proxy_host -Dhttps.proxyPort=your_proxy_port```

# Maven with artifact Repository  

# Maven with ANT 
- Plugins to use [**maven-antrun-plugin**](https://mvnrepository.com/artifact/org.apache.maven.plugins/maven-antrun-plugin) 
- To build with default plugin config use ```mvn package```
- To build with **build.xml** ```mvn install```. you should have build description in build.xml. 

# Maven Wrapper 

Just replace ```mvn``` with ```mvnw.bat``` in windows and ```./mvnw``` in linux. 