---
layout: post
title: Test Reporting with jmeter-maven
date: "2020-09-03 05:02"
tags: [jmeter,ci-cd]
permalink: /2020/09/03/maven-jmeter-reporting/
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
To enable, html report, we can use this in configuration. 

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
```<errorRateThresholdInPercent>2</errorRateThresholdInPercent>``` in configuration section. 


- Stop Jmeter from printing console output 

```
 <suppressJMeterOutput>true</suppressJMeterOutput> 
```

- to skip whole test 

```
 <skipTests>true</skipTests>
```

- To specify Log Level 

``` 
 <overrideRootLogLevel>debug</overrideRootLogLevel>
```

### [Finally report POM.XML ](https://github.com/sarkershantonu/jmeter-novice-to-advance/blob/master/jmeter-maven-examples/jmeter-enhanced-reporting/pom.xml)

### [html-reporting-Project-source](https://github.com/sarkershantonu/jmeter-novice-to-advance/tree/master/jmeter-maven-examples/jmeter-enhanced-reporting)

