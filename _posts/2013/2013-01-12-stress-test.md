---
layout: post
title: What is Stress Testing?
date: "2013-01-12 03:06"
tags: [performance-testing]
permalink: /2013/01/12/stress-testing/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
![image](/images/performance-testing/load/stress-testing.jpg)

In this article we are going to have some basic idea on What is stress testing?And some basic steps on how to do it. 

In here, I am just describing my understanding. It may varies from others. It will be very nice if you comment on this. 

In the software world, stress testing refers to the process to determine the ability of doing the functionality by the software under unfavorable conditions. 

In a simple word, stress testing observes how software works under stressful conditions. It is one kind of performance testing.

The main idea is to provide stress to a system up to the breaking point in order to find bugs that will make the system unstable. Usually the system is not expected full functional but should behave in accepted manner. 

## Stress testing Goals 
- To determine System’s , robustness, availability, reliability under extremes conditions.
- To identify application issues (or working capability/bugs) that arises only on extreme condition
- To find synchronization bugs (data post/get)
- To find timing bugs(slow response), 
- To find interlock problems
- To find priority problems (slow to determine priory tasks) 
- To find resource loss (data/instructions)
- To find the recover-ability of the system on failure conditions  
- To find vulnerabilities on stressful conditions. (Ex-Stress testing on Authentication)

## Why Applications need Stress testing?
All application project don't need stress testing. When ever we need following, we have to perform stress testing. 
- To get the breaking point of the system
- To get the maximum capability for specification.
- To define the behavior/functionality at the maximum capability specifications
- To determine the age of the software in market(Optional for a web application that interact with users)

## When ?
Usually we do stress testing after alpha release, that means, before going to user. Typically while in the development phage , stress testing can provide interesting bugs in following cases
- Data is lost or corrupted.
- Resource uses remains unacceptably high 
- Application components fail to respond.
- UN-handled exceptions are presented to the end user

## Scenarios of stress testing 
Usually stress scenarios should contain these following things.
- heavy loads(number of users),
- high concurrency(Maximum data handling or transferring)
- limited computational resources (Limited memory/processor/bandwidth)

#### Sample Scenarios : 
- DoS(denial of service) attack, a situation like where a widely viewed news item viewed by a large number of users in a Web site during a two-minute period.( Excessive volume of either users or data)
- Resource reduction such as a disk drive failure/memory failure/Processor busy. A situation when resource(processor/memory) is occupied by others on the server.
- Unexpected sequencing. A situation that performs the way which is costly (more time and resource hungry)
- Unexpected outages/outage recovery. A situation where application riches to its maximum capability of support and performs defined tasks under defined scopes. 

##### Example
while deploying our application on a server that is already running a processor-intensive application. Here, the application is immediately “starved” of processor resources and must compete with the other application for processor cycles. We can also stress-test a single Web page or even a single item such as a stored procedure or class or particular method(function).

Scenarios are usually divided into following types:

#### Application stress :   
This type of test typically focuses on more than one transaction on the system under stress (without the isolation of components). 

##### Target:  
Finding defects related to 
- Data locking and blocking, 
- Network congestion, and 
- Performance bottlenecks (On different components or methods across the entire application). Because the test scope is a single application, it is common to use this type of stress testing 

##### When : 
- After a robust application load-testing effort.
- As a last test phase for capacity planning
- Generally in the necessity to find defects related to race conditions /general memory leaks from shared code or components.

#### Transactional stress: 
Usually it aims at working at a transactional level with load volumes that go beyond production operations. These tests are focused on validating behavior under stressful conditions. (EX- high load with the same resource constraints for the entire application). 

##### Target: 
- To isolate an individual transaction, or group of transactions
- To have specific understanding of throughput capacities and other characteristics for individual components.

##### When : 
- We need tuning, optimizing the application
- We have to find error conditions for a specific component level. 

#### Systemic stress: 
This type of testing is also known as integration stress testing or consolidation stress testing. Usually this test generates stress/extreme load on targeted application with multiple applications running on the same system, thereby pushing the boundaries of the applications’ expected capabilities to an extreme 

###### Target : 
- To get defects in situations where different applications block one another and compete for system resources (memory/ processor /disk space/bandwidth). 

###### When 
- We need to specify the application behaviors in extreme conditions
- We need to specify the impact to the system from our application under extreme conditions

###### Notes : 
- In large-scale usually stress testing all of the applications together in the same consolidated environment.
- Some organizations choose to perform this type of testing in a larger test lab facility or hardware or software vendor’s assistance.

## Steps for stress testing? 
### Step 1. Gather Information: 
- Application usage characteristics (scenarios)
- Concerns about those scenarios under extreme conditions
- Workload profile characteristics
- Current peak load capacity (obtained from load testing)-This is not mandatory for all cases
- Hardware and network architecture and data(for better scenario generation)
- Disaster-risk assessment (Application general expected behavior on failure)
- Results from previous stress tests(For comparing or benchmarking)

