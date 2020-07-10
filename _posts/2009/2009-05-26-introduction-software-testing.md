---
layout: post
title: Introduction to software testing
date: "2009-05-26 14:46"
tags: [testing]
permalink: /2009/05/26/introduction-software-testing/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Introduction to software testing"
gh-badge: [star,follow]
comments: true
---
Testing for Beginners contains some of bookish definitions which we need to know before starting career as tester.   

### Software quality: 
Quality software is reasonably bug-free, delivered on time and within budget, meets requirements and/or expectations, and is maintainable. Some common quality attributes are stability, usability, reliability, portability, and maintainability. Quality is "Meeting customer's needs and requirements".

### QA : 
QA means Quality Assurance. The process of any industry that ensures the quality of the products of that Industry. QA refers the Assurance of the "Meeting customer's needs and requirements" for a particular product.

### SQA : 
SQA means the software quality assurance. The process of software industry for making software’s of that industry "Meet the customer's needs" is called QA. That means SQA process make the software perfect( defect free). Usually SQA use testing to make software error free.

### Test :
It is a process of exercising software to verify that it satisfies specified requirements(may be user provided) and to detect errors. The process of analyzing a software item to detect the differences between existing and required conditions (that is, bugs), and to evaluate the features of the software item (Ref. IEEE Std 829).Testing involves operation of a system or application under controlled conditions and evaluating the results Testing should intentionally attempt to make things go wrong to determine if things happen when they shouldn't or things don't happen when they should. It is oriented to 'detection'.
- Software testing is a process that identifies the correctness, completeness, and quality of software. Actually, testing cannot establish the correctness of software. It can find defects, but cannot prove there are no defects.
- It is a systematic analysis of the software to see whether it has performed to specified requirements. What software testing does is to uncover errors however it does not tell us that errors are still not present.

### Kinds of Testing:  

#### Dynamic testing: 
Required program to be executed ,Verification and validation performed by executing the system code.

#### Static testing: 
Does not involve program execution.Verification performed with out executing the system code .The program is run on some test cases & results of the program’s performance are examined to check whether the program operated as expected.

##### Example : 
Compiler task such as Syntax & type checking, symbolic execution, program proving, data flow analysis, control flow analysis

##### Purposes:
1. Finding defects and measuring quality in terms of defects.
2. Building confidence.
3. Preventing defects.
4. Reducing risk.

### Testing Levels/Priorities: 
(Not any thing like standard) 
1. Critical
2. High
3. Medium 
4. Low 
5. Cosmetic

##### Advantages:
1. Finds defects early in the Software Development Life Cycle.
2. Gains confidence about the quality
3. Provides information of products (Step by step).
4. Prevents defects.

##### Disadvantages:
1. Extra time required for product that assigned less time on other processes.
2. Extra Man-Power involving increases product costing.
3. Sometime personal problems may occur( for communication & EGO)
4. Testing can find the errors in software but it can’t make the software error free.

### Differences Between QA And QC.
- QUALITY CONTROL measures the quality of a product. It finds out gaps between customer's requirements and system to be delivered. Mainly TESTING means “Quality Control
- QUALITY ASSURANCE measures the quality of processes used to create a quality product. It meets customer's needs and requirements

### Standard SDLC for Modern World:
Software life cycle begins when a software product is first conceived and ends when it is no longer in use. It includes phases like
1. Initial concept,
2. requirements analysis,
3. functional design,
4. internal design,
5. documentation planning,
6. test planning,
7. coding,
8. document preparation,
9. integration,
10. testing,
11. maintenance,
12. updates,
13. re-testing and
14. Phase-out.

### Essentially of Testing:
The Error caused by developer that causes Defects injected in software what makes the Software Failure.

### When we will stop testing:
If we have less time then How can we decide which tests to be done? We can easily do it by Prioritization (Decide what to test first, most, not to do) of tests by following questioners
- Which functionality is most important to the project's intended purpose?
- Which functionality is most visible to the user?
- Which functionality has the largest safety impact?
- Which functionality has the largest financial impact on users?
- Which aspects of the application are most important to the customer?
- Which aspects of the application can be tested early in the development cycle?
- Which parts of the code are most complex and thus most subject to errors?
- Which parts of the application were developed in rush or panic mode?
- Which aspects of similar/related previous projects caused problems?
- Which aspects of similar/related previous projects had large maintenance expenses?
- Which parts of the requirements and design are unclear or poorly thought out?
- What do the developers think are the highest-risk aspects of the application?
- What kinds of problems would cause the worst publicity?
- What kinds of problems would cause the most customer service complaints?
- What kinds of tests could easily cover multiple functionality?
- Which tests will have the best high-risk-coverage to time-required ratio?

### Tests Process:  
1. Test planning and control 
2. Test analysis and design 
3. Test implementation and execution 
4. Evaluating exit criteria and reporting 
5. Test closure activities

### Types of testing:

