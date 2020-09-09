---
layout: post
title: Jmeter-Plugins execution tweaks
date: "2013-09-06 05:02"
tags: [jmeter,ci-cd]
permalink: /2013/09/06/maven-jmeter-plugins-tweaks/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can customize jmeter when executing with maven plugin. This is continuation post of [this original article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).

In the last article, we know about how we can configure Jmeter plugins. Now, when testing in jmeter, if we need any 3rd party JAR/Lib, how we can do that. We will see that now. 

And, if we use very minimum element in Jmeter, we may not need jmeter complete version to run, we can run minimum jmeter. That means, less download time, less java memory usages, faster loading. We will see this here. 

### Jmeter Jar Configuration 

### Adding 3rd party JARs 
- This will JARs at /lib directory

```
<testPlanLibraries>
    <artifact>org.apache.activemq:activemq-spring:5.15.2</artifact>
    <artifact>org.apache.activemq:activemq-client:5.15.2</artifact>
    <artifact>org.apache.activemq:activemq-broker:5.15.2</artifact>
</testPlanLibraries>
 ```

### Excluding Jars 

``` 
<excludedArtifacts>
    <exclusion>com.sun.jdmk:jmxtools</exclusion>
    <exclusion>com.sun.jmx:jmxri</exclusion>
</excludedArtifacts>
```

### Adding Jars in /lib/junit

``` 
<junitLibraries>
    <artifact>com.lazerycode.junit:junit-test:1.0.0</artifact>
</junitLibraries>
```

### Project with min version Jmeter
In this project We will remove some jars to make jmeter small 

by default, if we run the project without excluding any JAR, we will see these JARs in jmeter **lib** directory 

``` 

accessors-smart-1.2.jar
apiguardian-api-1.1.0.jar
asm-7.3.1.jar
bsf-2.4.0.jar
bsh-2.0b6.jar
caffeine-2.8.0.jar
checker-qual-2.10.0.jar
commons-codec-1.14.jar
commons-collections-3.2.2.jar
commons-dbcp2-2.7.0.jar
commons-io-2.6.jar
commons-jexl-2.1.1.jar
commons-jexl3-3.1.jar
commons-lang3-3.10.jar
commons-logging-1.2.jar
commons-math3-3.6.1.jar
commons-net-3.6.jar
commons-pool2-2.8.0.jar
commons-text-1.8.jar
darklaf-core-2.1.1.jar
darklaf-macos-2.1.1.jar
darklaf-native-utils-2.1.1.jar
darklaf-platform-base-2.1.1.jar
darklaf-property-loader-2.1.1.jar
darklaf-theme-2.1.1.jar
darklaf-utils-2.1.1.jar
darklaf-windows-2.1.1.jar
dec-0.1.2.jar
dnsjava-2.1.9.jar
error_prone_annotations-2.3.3.jar
ext
freemarker-2.3.30.jar
geronimo-jms_1.1_spec-1.1.1.jar
groovy-3.0.3.jar
groovy-datetime-3.0.3.jar
groovy-jmx-3.0.3.jar
groovy-json-3.0.3.jar
groovy-jsr223-3.0.3.jar
groovy-sql-3.0.3.jar
groovy-templates-3.0.3.jar
groovy-xml-3.0.3.jar
hamcrest-core-1.3.jar
hamcrest-date-2.0.7.jar
httpasyncclient-4.1.4.jar
httpclient-4.5.12.jar
httpcore-4.4.13.jar
httpcore-nio-4.4.13.jar
httpmime-4.5.12.jar
item.txt
jackson-annotations-2.10.3.jar
jackson-core-2.10.3.jar
jackson-databind-2.10.3.jar
javax.activation-1.2.0.jar
jcharts-0.7.5.jar
jcl-over-slf4j-1.7.30.jar
jmespath-core-0.5.0.jar
jmespath-jackson-0.5.0.jar
jna-5.5.0.jar
jodd-core-5.0.13.jar
jodd-lagarto-5.0.13.jar
jodd-log-5.0.13.jar
jodd-props-5.0.13.jar
jorphan-5.3.jar
json-path-2.4.0.jar
json-smart-2.3.jar
jsoup-1.13.1.jar
jtidy-r938.jar
junit
junit-4.13.jar
jxlayer-3.0.4.jar
log4j-1.2-api-2.13.1.jar
log4j-api-2.13.1.jar
log4j-core-2.13.1.jar
log4j-slf4j-impl-2.13.1.jar
mail-1.5.0-b01.jar
miglayout-core-5.2.jar
miglayout-swing-5.2.jar
mongo-java-driver-2.11.3.jar
neo4j-java-driver-1.7.5.jar
oro-2.0.8.jar
ph-commons-9.4.1.jar
ph-css-6.2.2.jar
rhino-1.7.12.jar
rsyntaxtextarea-3.1.0.jar
Saxon-HE-9.9.1-7.jar
serializer-2.7.2.jar
slf4j-api-1.7.30.jar
svgSalamander-1.1.2.1.jar
tika-core-1.24.1.jar
tika-parsers-1.24.1.jar
xalan-2.7.2.jar
xercesImpl-2.12.0.jar
xml-apis-1.4.01.jar
xmlgraphics-commons-2.3.jar
xmlpull-1.1.3.1.jar
xpp3_min-1.1.4c.jar
xstream-1.4.11.1.jar             
```

now, Lets exclude some 

``` 

 <excludedArtifacts>
	<exclusion>com.sun.jdmk:jmxtools</exclusion>
	<exclusion>com.sun.jmx:jmxri</exclusion>
	<exclusion>org.apache.tika:tika-core</exclusion>
	<exclusion>org.apache.tika:tika-parsers</exclusion>
	<exclusion>org.neo4j.driver:neo4j-java-driver</exclusion>
	<exclusion>com.helger:ph-commons</exclusion>
	<exclusion>com.helger:ph-css</exclusion>
	<exclusion>commons-pool2:commons-pool2</exclusion>
	<exclusion>commons-math3:commons-math3</exclusion>
	<exclusion>org.slf4j:slf4j-nop</exclusion>
	<exclusion>logkit:logkit</exclusion>
	<exclusion>avalon-logkit:avalon-logkit</exclusion>
	<exclusion>jdom:jdom</exclusion>
	<exclusion>log4j:log4j</exclusion>
	<exclusion>commons-logging:commons-logging</exclusion>
	<exclusion>excalibur-logger:excalibur-logger</exclusion>
</excludedArtifacts>
```

After this in lib folder you will see those JARs are gone. 

![jar-ex](/images/jmeter-maven/jar-excluded.JPG)

So, finally this is the [**pom.xml**](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-mini/pom.xml)

### Project [Source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-mini)

**NOTE** : Don't just blindly remove dependent JARs. You should have good hold on Jmeter code base to know which are mandatory for components you use in your test case. If you remove necessary JAR, build process cant run. 

### Project with 3rd party external JAR

