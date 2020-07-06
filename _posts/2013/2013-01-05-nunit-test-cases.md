---
layout: post
title: How to write NUnit Test Cases?
date: "2013-01-05 03:15"
tags: [nunit, dotnet]
permalink: /2013/01/05/Introduction-nunit/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on NUnit Test Cases"
gh-badge: [star, follow]
comments: true
---
In this article we are going to see the basic idea on writing unit test case using NUnit. I am using NUnit 2.6.2 with c#(vs 2010).

[Download and Install latest NUnit](https://nunit.org/)

Now , you should have a project to test as We are going to provide Unit Test coverage for a project. So, We will have its code. There are many pros and cons for eligibility of a project under Unit Test coverage conditions. We am going to use a 3 tire architecture and try to cover unit tests for a particular tire's particular class.

### Test Calculator : 
Assume that we are providing unit test for a calculator project. Where there are thousands of functions. We will try to provide test coverage for a particular function, say Addition function two numbers. 

### Tests : 
To test this function what can be the test scenarios. I am describing some of points here.
- Input Validation : Input should be number (float or numeric)
- Result Validation : Valid results for all possible valid inputs. 
- Accuracy of output : Length of the results (fractional points boundary limits)
- Validate Ceiling/floor functions.(if any specified in case of money calculation or etc)
- Convertibility to other formats.(this important in the context of engineering)
- Error Handling
    - Expected Exception thrown properly
    - Data Type boundary Exceed results

Depending on domain, we can find more test scenarios. Typically, in these type of functions(under n-tire architecture) we do not need to validate the inputs. Usually those input error conditions are covered by exception. So, after gathering scenarios, now we need to define test case. Assume the result will be shown in float number.
let say  what should be the test cases for this "-Valid results for all possible valid inputs." scenario. 

#### The test cases are 
1. Add two Integer and get proper result as float
2. Add two float and get proper result as float
3. Add one Integer, one float and get proper result as float

Now, what will be the definition of being proper. In this small domain, let decide, the result will be proper when it is exactly matched to known valid results. In here, we can impose correctness conditions by overriding comparing Method. Usually we will use default comparing Method to validate the result(Assert). Lets implement those.

To start a NUnit Test Cases, we should know the basic of how NUnit works. Lets assume **Calculator** has following methods for addition. 

```
public double Add(int a, int b)
{
     return a + b;
}
public double Add(double a, double b)
{
     return a + b;
}
public double Add(int a, double b)
{
    return a + b;
}
public double Add(double a, int b)
{
  return a + b;
}
```

- in dotnet every float number by default initiate as double

### Basic NUnit Attributes 
NUnit can read and execute the test case when we use test attribute before test method. If you want to know detail about how a dot net attribute works, please visit this [link](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/attributes/). NUnit have various attribute. All are described [**here**](http://www.nunit.org/index.php?p=attributes&r=2.6.2) . I am describing some of them which will be needed primarily.
- To define a class as Test Class(generally a test class contains a variety number of test methods), before a c# class we will use **[TestFixture]** attribute before class. 

```
[TestFixture]
public class TestCalculator
{
}
```

At a glance we can say, **[TestFixture]** makes a class as test method container. Whenever NUnit will look the class, it will get all test methods under one class.

- To define a Method as a Test Case(generally a test case contains the test steps to satisfy a scenario. This is optional to use one test method for one scenario, their might have different scopes to have multiple test method for one scenario),  we have add **[Test]** attribute before the Method. The Test attribute is one way of marking a method inside a TestFixture class as a test.

```
[Test]
public void TestAddResultsValidity()
{
}
```

- When we need some functions to run before every test method, (like Initialization  , deleting or building some thing, etc) we will use **[SetUp]** attribute before the Method.

```
[SetUp]
public void Initialization()
{
}
```

- When we need some functions to run after every test method, (like closure activities, db connection close, stopping any thread etc) we will use **[TearDown]** attribute before the Method.

```
[TearDown]
public void CleanUp()
{
}
```

- When we need some functions to run before running all test cases , that means one time running on start in a test class(test fixture), we will use **[TestFixtureSetup]** attribute before the Method. This attribute is used inside a TestFixture/test class to provide a single set of functions that are performed once prior to executing any of the tests in the class.

```
[TestFixtureSetUp]
public void GlobalInitialization()
{
}
```

- When we need some functions to run after running all test cases , that means one time running on end in a test class(test fixture), we will use **[TestFixtureTearDown]** attribute before the Method.This attribute is used inside a TestFixture/test class to provide a single set of functions that are performed once after all tests are completed

```
[TestFixtureTearDown]
public void GlobalCleanUp()
{
}
```

- When we need to insert parameter to our test methods, we will use **[TestCase]** attribute. It is actually implemented with a set of test data with expected results.

Either we can provide Assert(talk in later on) or use return to compare values withe expected values. I am attaching both example in current context. 

With Assert

```
[TestCase(2,3,5)]
[TestCase(3.5,4.2,7.7)]
[TestCase(1.2,4,5.2)]
[TestCase(1,4.4,5.4)]
public void TestAdd(int a, int b, int c)
{
  Assert.AreEqual( c, myCal.Add(a,b));
}
```

With return

```
[TestCase(2,3, Result=5)]
[TestCase(3.5,4.2, Result=7.7)]
[TestCase(1.2,4, Result=5.2)]
[TestCase(1,4.4, Result=5.4)]
public int TestAdd(int n, int d)
{
  return myCal.Add(a,b);
}
```

- When we need multiple values as parameter we may use **[Values]** attribute  The magic behind this is, if we use values, it automatically combines all possible imputes.

```
[Test]
public void TestAdd([Values(1,2,3)] int a,[Values(4,5)]int b)
{
}
```

In here **TestAdd(1,4),TestAdd(1,5),TestAdd(2,4),TestAdd(2,5),TestAdd(3,4),TestAdd(3,5)**. This 6 test method will run.


- When we need to specify a timeout (ms) for a test case, we will use **[Timeout(500)]** attribute.

```
[Test, Timeout(500)]
public void TestAdd()
{
}
```

### Finally, the NUnit Test Case: 
Now lets write the a simple test case to verify the three test cases. 

```
[Test]
public void TestAddResultsValidity()
{
Assert.AreEqual(7,myCal.Add(3,4));
Assert.AreEqual(7.7,myCal.Add(3.3,4.4));
Assert.AreEqual(5.1,myCal.Add(1,4.1));
Assert.AreEqual(5.4,myCal.Add(1.4,4));
}
```

#### Best Practices
Typically I use following Conventions to write Unit test cases
1. One Scenario need to cover similar functions under a method(from example, only one  scenario for testing Add function's valid results)
2. One Test Method for One scenario
3. Every method name start with Test+
4. All test methods return void
5. All test methods will take no parameter.
6. Keep log on fail/pass issues, and finally have a log file. That might help for test reports.

I will try to add more ideas incrementally. 


Thanks...:)