#### Black box testing 
Not based on any knowledge of internal design or code. Tests are based on requirements and functionality.

#### White box testing 
Based on knowledge of the internal logic of an application's code. Tests are based on coverage of code statements, branches, paths, conditions.

#### Unit testing 
The most 'micro' scale of testing; to test particular functions or code modules. Typically done by the programmer and not by testers, as it requires detailed knowledge of the internal program design and code. Not always easily done unless the application has a well-designed architecture with tight code; may require developing test driver modules or test harnesses.

#### Incremental integration testing 
Continuous testing of an application as new functionality is added; requires that various aspects of an application's functionality be independent enough to work separately before all parts of the program are completed, or that test drivers be developed as needed; done by programmers or by testers.

#### Integration testing 
Testing of combined parts of an application to determine if they function together correctly. The 'parts' can be code modules, individual applications, client and server applications on a network, etc. This type of testing is especially relevant to client/server and distributed systems.

#### Functional testing 
Black-box type testing geared to functional requirements of an application; this type of testing should be done by testers. This doesn't mean that the programmers shouldn't check that their code works before releasing it (which of course applies to any stage of testing.)

#### System testing 
Black-box type testing that is based on overall requirements specifications; covers all combined parts of a system.

#### End-to-end testing 
Similar to system testing; the 'macro' end of the test scale; involves testing of a complete application environment in a situation that mimics real-world use, such as interacting with a database, using network communications, or interacting with other hardware, applications, or systems if appropriate.

#### Sanity testing 
Typically an initial testing effort to determine if a new software version is performing well enough to accept it for a major testing effort. For example, if the new software is crashing systems every 5 minutes, bogging down systems to a crawl, or destroying databases, the software may not be in a 'sane' enough condition to warrant further testing in its current state.

#### Regression testing 
Re-testing after fixes or modifications of the software or its environment. It can be difficult to determine how much re-testing is needed, especially near the end of the development cycle. Automated testing tools can be especially useful for this type of testing.

#### Acceptance testing 
Final testing based on specifications of the end-user or customer, or based on use by end-users/customers over some limited period of time.

#### Load testing 
Testing an application under heavy loads, such as testing of a web site under a range of loads to determine at what point the system's response time degrades or fails.

#### Stress testing 
Term often used interchangeably with 'load' and 'performance' testing. Also used to describe such tests as system functional testing while under unusually heavy loads, heavy repetition of certain actions or inputs, input of large numerical values, large complex queries to a database system, etc.

#### Performance testing 
Term often used interchangeably with 'stress' and 'load' testing. Ideally 'performance' testing (and any other 'type' of testing) is defined in requirements documentation or QA or Test Plans.

#### Usability testing 
Testing for 'user-friendliness'. Clearly this is subjective, and will depend on the targeted end-user or customer. User interviews, surveys, video recording of user sessions, and other techniques can be used. Programmers and testers are usually not appropriate as usability testers.

#### Install/uninstall testing(Deployment) 
Testing of full, partial, or upgrade install/uninstall processes.

#### Recovery testing 
Testing how well a system recovers from crashes, hardware failures, or other catastrophic problems.

#### Security testing 
Testing how well the system protects against unauthorized internal or external access, willful damage, etc; may require sophisticated testing techniques.

#### Compatibility testing 
Testing how well software performs in a particular hardware/software/operating system/network/etc. environment.

#### Exploratory testing 
Often taken to mean a creative, informal software test that is not based on formal test plans or test cases; testers may be learning the software as they test it.

#### Ad-hoc testing 
Similar to exploratory testing, but often taken to mean that the testers have significant understanding of the software before testing it.

#### User acceptance testing 
Determining if software is satisfactory to an end-user or customer.

#### Comparison testing 
Comparing software weaknesses and strengths to competing products.

#### Alpha testing 
Testing of an application when development is nearing completion; minor design changes may still be made as a result of such testing. Typically done by end-users or others, not by programmers or testers.

#### Beta testing 
Testing when development and testing are essentially completed and final bugs and problems need to be found before final release. Typically done by end-users or others, not by programmers or testers.

#### Mutation testing 
 A method for determining if a set of test data or test cases is useful, by deliberately introducing various code changes ('bugs') and retesting with the original test data/cases to determine if the 'bugs' are detected. Proper implementation requires large computational resources

#### Accessibility testing (web)
 A method for testing your software is usable(how many use case passes) for the user with physical disabilities .(It's just a brief)

### Common faults of software:
- **poor requirements** - if requirements are unclear, incomplete, too general, or not testable, there will be problems.
- **unrealistic schedule** - if too much work is crammed in too little time, problems are inevitable.
- **inadequate testing** - no one will know whether or not the program is any good until the customer complains or systems crash.
- **futurities** - requests to pile on new features after development is underway; extremely common.
- **miscommunication** - if developers don't know what's needed or customer's have erroneous expectations, problems are guaranteed.

