---
layout: post
title: Test Reporting with jmeter-maven
date: "2020-09-04 05:02"
tags: [jmeter,ci-cd]
permalink: /2020/09/04/maven-jmeter-reporting/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can get good reports in jmeter after tests. This is continuation post of [this original article](https://sarkershantonu.github.io/2020/08/28/maven-jmeter/).

### Jmeter Reports
In Jmeter, we can have different type of test results. 
1. CSV test results (default selection by plugins)
2. JTL logs 
3. [HTML Results](https://jmeter.apache.org/usermanual/generating-dashboard.html) (modern report)
4. Jmeter Listener Graphs : Images/reports created by Jmeter Listeners


### Enabling HTML report
- To enable, html report, we can use this in configuration. 

``` 
<generateReports>true</generateReports>
```

![html](/images/jmeter-maven/html-reports.JPG)

### Result File Formatting 
- To enable CSV results

```
 <resultsFileFormat>csv</resultsFileFormat>
``` 

- To enable JTL results 

```
 <resultsFileFormat>xml</resultsFileFormat>
``` 

![jtl](/images/jmeter-maven/jtl-created.JPG)

But, if you have enabled ```<generateReports>``` true, this will be always CSV in spite of  XML settings. 

![html-csv](/images/jmeter-maven/html-csv-reports.JPG)

- To disable timestamp from file name

```
<testResultsTimestamp>false</testResultsTimestamp>
``` 

- Add timestamp at the end of the results filename

```
<appendResultsTimestamp>true</appendResultsTimestamp>
```

- Specify [**date time format**](http://joda-time.sourceforge.net/apidocs/org/joda/time/format/DateTimeFormat.html) in result file 

```
<resultsFileNameDateFormat>MMM, yyyy</resultsFileNameDateFormat>
```

- Result file folder location 

```
<resultsDirectory>/results/jmeter</resultsDirectory>
```

- As maven build fails when detecting errors  & it stops builds. To prevents this, we can ignore failure of results 

``` 
<ignoreResultFailures>true</ignoreResultFailures>
```

- To prevent maven build error, its better to have some threshold values to test case where a certain number of errors can be accepted. I prefer 2% error is tailorable. To apply this, use 

```
<errorRateThresholdInPercent>2</errorRateThresholdInPercent>
``` 

- Stop Jmeter from printing console output 

```
 <suppressJMeterOutput>true</suppressJMeterOutput> 
```

- To skip whole test 

```
 <skipTests>true</skipTests>
```

- To specify Log Level 

``` 
 <overrideRootLogLevel>debug</overrideRootLogLevel>
```

### [Finally report POM.XML ](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-enhanced-reporting/pom.xml)

### [html-reporting-Project-source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-enhanced-reporting)

### HTML Report UI

![dashboard](/images/jmeter-maven/html-dashboard.JPG)

![over-time](/images/jmeter-maven/html-over-time-charts.JPG)

# Creating Traditional Graphs 
As we can always create graphs with JTL by CMD runner, another jmeter graph maven plugins available to generate this. 

To use that plugins, we need to exclude html reporting and keep default XML (jtl) reporting format. 

### Adding Graph Plugins 

``` 
<plugin>
    <groupId>de.codecentric</groupId>
    <artifactId>jmeter-graph-maven-plugin</artifactId>
    <version>0.1.0</version>
</plugin>
```

We need to add a configuration section and add type of graph one by one. 

``` 
<configuration>
    <inputFile>${project.build.directory}/jmeter/results/*.jtl</inputFile>
    <graphs>
        <graph>
            <pluginType>ThreadsStateOverTime</pluginType>
            <width>1024</width>
            <height>768</height>
            <outputFile>${project.build.directory}/jmeter/results/graphs/ThreadsStateOverTime.png</outputFile>
        </graph>
    <graphs>
</configuration>
```

This plugins supports [following Graphs](https://jmeter-plugins.org/wiki/JMeterPluginsCMD/)(PNG): 
- ThreadsStateOverTime = Active Threads Over Time
- BytesThroughputOverTime
- HitsPerSecond
- LatenciesOverTime
- ResponseCodesPerSecond
- ResponseTimesDistribution
- ResponseTimesOverTime
- ResponseTimesPercentiles
- ThroughputVsThreads
- TimesVsThreads = Response Times VS Threads
- TransactionsPerSecond

We can add all graphs or only necessary graphs. To show in example, I have added all supported graphs in project. 

### [Finally Graph POM.XML ](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-old-graphs/pom.xml)

### [Old Graph Project Source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-old-graphs)

### Lets Run & generate Graphs 
- If we want to generate Graphs, we need to run 

```
mvn jmeter-graph:create-graph
```

And we can see graphs generated in configured folder. In my case **${project.build.directory}/jmeter/results/graphs/**

![generated-old-reports](/images/jmeter-maven/old-reports.JPG)

From my example , I am adding all generated Graphs. 

- BytesThroughputOverTime

![generated-old-reports1](/images/jmeter-maven/old/BytesThroughputOverTime.png)

- HitsPerSecond

![generated-old-reports2](/images/jmeter-maven/old/HitsPerSecond.png)

- LatenciesOverTime

![generated-old-reports3](/images/jmeter-maven/old/LatenciesOverTime.png)

- **PageDataExtractorOverTime** wont have any data to show, so, its **blank**. 

![generated-old-reports4](/images/jmeter-maven/old/PageDataExtractorOverTime.png)

- ResponseCodesPerSecond

![generated-old-reports5](/images/jmeter-maven/old/ResponseCodesPerSecond.png)

- ResponseTimesDistribution

![generated-old-reports6](/images/jmeter-maven/old/ResponseTimesDistribution.png)

- ResponseTimesOverTime

![generated-old-reports7](/images/jmeter-maven/old/ResponseTimesOverTime.png)

- ResponseTimesPercentiles

![generated-old-reports8](/images/jmeter-maven/old/ResponseTimesPercentiles.png)

- ThreadsStateOverTime

![generated-old-reports9](/images/jmeter-maven/old/ThreadsStateOverTime.png)

- ThroughputVsThreads

![generated-old-reports10](/images/jmeter-maven/old/ThroughputVsThreads.png)

- TimesVsThreads

![generated-old-reports11](/images/jmeter-maven/old/TimesVsThreads.png)

- TransactionsPerSecond

![generated-old-reports12](/images/jmeter-maven/old/TransactionsPerSecond.png)

So, we have learned both modern HTML Jmeter reporting and old style Jmeter Graphs in two different project example. 

Thanks :)  