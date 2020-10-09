---
layout: post
title: Introduction to Junit Benchmark
date: "2017-01-08 02:54"
tags: [junit, performance-testing]
permalink: /2017/01/08/junit-benchmark/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Junit Benchmark"
gh-badge: [star, follow]
comments: true
---
In this article we are going to see how to use Junit Benchmark where can we perform small performance tests on existing unit tests. 

### What is Junit benchmark? 
Junit Benchmark is a library for running your unit tests by multi threads. It has simple annotation to support this type of execution. It usages Junit Rule to drive multi threaded execution. 

So, idea is simple, if you use the rule and use the annotation you can easily benchmark a test method.

You can apply this tests for Java 6,7,8. For Java 9, this has already accepted and part of JDK tool library as [**JMH**](http://openjdk.java.net/projects/code-tools/jmh/). 

### Example : 

Lets see an example to know  how to use. I am using a simple Calculator class with following methods. 

```java
public class Calculator {
    public double add(double a, double b){
        return a+b;
    }
    public double sub(double a, double b){
        return a-b;
    }
    public double mul(double a, double b){
        return a*b;
    }
    public double div(double a, double b){
        return a/b;
    }
    public double mod(double a, double b){
        return a%b;
    }
}
```

In the project , I add this dependency for junit benchmark along with other dependencies.  

```xml
<dependency>
    <groupId>com.carrotsearch</groupId>
    <artifactId>junit-benchmarks</artifactId>
    <version>0.7.2</version>
</dependency>
```

And, I have wrote a unit test for subtract method.
```java
@Test
public void testSub(){
    Assert.assertEquals(-5.0, aCalculator.sub(10.0,15.0), 0.01);
}
```

# How to use it?

### Step 1 : Add this Rule in your test class.
```java
@Rule 
public TestRule benchmarkRun = new BenchmarkRule();
```
### Step 2. Use this annotation before your junit tests.
```java
@BenchmarkOptions(concurrency = 2, warmupRounds = 0, benchmarkRounds = 5)
```

And thats it. If you run, it will run your test with 2 concurrent threads.

Now, let's see what we have done with benchmark options. You can there are 3 parameters

- concurrency(a number) = How many threads you want to use your test to be executed.

- warmupRounds (a number)=> how many time you run the test to initialize your environment. How many threads you want to run before actual test starts. This is very important for testing stand point. Usually JVM based application need some initial time to start the process and JVM. So, you can add one or two threads to keep it realistic on timing that you observe. These rounds wont be calculated but, after the worm up round, you will get the timing with running environment.

- benchmarkRounds (a number) = How many iterations you want to run? 

If you are jmeter user, you may experienced similar parameters in thread groups.

Now, in test case I put some thread delay to see my test running as the test is very small so, it will run very fast. After adding some delay, the test case becomes.
```java 
public class PerfTest {
    protected Calculator aCalculator = null;
    @Before     
    public void init(){
        aCalculator = new Calculator();
     }     
    @Rule     
    public TestRule benchmarkRun = new BenchmarkRule();
         
    @Test 
    @BenchmarkOptions(concurrency = 2, warmupRounds = 0, benchmarkRounds = 5)
        public void testSub(){
        Assert.assertEquals(-5.0, aCalculator.sub(10.0,15.0), 0.01);
 
//optional delays         
    try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }    
    }
}
```
And , if we run as Junit test from IDE, we can see this in output window (default logging) 
![ide-junit](/images/junit-benchmark/junit-perf-running-ide.jpg)

### Alternative ways to use : 
A. You can extend any of your test class from AbstractBenchmark. Like
```java
public class TestCalculator extends AbstractBenchmark {} 

```

This AbstractBenchmark has this BenchmarkRule .

B. You can  also do that by your own base class with test rules and all testing parameters. I have one example for base class having test rule
```java 
public abstract class Benchmarking {
    protected Calculator aCalculator = null;     
    @Rule     
    public TestRule benchmarkRun = new BenchmarkRule();     
    @Before 
     public void init(){
            aCalculator = new Calculator();
        }
}
```
- And a test class extending that.

```java 
public class PerfTest_custom extends Benchmarking {
     
@Test 
@BenchmarkOptions(concurrency = 2, warmupRounds = 0, benchmarkRounds = 5)
    public void testSub(){
        Assert.assertEquals(-5.0, aCalculator.sub(10.0,15.0), 0.01);
        //To run the test slow enough to see it running         
     try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
```

Example parameters :
```java
@BenchmarkOptions(warmupRounds = 1,concurrency = 20, benchmarkRounds = 10)
```

It will run :
1. Single iteration for worm up,
2. Then 20 threads will run the tests
3. The threads will continue for 10 times. 

So, Total it will run 20x10+1=401 times.

To validate number of current thread, we can use **Thread.activeCount()** inside test function to print current thread number .

We can actually use this annotation in both method level as well as class level.
 A class level annotation actually apply for all test methods. where a method level annotation will override class level annotation if we use together.

### Class level example :
```java 
@BenchmarkOptions(concurrency = 2, warmupRounds = 2, benchmarkRounds = 20)
public class TestCalculator extends AbstractBenchmark {
    private Calculator aCalculator = null;
    @Before     
    public void init() {
        aCalculator = new Calculator();
    }
    @Test     
    public void testAddition() {
        Assert.assertEquals(25.0, aCalculator.add(10.0, 15.0), 0.01);
    }
    @Test     
    public void testSub() {
        Assert.assertEquals(-5.0, aCalculator.sub(10.0, 15.0), 0.01);
    }
}
```

### Method Level Example :

```java
public class TestCalculator_MethodLevelExample extends AbstractBenchmark{
    protected Calculator aCalculator = null;     
    @Before     
    public void init(){
        aCalculator = new Calculator();
    }
    @Test 
@   BenchmarkOptions(concurrency = 6, warmupRounds = 1, benchmarkRounds = 50)
    public void testAddition(){
        Assert.assertEquals(25.0, aCalculator.add(10.0,15.0), 0.01);
    }
    
    @Test 
    @BenchmarkOptions(concurrency = 8, warmupRounds = 0, benchmarkRounds = 100)
    public void testSub(){
        Assert.assertEquals(-5.0, aCalculator.sub(10.0,15.0), 0.01);
    }
}
```
Now, this class in my repository has some extra item with it for reporting and testing delay purposes. We will see those later.

# Result Storing & Reporting :   

This is common practices to show results of performance testing as report. Beside showing results in command line, junit benchmark has inbuilt capabilities to store your test results in H2 or mysql database. I will show examples with H2 Database. For this

- Step 1 : I am adding H2 database in my project POM.XML

```xml
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <version>1.4.192</version>
</dependency>
```

- Step 2 : Put all Property information in jub.properties and load them before test. I am using my own base test case to load before class. 

```java
@BeforeClass 
public static void loadProperties() throws IOException {
    Properties p = new Properties();
    p.load(new FileInputStream(new File("src/test/resources/jub.properties")));
    for(String k:p.stringPropertyNames()){
        System.setProperty(k,p.getProperty(k));
    }
}
```

Defined properties are :

        jub.ignore.annotations=false 
        jub.ignore.callgc=true 
        jub.consumers=CONSOLE,H2 
        jub.db.file=charts/.benchmarks
        jub.charts.dir=charts
        jub.customkey=AddBenchMark

*You may see in my [repository](https://github.com/sarkershantonu/Automation-Getting-Started/blob/master/junitbenchmark/src/test/resources/jub.properties) about other properties which can be added.
So, we can see, the chart will be created in a chart folder under working directory (not maven build directory)

- Step 3 : Adding reporting annotation in the tests: There are 3 annotations in test class level:

        @AxisRange(min = 0, max =1)
        @BenchmarkMethodChart(filePrefix = "benchmark-lists2")
        @BenchmarkHistoryChart(labelWith = LabelType.RUN_ID, maxRuns = 20)

- @AxisRange : It represent axix information of the graph that is shown. We can add min & max values.
![report-method](/images/junit-benchmark/junit-perf-report.jpg)

- @BenchmarkMethodChart : It we provide name of the report that will be generated.

- @BenchmarkHistoryChart : It is used for telling how many history results will be included in DB and results. maxRun will be how many times and label with provide options to include different type of label in each entry. I have added Run ID as label. We can add TIMESTAMP and our own CUSTOM_KEY. This CUSTOM_KEY should be included in the jub.properties. 
Here is the example, as you saw from my property, the custom key was 
    
        jub.customkey=AddBenchMark
- So, in the report , i can see also this
![report-perf-test](/images/junit-benchmark/junit-perf-report-default.jpg)

- After running several rests , my chart folder looks like this.
![report-structure-perf-test](/images/junit-benchmark/junit-perf-report-structure.jpg)
 
In here the jsonp file contains results as json type object. You can also parse this to show with your json based live dashboard (like grafana).

### Where to use this ? 
1. You have your unit tests, use this to know your concurrency state performance.
As this is unit level performance, this will not prove concurrent user actions but, it can prove concurrent request processing.
So, when you have Strict SLA , use this to validate throughput. 
This type of test is not suitable for Response Time SLAs as this is not user time. 
And , important factor, error rate or error tolerant. This type of test can ensure (mostly) about server's error possibility. 

2. You have functional integration tests which validates backend request. Like DB request, web service calls via UI layer. 
you can use this to to test before actual tests for performance. This will help you to know how system behaves when they are integrated .
Some time it is very useful to run with manual tests in QA environment.
A number of parallel request is going on while a manual tester is testing application UI behavior. 
   
3. Mission critical/Business critical data concurrency tests can be easily done by this. 
Example, business transaction data concurrency testing for a banking or financial domain. This can validate data integrity when concurrent requests are in place in the system. (Synchronization, locks etc)
   
4. simulate thread deadlock scenario 

5. simulate OOM scenario

6. Testing individual component, tire, request for Throughput and Error%

7. Simulate Required Resource Capacity scenario.

Note : While running the tests, make sure of resources that you are using in the test which will be affected by concurrency. Usually DB connections, file handlers, open ports, created sessions etc should be taken care properly for testing this way. 


# [Source](https://github.com/sarkershantonu/Automation-Getting-Started/tree/master/junitbenchmark)

# [Main project](http://labs.carrotsearch.com/junit-benchmarks-tutorial.html)


Thanks.. :)