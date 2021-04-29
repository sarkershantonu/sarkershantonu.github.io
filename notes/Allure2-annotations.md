In this blog we are going to see how can we use Allure-2 Annotations in our test cases. 

If you are interested to know about Allure-1 annotations, one of [my old blog](https://sarkershantonu.github.io/2016/10/03/allure1/) you may read. 

### What is Alure?
Allure is an opensource report engine built using AngularJS. It generates report based on maven surefire plugins. It has support for junit, testNG, cucumber-java, selenide, pytest, behav, jasmine, Mocha, RSpec, Spock, PHPUnit , SpecFlow, NUnit, MSTest etc unit testing framework. It has command line interface to generate report . And it has supports for popular CI/CD platform like jenkins, TeamCity, Banboo, Gradle, Maven, CodeFresh.

I am not putting details on why we need allure, to know details about allure reporting format, please see [**my old post**](https://sarkershantonu.github.io/2016/10/03/allure1/)



### [Example With Junit5](https://github.com/sarkershantonu/Automation-Getting-Started/tree/master/Allure2-Junit5)
- [POM.XML](https://github.com/sarkershantonu/Automation-Getting-Started/blob/master/Allure2-Junit5/pom.xml) structure
- [Example Test cases](https://github.com/sarkershantonu/Automation-Getting-Started/tree/master/Allure2-Junit5/src/test/java/org/automation/junit5/tests/allure/TestWithAllureReports.java)

Key Points in POM 
- Surefire Plugins configuration 
- Reporting Configuration 
- Supported Maven Site Plugins configurations 
- Allure Dependency for using allure annotation in Code. 
- Allure depends on aspectj, log4j, please check those.

### Allure Properties 
Allure reports comes with predefine properties. Here are the default values

```
allure.results.directory=target/allure-results
allure.link.issue.pattern=https://example.org/browse/{}
allure.link.tms.pattern=https://example.org/browse/{}
```
So, what are the annotations for Allure 2 that we can use. Here are the list. I am describing one by one. 

### Test Application

In the whole example, I am using this simple calculator class to test. 

```
package org.automation;
import io.qameta.allure.Step;
public class Calculator {
    @Step
    public int sub(int a, int b) {
        return a - b;
    }
    @Step
    public int mod(int a, int b) {
        return a % b;
    }
    @Step
    public int div(int a, int b) {
        return a % b;
    }

    @Step
    public int add(int a, int b) {
        return a + b;
    }
    @Step
    public int add(int[] a) {
        int result = 0;
        for (int i : a) {
            result += i;
        }
        return result;
    }
    @Step("adding Integers with {} ")
    public Integer add(Integer... numbers) {
        Integer result = new Integer(0);
        for (Integer i : numbers) {
            result += i;
        }
        return result;
    }
    @Step
    public <T extends Number> T add(T... t) {
        Double sum = new Double(0.0);
        for (T i : t) {
            sum += i.doubleValue();
        }
        return (T) sum;
    }
    @Step
    public String add(String... strings){
        if(null==strings || strings.length<=0)
        {
            return "empty_input";
        }
        else
        {
            StringBuffer sb = new StringBuffer();
            for (String a:strings){
                sb.append(a);
            }
            return sb.toString();
        }
    }

}
```
### @Step : 
Each step method to perform a test. That means, when you write your test, your test might need multiple methods to call. Annotate to each method which are used in a @Test.  

Scope Of Use : Methods. Can be used with methods only

Parameters : It can take String value which can be description of the step. 

**Example :** I have included steps in all methods of calculator class. That means every time any calculator method is called for testing, it will be shown in Allure report as step. 

- This shows default behavior of @Step. That means , method name will be used as step description.  

``` 
@Step
    public int add(int a, int b) {
        return a + b;
    }
```

- This shows custom step sentence with parameters which is indicated by ```{}```

```
 }
    @Step("adding Integers with {} ")
    public Integer add(Integer... numbers) {
        Integer result = new Integer(0);
        for (Integer i : numbers) {
            result += i;
        }
        return result;
    }

```
### @AllureId : For Allure Enterprise Solution 
- Scope Of Use : Methods
- Parameters : It can take String

**Example :** I am not using Allure corporate service, no I dont have any example for this. This is mainly Used by Allure Enterprise to link test cases with related test methods.

### @Attachment :
Usually when a method returns a String or Byte array, we can attach this to allure report. That means, if we take any screenshot taking method, we can easily use ```@Attachment``` to include into report.

- Scope Of Use : Methods
- Parameters : Attachment Name, Attachment type, attached file extension. All are string 
- **Example :** in the example, I am including ```@Attachment``` in method call and utility where I am taking screenshot. 

a. This will get the return of the method and save as attachement 

``` 
@Step
    @Attachment
    public String add(String... strings){
        if(null==strings || strings.length<=0)
        {
            return "empty_input";
        }
        else
        {
            StringBuffer sb = new StringBuffer();
            for (String a:strings){
                sb.append(a);
            }
            return sb.toString();
        }
    }
```

In the report we can see like this 

![string-attachemnt](/images/allure/allure2/attachment-string.JPG)

b. This will attach where screenshot was called. I have added a name just to show we can set name of the attachment. 
``` 
    @Attachment(value = "imageCaptured")
    public static byte[] capturePNG() throws IOException, AWTException {
        byte[] out = null;
        BufferedImage screencapture = new Robot().createScreenCapture(
                new Rectangle(Toolkit.getDefaultToolkit().getScreenSize()));
        ByteArrayOutputStream bo = new ByteArrayOutputStream();
        ImageIO.write(screencapture, "png", bo);
        out = bo.toByteArray();
        bo.close();
        return out;
    }
```


In the report we can see like this

![string-attachemnt](/images/allure/allure2/attachment-images.JPG)


### @Description :
When you want to add mode details to your test , use this as description of a test. Usually I prefer to put manual testcase title as description so that in report we can see.  
- Scope Of Use : Methods
- Parameters : Description string & boolean if we want to extract description from method's JavaDoc
- **Example :**

```
    @Test
    @Severity(SeverityLevel.BLOCKER)
    public void testAdd(){
        assertEquals(30,myCal.add(25,5));
    }

```

![description](/images/allure/allure2/.JPG)

### @Epic :
An Epic is set of work which can be divided in smaller stories. Basic Idea about EPIC can be found [**here**](https://www.atlassian.com/agile/project-management/epics)

In summary, A large feature or theme that can span several releases is called EPIC

- Scope Of Use : Methods & Classes 
- Parameters : Description string. 
- **Example :** 

In class 

``` 
@Epic("We Need to Develop A calculator")
public class TestWithAllureReports extends CalculatorTestBase {...}
```

In method 

``` 
@Test
@Epic("Adding functionality of Adding two int ")
    public void testAdd(){
        assertEquals(30,myCal.add(25,5));
    }
```
### @Epics :
This is for supporting multiple EPICs together in a single test.

- Scope Of Use : Methods & Classes
- Parameters : Array of EPIC
- **Example :**

In method 

``` 
    @Test
    @Epics(@Epic("Adding functionality of Adding two int "),@Epic("A screenshot should be taken when we are adding"))
    public void testAddWIthScreenshot() throws IOException, AWTException {
        assertEquals(30,myCal.add(25,5));
        ScreenShotUtil.capturePNG();
    }
```

### @Feature :
A functionality that we deliver in a version of a release. It may contain multiple stories but make sure they are released in single version. 

It is similar to EPIC but scope is single version. 

- Scope Of Use : Methods & Classes
- Parameters : Description string.
- **Example :**

In class

``` 
@Feature("Adding two values")
public class TestWithAllureReports extends CalculatorTestBase {...}
```

In method

``` 
@Test
@Feature("A  Screenshot present when adding two integers")
     public void testAddWIthScreenshot() throws IOException, AWTException {
        assertEquals(30,myCal.add(25,5));
        ScreenShotUtil.capturePNG();
    }
```

### @Features :
This is same as @Feature but with multiple entry. That means, this allows multiple Feature descriptions attached with a test class/method

Scope Of Use : Methods & Classes.

Parameters : Array of feature 

**Example :** 

In method 

``` 
    @Test
    @Features({@Feature("Addition of two Integer"),
            @Feature("Addition of two Floating point number"),
            @Feature("Adding Integer & Floating point number")})
    public void testAddMixType(){
        Double[] data_double = new Double[]{15.0,25.1,4.9};
        Integer[] data_int = new Integer[]{15,5,10};
        assertEquals(45.0,myCal.add(data_double));
        assertEquals(30,myCal.add(data_int));
    }
```

### @Story :
A short (the smallest possible) requirement written in end user perspective. [A good read is here](https://www.atlassian.com/agile/project-management/user-stories)

Scope Of Use : Methods & Classes.

Parameters : It can take String value which can be description of the step.

**Example :**
- in class 

``` 
@Story("An User should be able to perform calculator operations ")
public class TestWithAllureReports extends CalculatorTestBase {...}
```

In Method : 
``` 
    @Test
    @Story("An User should be able to add all items in an array if integers")
    public void testAddIntegerArray(){
        Integer[] data = new Integer[]{5,10,25,6,4};
        assertEquals(50,myCal.add(data));
    }
```
### @Stories :

This is same as @Story but with multiple entry. That means, this allows multiple Story descriptions attached with a test class/method

Scope Of Use : Methods & Classes.

Parameters : Array of Story
**Example :**

In a method 
``` 
    @Test
    @Stories({
    @Story("An User should be able to add Multi data type numbers (integer & double)"),
    @Story("An User should be able to add integer"),
    @Story("An User should be able to add  double numbers")})
    public void testAddMixType(){
        Double[] data_double = new Double[]{15.0,25.1,4.9};
        Integer[] data_int = new Integer[]{15,5,10};
        assertEquals(45.0,myCal.add(data_double));
        assertEquals(30,myCal.add(data_int));
    }

```

### @Flaky :
Used with unstable tests. In allure report we can see annotated test as unstable.  

Scope Of Use : Methods & Classes.

Parameters : None

**Example :** I am making a test to fail intentionally. 

- In method 

``` 
 @Test
    @Flaky
    public void flakyTestExample(){
        Assertions.fail("Flaky Test");
    }
```
### @Issue :
Linking a rest with issues. 

Scope Of Use : Methods & Classes.

Parameters : String to link issue tracker's original issue link 
**Example :**

In Method  : 

``` 
    @Test
    @Issue("WW-21")
    public void testAdd(){
        assertEquals(30,myCal.add(25,5));
    }
```

### @Issues :
This is same as @Issue but with multiple entry. That means, this allows multiple Issue link attached with a test class/method

Scope Of Use : Methods & Classes.

Parameters : Arrays of Issue

**Example :** 

In method : 

``` 
    @Test
    @Issues({@Issue("WW-22"),@Issue("WW-23")})
    public void testAddMixType(){
        Double[] data_double = new Double[]{15.0,25.1,4.9};
        Integer[] data_int = new Integer[]{15,5,10};
        assertEquals(45.0,myCal.add(data_double));
        assertEquals(30,myCal.add(data_int));
    }
    
```

In Class : 

``` 
@Issues({@Issue("WW-22"),@Issue("WW-21"),@Issue("WW-23")})
public class TestWithAllureReports extends CalculatorTestBase {...}
 
```

### @Lead :
This annotation can be used to define a test case LEAD information. 

Scope Of Use : Methods 

Parameters : String value as name of the lead person

**Example :**

```
    @Test
    @Lead("shantonu.sarker")
    public void testAdd(){
        assertEquals(30,myCal.add(25,5));
    }
```

In Report :

### @Link :
We can link any URL with @Link. It can be any external link /reference. 

Scope Of Use : Methods & Classes.

Parameters : It takes 
- name , a string to represent link text 
- url , a string to represent an actual link
- type , a string to represent what type of link
- value , similar to name 

**Example :**

In Method : 

``` 
@Test
@Link(name = "requirements", url="https://www.programiz.com/c-programming/examples/add-numbers",type = "Trello")
    public void testAddIntegerArray(){
        Integer[] data = new Integer[]{5,10,25,6,4};
        assertEquals(50,myCal.add(data));
    }

```

### @Links :
This is same as @Link but with multiple entry. That means, this allows multiple Links  attached with a test class/method

Scope Of Use : Methods & Classes.

Parameters : Arrays of Links

**Example :**

In Class : 

``` 
@Links({ @Link(name = "requirements-add", url="https://www.programiz.com/c-programming/examples/add-numbers",type = "Trello"),
        @Link(name = "requirements-multiply", url="https://www.programiz.com/c-programming/examples/product-numbers",type = "Trello")})
public class TestWithAllureReports extends CalculatorTestBase {...}
```

### @Muted :
If you want to exclude any test from Allure report, use @Muted. 

Scope Of Use : Methods & Classes.

Parameters :None

**Example :** 

In Method : 

``` 
    @Test
    @Muted
    public void mutedTestExample(){
        Assertions.fail(" A muted test which wont be shown in report");
    }
```
And we cant see this in report. 

### @Owner :
This allows to put owner information of a test case presentable Allure report.

Scope Of Use : Methods & Classes.

Parameters :Takes string as name of owner

**Example :**

In Class : 

``` 
@Owner("shantonu")
public class TestWithAllureReports extends CalculatorTestBase {...}
```

in method : 

``` 
    @Test
    @Owner("shantonu")
    public void testAdd(){
        assertEquals(30,myCal.add(25,5));
    }

```

### @Severity :
We can prioritize out test by putting Severity information in Allure report usine @Severity

Scope Of Use : Methods & Classes.

Parameters :Takes SeverityLevel values. Allure 2.0 has following Severities (enum name io.qameta.allure.SeverityLevel)

- BLOCKER("blocker"), 
- CRITICAL("critical"),
- NORMAL("normal"),
- MINOR("minor"),
- TRIVIAL("trivial");

**Example :**

In Class : 

``` 
@Severity(SeverityLevel.NORMAL)
public class TestWithAllureReports extends CalculatorTestBase {
```

In Method : 

``` 
    @Test
    @Severity(SeverityLevel.BLOCKER)
    public void testAdd(){
        assertEquals(30,myCal.add(25,5));
    }
```


### @TmsLink : Test Management System Links
We can add test management tracker/system links with test cases. This will provide complete link in report. URL prefix can be configured using **allure.link.tms.pattern** property. 

Scope Of Use : Methods & Classes.

Parameters : It can take String value which is the link of management system. 

For example, if our test case on TMS link is ```https://tms.mycompany.com/browse/tc-256```, then we can use ```tc-256``` as value here. 

**Example :**

In method : 

``` 
    @Test
    @TmsLink("tc-256")
    public void testAdd(){
        assertEquals(30,myCal.add(25,5));
    }
```

- Link in allure.properties : ```allure.link.tms.pattern=https://example.org/browse/{}``` where our provided text will put in ```{}``` section. 

### @TmsLinks :
This is same as @TmsLink but with multiple entry. That means, this allows multiple TMS link attached with a test class/method

Scope Of Use : Methods & Classes. 

Parameters : It can take String value which can be description of the step.

**Example :** 