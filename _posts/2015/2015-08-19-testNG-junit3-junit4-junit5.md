---
layout: post
title: Compare study : Junit & TestNG
date: "2015-08-19 13:28"
tags: [java,junit,testng]
permalink: /2015/08/19/junit-testng/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java Unit Testing"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see learn about TestNG, JUnit3,JUnit4 & JUnit5 by Comparison. Initially this was posted only Junit3,4 & test NG. But I have updated with Junit5(2020)

# Basics 
All of them are Java  unit testing frameworks. And all of them has builtin test runners , assertion utilities, test organization technique as well as extensibility. Some also have reporting capability. 

But, as junit grows from old generation to newer generations, many of its mechanism has evolved. And TestNG was introduced in between parallel to Junit to overcome some of testing needs. 

All of them are commonly use different ways of testing. I wont be talking about in detail differences but, we will talk about more or less overall functionality with comparison. 

# Compare 

| NO | Topic |Junit3|Junit4|Junit5|TestNG|
|-------|-------|-------|-------|-------|-------|
|1|Test Declaration|testXXX pattern |@Test|@Test|@Test|
|2|Run a method Before each Test|setUp()|@Before|-|@BeforeMethod|
|3|Run a method after a each Test Method|tearDown()|@After|-|@AfterMethod|
|4|Ignoring a test|Remove/Comment|@ignore|-|@Test(enabled=false)|
|5|Run a method before a Test Class|-|@BeforeClass|-|@BeforeClass|
|6|Run a method after a Test Class|-|@AfterClass|-|@AfterClass|
|7|Run a method before a declared in ```<test>``` tag in xml |-|-|-|@BeforeTest|
|8|Run a method after a declared in ```<test>``` tag in xml |-|-|-|@AfterTest|
|9|Runs a method before a suite|-|-|-|@BeforeSuite|
|10|Runs a method after a suite|-|-|-|@AfterSuite|
|11|Runs a method before a group (XML)|-|-|-|@BeforeGroups|
|12|Runs a method after a group (XML)|-|-|-|@AfterGroups|
|13|Exception Checking|explicitly call fail & then assert in catch block|@Test(expected = <Name of the Exception>.class) or using @Rule ExpectedException |Using Exception in an Executable functional interface |@Test(expectedExceptions = ExceptionClassName.class)|
|14|Timeout for test execution|-|@Test(timeout = 1000)|-|@Test(timeout = timeoutinmilisecond)|
|15|invoke threads to run test in parallel|-|-|-|@Test(threadPoolSize = threadNumber)|
|16|always runs a test method(ignores dependent tests)|-|-|-|@Test(alwaysRun=true)|
|17|specify test groups |-|-|-|@Test(groups = Name of the group specified in XML)|
|18|Description|-|-|-|@Test(description=The description for the tests)|
|19|Repeat Same test|-|-|-|@Test(invocationCount=integer)|
|20|Repeat Test Timeout|-|-|-|@Test(invocationTimeOut=)|
|21|Prioritizing tests|-|-|-|@Test(priority=integer)|
|22|Defining Expected success percentage|-|-|-|@Test(successPercentage=integer)|
|23|Single Thread Test Execution|-|-|-|@Test(singleThreaded=true)|
|24|XML Data provider for a test|-|-|-|@Test(dataProvider=NameOfProvider)|
|25|Data provider Class for a test|-|-|-|@Test(dataProviderClass=DataProviderClassName.class|
|26|Run test with all dependents methods|-|-|-|@Test(dependsOnMethods=Name of all methods)|
|27|Run test with all dependents methods from all dependent groups|-|-|-|@Test(dependsOnGroups=Name of all Groups)|
|28|Defining Test Runner/Class|-|@RunWith(ATestRunner.class)|-|-|
|29|Defining test classes in a suite classe|-|@SuiteClasses|-|-|
|30|Data Provider with Object[][]|-|@DataProvider from [TNG](https://github.com/TNG/junit-dataprovider)|-|@DataProvider|
|31|Add test parameter|-|@TestWith by [zohhak](https://github.com/piotrturski/zohhak)|-|-|
|32|Define Rules for test |-|@Rules|-|-|
|33|Fixing ordering of test execution at class level|-|@FixMethodOrder|-|-|
|34|Define Rules for test classes|-|@ClassRule|-|-|
|35|Alternative @test method run as theories by assumptions|-|@Theory|-|-|
|36|Multiple Data Input for theories|-|@TestedOn|-|-|
|37|iterable of data points in array|-|@DataPoints|-|-|
|38|Assign of a data point(field/method)|-|@DataPoint|-|-|
|39|Parametersupplier provided values as test data in @Theory|-|@ParametersSuppliedBy|-|-|
|40|Parameter of @Theory declared as @datapoints and will be selected by this|-|@FromDataPoints|-|-|
|41|Categorize a test/class|-|@Category|-|-|
|42|Validate any test method using annotationValidator(use in your custom annotation)|-|@ValidateWith|-|-|
|43|Test data field annotation|-|@Parameter|-|-|
|44|Test data in a iterable collection|-|@Parameters|-|@parameters={arrayOfStrings}|
|45|Runs only Categorized classes and methods|-|@IncludeCategory|-|-|
|46|Exclude classes and methods that are not annotated with either the category or given with this|-|-|-|-|
|47|Defines a listener in a test class|-|-|-|@Listeners|
|48|factory that returns Test classes objects|-|-|-|@Factory|


I hope, this will give basic idea to start testing with these unit test framework. I will provide separate post on how to organize & plan your tests with these test frameworks.