### Step 2. Define Goals:  
We have to identify the objectives of stress testing (Why we are testing?).
- Finding the ways the system can possibly fail suddenly in production
- Getting helpful information(number of users, volume of Data, amount of resource use, amount of times etc) to the development team to build defenses against catastrophic failures
- Measure how the application behaves (User Interactions, basic functionalities, data correctness etc) when system resources are depleted
- Ensure functionality does not break under stress.(proofing the system)

### Step 3. Define scenarios:  
We have to identify the scenario/cases that need to be stress-tested. It should be dependent on different version so that we can compare at any point of a software development life cycle. We should keep following in mind to define scenarios 
- How critical they are on overall application performance
- Effects on the system (intensive locking and synchronization, long transactions, disk-intensive (I/O) operations)
- Affected areas based on Load testing reports

#### Example
Updating inventory in a order processing scenario.  User activity & interest specific search results, Memory overflowing queries like calling entire table etc 

### Step 4. Define workload:  
We have to define the workload for a particular scenario based on the workload and peak load capacity inputs. The key is to systematically test with various workloads, until we create a significant failure. The steps should be 

- **Define work distribution**:  Define the work to be done (steps to do) under each key scenario .Usually it is based on the number and type of users inside the scenario during the test.
- **Define Peak Load**:  Define the maximum expected number of users for load at peak. We should define the % of user load for each key scenario. 

There is another way to express this. We can use inverse % of use. That means, we will define % of user free for a key scenario so that those free user can be define for other scenarios. This is helpful while calculation

**Note**: Workload must represent the accurate and realistic test data (Ex- type and volume/different user logins/product IDs/product categories etc.) that allows us to simulate important failures ( deadlocks/ resource consumption).

### Step 5. Make metrics:  
We have to make a metrics for data collection for application’s performance Based on the scenarios (potential problems) identified in the Goal section.  

The metric is focused on 
- how (well/poorly) our application is performing in compared to our performance objectives.
- define problem areas and bottlenecks within application.

In case of making Matrices, if we consider following bold items(part of our scenario for measurement), we also should include the indent items as sub items for the measurement procedure. 

#### Processor: 
- Processor utilization
- Processor responses

#### Memory : 
- Memory available
- Memory utilization

#### Disk :
- Disk utilization
- Disk responses

#### Network:
- Network utilization
- Network Bandwidth

#### Process: 
- Memory consumption
- Processor utilization
- Process recycles

#### Transactions/business metrics:
- Transactions/sec
- Transactions succeeded
- Transactions failed

#### Threading: 
- Contentions per second
- Deadlocks
- Thread allocation

#### Response times
- Transactions times

**Notes** : Matrices should be related to performance and throughput goals. providing information about potential problems

### Step 6. Create test cases: 
We need to create the test cases in which we can define steps for running a single test. 

Each test case should mention the expected results and/or the key data of interest to be collected (for analysis/report), in such a way that each test case can be marked as a “pass,” “fail,” or “inconclusive” after execution. 

##### Example : 
- **Title** : Stress on Successful Log In
- **Load**: 1,000 simultaneous users.(How many user will hit the site in a Time Unit)
- **Time**:  5 seconds. Time to simulate load user (usually 1-10 second, for say 5 seconds)
- **Duration**: 5 hours (How long the test will run )
    
#### Expected results:
- Application process should not recycle because on deadlock/resource consumption.
- Throughput should not be below 20RPS (requests per second).(Depend on your application requirement)
- Response time should be less than 2000 MS (Up to 90% of a total transactions completed)
- “Server busy” errors/HTTP errors should not be more than 10% of the total response (For related issues)
- Log in should not fail during test execution. Log in session count should match with the Successful Log In count.
- After log in Information should be handled properly on the web sites/application.(data integrity) 

### Step 7. Simulate load: 
We have to use tools to generate load for each test case and capture the metric data results. Before starting, 
- Validate that the test environment matches the configuration that we are have designed your test for.
- Ensure that both the test and the test environment are configured correctly for metrics data collection. 

##### Note : 
- We may perform a quick “smoke test” to ensure the test script and remote performance counters are working correctly.
- We may reset the system (unless your scenario needs) and start a formal stress test execution.

### Step 8. Analyze Results:  
We have to analyze the metric data captured during the test up to expected level. On a failed scenario we may have to do 
- A design/Architecture review.
- A code / Unit Test Review
- Re-Run failed stress tests in under Debugging facility

### Step 9.Deliver Reports : 
Typically a stress testing efforts requires reports to be generated after testing. That reports should be presented in a Visual manner (with different type of charts). 

This reports may include comparison charts with previous test results. A standard delivery report should identify the bottlenecks as well as defined failed scenarios (bugs). 

### Stress tools :(some) 
- JMeter
- WAPT/WAPTPro
- Load UI
- Load Runner
- Visual Studio Load test 
- Solex
- Test Complete
- Web load
- Neo Load
- WCF Load(only services)
- SOASTA
- The Grinder  
- Eclipse Load test tool 

Thanks...:)...
