---
layout: post
title: Measuring web page Performance
date: "2016-01-13 03:42"
tags: [performance-testing]
permalink: /2016/01/13/navigation-timing-user-experience/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on navigation-timing-user-experience"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how can we measure a web page performance. As a part of SLA , when we need to measure performance for application , we need to know page performance. It will help to calculate Business SLA before finalizing project.
This is actually continuing post for measuring performance for Business/Application SLA for a page. You may visit my previous [**post**](http://shantonusarker.blogspot.co.uk/2015/11/formulate-performance-sla-baseline.html) for know more background. In here I will measure only timing.

## What is Browser Navigation Timing?

When a client( i.e browser) go to an URL , then there are certain request processing happens in background, like request goes to gateway,(local network) then go to DNS, then resolver, then resolve and goto to destination, each layer request and technological etc. I am avoiding detail as this post intend to know timing only. As this transformation is common for all web pages , w3c provide specification for each event. W3C also has specific definition & distribution for navigation timing. 

***Ref*** : [navigation](https://www.w3.org/TR/navigation-timing/) & [publications](https://www.w3.org/wiki/Web_Performance/Publications). 
##### Summary of the references: 
Page navigation performance timing consist of following items **navigationStart , unloadEventStart , unloadEventEnd, redirectStart, redirectEnd, fetchStart, domainLookupStart, domainLookupEnd, connectStart , connectEnd , secureConnectionStart , requestStart, responseStart, responseEnd, domLoading, domInteractive, domContentLoadedEventStart,domContentLoadedEventEnd, domComplete, loadEventStart, loadEventEnd**

And, each client (a browser) will get those via a common interface **PerformanceTiming** , which should be implemented by different browser to show those timing.

Most of modern browser implemented this. Here is the screen shot from IE11 & Chrome. (open browser tool and type **window.performance** in console, you can see following)

![ie11-nav](/images/navigation-timing/IE-11-tool.jpg)

![chrome-nav](/images/navigation-timing/Chrome-timing.jpg)

For detail understanding, you may visit google [**chrome dev**](https://developer.chrome.com/devtools/docs/network#resource-network-timing). This is the gist.

![time-distribution](/images/navigation-timing/resource-timing-overview.png)

For SLA, we may not need this broken time details, so we if we calculate Total primarily , it should be comprehensive. This detail info is helpful when we need to know breakdown analysis.

## APDEX  
There was a movement regarding Application Performance Index for applications among companies. This values refers to user satisfaction based on usages of the application. In short, Apdex refers to a value from 0-1 where higher value means full satisfaction. Simple formula

- Apdex = (Satisfied Count + Tolerating Count / 2) / Total Samples

**Example** :  Let's assume collecting 10 samples from an application where SLA was 5s.5 samples were below SLA(5s) , 3 samples are 5-8s, 2 samples are 8s+. So, 
- Apdex = (5+3/2)/10 = 0.65

**Note** : Apdex can also be measured page wise, transaction etc wise specifically . 

More detail you can find
1. [apdex](http://www.apdex.org/)
2. [apdex-wiki](https://en.wikipedia.org/wiki/Apdex)

Now, let's see some method to measure these timing.

## Measuring inside a browser :

### Use Browser Tools :

All major browser has this, like chrome, IE11 or Firefox, if you press F12 or select developer tools you can see developers tool. In there, if you click network tab, you can easily see each request with time distribution.

- Chrome :

![chrome-timeline](/images/navigation-timing/Chrome-Tools.jpg)

- IE :

![ie-timeline](/images/navigation-timing/IE-11-tool.jpg)

- Firefox : (browser tools + Firebug)

![firefox-timeline](/images/navigation-timing/FF-Tools.jpg)


### Use Browser Plugins/Addons : 
To make life easier , many developer community made browser plugins to get these timing easily. That means, beside browser tools, we can get those time using plugins or addons.

#### Performance Analyzer : 
Addon available for Firefox & Chrome, single click all summary with charts.

![Performance-Analyzer](/images/navigation-timing/PerformanceAnalyzer.jpg)

Detail report format is [**here**](https://github.com/micmro/performance-bookmarklet).I prefer this due to summary view and very easy for QA, BA or any non technical personal to measure page timing very easily.

Some extra Chrome Addon does similar things :
#### Page performance :

![Page-performance](/images/navigation-timing/PagePerf.jpg)

#### Page Load Time :

![Page-Load-Time](/images/navigation-timing/loadTiming.jpg)

#### Analyze Page Performance :

![Analyze-Page-Performance](/images/navigation-timing/totalPageLoad.jpg)

### By JavaScript in console:
We can run small javascript in browser console and get the navigation timing also(as I mention in basic part). From chrome/IE this is the command if you run
window.performance. You will be able to see full timing. (here is image from firefox)

![js-execution](/images/navigation-timing/js-console.jpg)

### By JS framework : 
It is very mature to have such capability of an web application to get timing inbuilt with application. There are lots of framework & libraries for that. One of them is [**Boomerang**](https://github.com/lognormal/boomerang). It is simple a JS framework that you can use measure time. Again, like as other frameworks, it not only gives navigation timing, it can also give you detail of request processing timing which is very helpful to track down performance bottle knacks.  

### By Jmeter-webdriver sampler 
In Jmeter, we can drive selenium driven test to run browser and measure time. This way we can get time whenever we want , spatially useful when running any performance test in parallel. You can get full details [**here**](https://sarkershantonu.github.io/pages/jmeter-webdriver/) 

### By a Proxy : 
We can also use local proxy to measure the timing when the app is running in a browser. My favorite is fiddler (for windows)

#### Fiddler : 
In fiddler , if we just add our necessary columns , we can monit or measure the timing. To do so,right click and click customize columns, and from collection select session timers, you will see full list of time collection from

![fiddler-1](/images/navigation-timing/fiddler-1.jpg)

![fiddler-2](/images/navigation-timing/fiddler-2.jpg)

I like the overall Elapsed time. If I select that and then we can see traffic captured with total timing (very good to measure time quickly without breakdown all complexity)

![fiddler-overall](/images/navigation-timing/fiddler-overall.jpg)

### By Selenium tests :
#### By Unit test execution time : 
As we see, selenium is driven by unit test runner, it is always easy to add timing flags in unit tests to get the timing. The following ways are useful. 
Junit :

- **Manually** :  We can use manual timers , before test and after test to get the execution time. This consider as least useful as it takes lots of time to add code for each tests.

- **Junit TimeOut** :  We can use timeout parameter inside each test (this timeout in MS) 
        
        @Test(timeout=100)

- **Junit @Rule** : If you use Junit 4.12, then you can use stopwatch. Its simply done by making with @Rule. I am adding small experiential test class

```java
public class TestForStopWatch {
     @Rule
     public Stopwatch stopwatch = new Stopwatch() {
         @Override
         protected void succeeded(long nanos, Description description) {
             print(description, "succeeded", nanos);
         }
         @Override
         protected void failed(long nanos, Throwable e, Description description) {
             print(description, "failed", nanos);
         }
         @Override
         protected void skipped(long nanos, AssumptionViolatedException e, Description description) {
             print(description, "skipped", nanos);
         }
         @Override
         protected void finished(long nanos, Description description) {
             print(description, "finished", nanos);
         }
     };
    @Test
    public void test() throws InterruptedException {
        long delta = 10;
        Thread.sleep(100L);
        assertEquals(100d, stopwatch.runtime(TimeUnit.MILLISECONDS), delta);
        Thread.sleep(900L);
        assertEquals(1000d, stopwatch.runtime(TimeUnit.MILLISECONDS), delta);
    }
     private static void print(Description description, String status, long nanos){
         System.out.println("Test -> "+     description.getMethodName()+" : Status "+ status+"Timeout : -> "+ TimeUnit.NANOSECONDS.toMicros(nanos));
     }
}
```

And in the output you can see test passed & printing in command line about tests.

![rule-output](/images/navigation-timing/rule-output.jpg)

From **test()**, you can see I wait 100ms, then compare stopwatch time (which prints) and assert the time . Doing the same thing again. Firs validation 100ms wait, and then 1000ms wait(100+900). 

- **Junit Benchmark @Rule** : This is small junit based benchmark library to run benchmark like full performance tests. Resource can be found here. This also use **@Rule**. And this is very simple like as stopwatch implementation.
I am adding very small example.

```java
public class JunitBenchmarkTests extends AbstractBenchmark{
    @After
    public void tearDown() throws Exception {
    }
    @Test
    public void test() throws InterruptedException {
        Thread.sleep(20);
    }    
    @BenchmarkOptions(benchmarkRounds=10,warmupRounds=1, concurrency=3 )
    @Test
    public void testWithBenchMark() throws InterruptedException {
        Thread.sleep(20);
    }
} 
```

please see the command line information regarding performance test exertion  

![junit-benchmark](/images/navigation-timing/junit-benchmark.jpg)

From here, we can see, like as regular performance test, we can include thread number, iteration inside tests and measure timing. Very useful when you are testing API level test. you may see this blog for more [**details**](https://sarkershantonu.github.io/2017/01/08/junit-benchmark/)

#### By running JavaScript in Selenium : 
As we know, we can run JavaScript in selenium, so if we run navigation timing scripts in web driver, we can easily get the all type of timing. Here is one single helper class **NevigationTimeHelper** which takes a driver and get all timing.

```java
public class NevigationTimeHelper {
    private WebDriver driver = null; 
    Map<String, Object> timings = null; 
    private final String JavaScriptForPerformance = "var performance = window.performance || window.webkitPerformance || window.mozPerformance || window.msPerformance || {};var timings = performance.timing || {};return timings;"; 
    public NevigationTimeHelper (WebDriver adriver){
        this.driver = adriver; 
        getAllTiming();
    }
    private void getAllTiming(){
        JavascriptExecutor jsrunner = (JavascriptExecutor) driver;
        timings = (Map<String, Object>) jsrunner.executeScript(JavaScriptForPerformance); 
    }
    private Long getAnTime(String name){       
        return (Long)timings.get((Object)name);     
    }
    public Long getnavigationStart(){        
        return getAnTime("navigationStart");    
    }
    public Long getunloadEventStart(){        
        return getAnTime("unloadEventStart");    
    }
    public Long getunloadEventEnd(){        
        return getAnTime("unloadEventEnd");    
    }
    public Long getredirectStart(){        
        return getAnTime("redirectStart");    
    }
    public Long getredirectEnd(){        
        return getAnTime("redirectEnd");    
    }
    public Long getfetchStart(){       
        return getAnTime("fetchStart");    
    }
    public Long getdomainLookupStart(){        
        return getAnTime("domainLookupStart");    
    }
    public Long getdomainLookupEnd(){        
        return getAnTime("domainLookupEnd");    
    }
    public Long getconnectStart(){        
        return getAnTime("connectStart");    
    }
    public Long getconnectEnd(){        
        return getAnTime("connectEnd");    
    }
    public Long getsecureConnectionStart(){        
        return getAnTime("secureConnectionStart");    
    }
    public Long getrequestStart(){        
        return getAnTime("requestStart");    
    }
    public Long getresponseStart(){        
        return getAnTime("responseStart");    
    }
    public Long getresponseEnd(){        
        return getAnTime("responseEnd");    
    }
    public Long getdomLoading(){        
        return getAnTime("domLoading");    
    }
    public Long getdomInteractive(){        
        return getAnTime("domInteractive");    
    }
    public Long getdomContentLoadedEventStart(){        
        return getAnTime("domContentLoadedEventStart");    
    }
    public Long getdomContentLoadedEventEnd(){        
        return getAnTime("domContentLoadedEventEnd");    
    }
    public Long getdomComplete(){        
        return getAnTime("domComplete");    }
    public Long getloadEventStart(){        
        return getAnTime("loadEventStart");    
    }
    public Long getloadEventEnd(){        
        return getAnTime("loadEventEnd");    
    }
}
```

Here we see, as window.performance gives a MAP type collection, so we have collect all measurement and parse/select as we need. So, I put each type in separate function name to keep things simple.  

I avoid other unit test platforms like Nunit , MS Unit, Xunit for dotnet to make things simple. Each unit test runner has its own implementation to measure time

#### Browser MOB proxy with selenium :
If we have existing selenium script, we can use [**BrowserMOB proxy**](https://github.com/lightbody/browsermob-proxy) to measure time. This is very simply done by keeping webdriver running under proxy and we can get every performance measurement including in page JS execution time(if that is called by you selenium tests). Even you can store navigation timing detail as HAR(http archived file) to analysis further detail after tests. I will add separate posts on how to use browserMOB. 

There are also APM tool vendors who provide these monitoring ,i will provide separate blog on APMs for this topic. 

Thanks :)


