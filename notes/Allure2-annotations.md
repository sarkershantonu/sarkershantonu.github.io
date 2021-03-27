In this blog we are going to see how can we use Allure-2 Annotations in our test cases. 

If you are interested to know about Allure-1 annotations, one of [my old blog](https://sarkershantonu.github.io/2016/10/03/allure1/) you may read. 

### What is Alure?
Allure is an opensource report engine built using AngulaJs. It generates report based on maven surefire plugins. It has support for junit, testNG, cucumber-java, selenide, pytest, behav, jasmine, Mocha, RSpec, Spock, PHPUnit , SpecFlow, NUnit, MSTest etc unit testing framework. It has command line interface to generate report . And it has supports for popular CI/CD platform like jenkins, TeamCity, Banboo, Gradle, Maven, CodeFresh.

I am not putting details on why we need allure, to know details about allure reporting format, please see [**my old post**](https://sarkershantonu.github.io/2016/10/03/allure1/)



### [Example With Junit5](https://github.com/sarkershantonu/Automation-Getting-Started/tree/master/Allure2-Junit5)
- [POM.XML](https://github.com/sarkershantonu/Automation-Getting-Started/blob/master/Allure2-Junit5/pom.xml) structure

Key Points in POM 
- Surefire Plugins configuration 
- Reporting Configuration 
- Supported Maven Site Plugins configurations 
- Allure Dependency for using allure annotation in Code. 
- Allure depends on aspectj, log4j, please check those.

### Allure Properties 

```
allure.results.directory=target/allure-results
allure.link.issue.pattern=https://example.org/browse/{}
allure.link.tms.pattern=https://example.org/browse/{}
```
So, what are the annotations for Allure 2 that we can use. Here are the list. I am describing one by one. 

### @Step : 
Each step method to perform a test. That means, when you write your test, your test might need multiple methods to call. Annotate to each method which are used in a @Test.  

Scope Of Use : Methods. Can be used with methods only

Parameters : It can take String value which can be description of the step. 

Example : 

### @AllureId : For Allure Enterprise Solution 
- Scope Of Use : Methods
- Parameters : It can take String

### @Attachment :

- Scope Of Use : Methods
- Parameters : Attachment Name, Attachment type, attached file extension. All are string 
- Example :

### @Description :

- Scope Of Use : Methods
- Parameters : Description string & boolean if we want to extract description from method's JavaDoc
- Example :

### @Epic :
An Epic is set of work which can be divided in smaller stories. Basic Idea about EPIC can be found [**here**](https://www.atlassian.com/agile/project-management/epics)

In summary, A large feature or theme that can span several releases is called EPIC

- Scope Of Use : Methods & Classes 
- Parameters : Description string. 
- Example :



### @Epics :
This is for supporting multiple EPICs together in a single test.

- Scope Of Use : Methods & Classes
- Parameters : Array of EPIC
- Example :

### @Feature :
A functionality that we deliver in a version of a release. It may contain multiple stories but make sure they are released in single version. 
It is similar to EPIC but scope is single version. 

- Scope Of Use : Methods & Classes
- Parameters : Description string.
- Example :

### @Features :
This is same as @Feature but with multiple entry. That means, this allows multiple Feature descriptions attached with a test class/method

Scope Of Use : Methods & Classes.

Parameters : A feature 

Example : 

### @Story :

### @Stories :

This is same as @TmsLink but with multiple entry. That means, this allows multiple TMS link attached with a test class/method

Scope Of Use : Methods & Classes.

Parameters : It can take String value which can be description of the step.

### @Flaky :
### @Issue :
### @Issues :
### @Lead :
### @Link :
### @Links :
### @Muted :
### @Owner :
### @Severity :

### @TmsLink : Test Management System Links
We can add test management tracker/system links with test cases. This will provide complete link in report. URL prefix can be configured using **allure.link.tms.pattern** property. 

Scope Of Use : Methods & Classes.

Parameters : It can take String value which is the link of management system. 

For example, if our test case on TMS link is ```https://tms.mycompany.com/browse/tc-256```, then we can use ```tc-256``` as value here. 

Example :


- Link in allure.properties : ```allure.link.tms.pattern=https://example.org/browse/{}``` where our provided text will put in ```{}``` section. 

### @TmsLinks :
This is same as @TmsLink but with multiple entry. That means, this allows multiple TMS link attached with a test class/method

Scope Of Use : Methods & Classes. 

Parameters : It can take String value which can be description of the step.

Example : 