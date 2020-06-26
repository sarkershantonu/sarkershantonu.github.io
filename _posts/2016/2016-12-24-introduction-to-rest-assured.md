---
layout: post
title: Introduction to Rest Assured
date: "2016-12-24 02:54"
tags: [junit, unit-testing, Rest-Assured]
permalink: /2016/12/24/rest-assured/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Rest Assured"
gh-badge: [star, follow]
comments: true
---
In this article we are going see how to use Rest Assure to test a web service. For this example , we will be use a REST webservice with JSON format request.

### What is webservice? 
For quick understanding, A web service is service over web to communicate over web technologies from device to device. This is one kind of messaging service. Details in this [**wiki**](https://en.wikipedia.org/wiki/Web_service). 
For this example, we will use a HTTP based REST web service where device communicate using JSON type data. 

### REST Service for testing : 
To test a web service , we need a running one. We can test on public web services which are free to access. But, I am going to use one of my one. In my [**Github repository**](https://github.com/sarkershantonu/Bug-Storing-WS) , you will find
[**Releases**](https://github.com/sarkershantonu/Bug-Storing-WS/releases)

I am using this example so that you can download any release and run locally(avoid Internet access). I will use release 2.0 which requires authentication.

### How to run? 
- Download any release and run as Jar file. From command line

        Java -Jar bug-store-1.2-SNAPSHOT.jar

You can see, the webservice is running in @localhost on port 9100. Credentials are **shantonu**, **123456** which are mentioned in this [property](https://github.com/sarkershantonu/Bug-Storing-WS/blob/master/src/main/resources/config/application.properties)

Now, Let's start the main project. I will do step by step project creation.In this example, we are focus on testing only. Not much detail on reporting. If you want to add advance reporting, you may see my Allure blog post for detail reporting.

### Required Software :
1. JDK 8+
2. Maven 3.3.9+
3. Any Java IDE

### Step 1 : Create A maven project
1. Open your favorite IDE
2. Create a maven project with group & artifact id. I have used these

        
        <groupId>org.automation</groupId>
        <artifactId>webservice-test</artifactId>
        <version>1.0-SNAPSHOT</version>

3. Add following dependencies for rest assure and Junit

```xml
<dependencies>
    <dependency>
        <groupId>io.rest-assured</groupId>
        <artifactId>rest-assured</artifactId>
        <version>${rest.assure.version}</version>
    </dependency>
    <dependency>
        <groupId>io.rest-assured</groupId>
        <artifactId>json-schema-validator</artifactId>
        <version>${rest.assure.version}</version>
    </dependency>
    <dependency>
        <groupId>io.rest-assured</groupId>
        <artifactId>rest-assured-common</artifactId>
        <version>${rest.assure.version}</version>
    </dependency>
    <dependency>
        <groupId>io.rest-assured</groupId>
        <artifactId>xml-path</artifactId>
        <version>${rest.assure.version}</version>
    </dependency>
    <dependency>
        <groupId>io.rest-assured</groupId>
        <artifactId>json-path</artifactId>
        <version>${rest.assure.version}</version>
    </dependency>
    <dependency>
        <groupId>io.rest-assured</groupId>
        <artifactId>spring-mock-mvc</artifactId>
        <version>${rest.assure.version}</version>
    </dependency>
    <dependency>
        <groupId>junit</groupId>
        <artifactId>junit</artifactId>
        <version>4.12</version>
    </dependency>
</dependencies>
```
Optional : if you cant access latest versions of rest assure , you can add the repository link
```xml
<repositories>
    <repository>
        <id>spring-milestones</id>
        <url>http://repo.spring.io/libs-milestone/</url>
    </repository>
</repositories>
```
Now, finally my pom.xml look like [**this**](https://github.com/sarkershantonu/Automation-Getting-Started/blob/master/RestAssured/pom.xml).

### Step 2 : Run WebService 
- Download & Run The web service release jar from command line. You will see something like this.
![app_launch](/images/restassured/app-launch.jpg)

As you can see, this is spring boot web service.When this webservice is started completely, you can see this line which means, the webservice is running in ***http://localhost:9100***.
![app_running](/images/restassured/app-running.jpg)

So, now we have a webservice running with following methods.
#### Enable methods
1. To see all bugs : GET : /table/bugs
2. To save a bug: POST : /table/bugs
3. To see a bug : GET : /table/bugs/{id}
4. To Update a Bug: PUT : /table/bugs/{id}
5. To Delete a Bug : DELETE : /table/bugs/{id}

### Step 3 : Write your first test :
Now, lets get back to our IDE (I am using intellij IDEA). We will start with creating a new bug entry in the web service. To do that, first I need a model class (or entity class) that represents a bug.
So, I add a class named Bug with 11 fields.
```java
public class Bug  {
public Bug() {}
private Long id;
private String title;
private String summary;
private String description;
private String attachmentPath;
private String exceptions;
private String comments;
private String foundDateTime;
private String tags;
private String priority; 
private String servility;
} 
```
Now add **setters**, **getters** methods for each field. And,  override **equals()**, **hashcode()** and **toString()** method.
For making life easy, I also added a constructor with all fields. And a static method returns a Bug object. 
- So, finally this class becomes.
```java
public class Bug {
    public Bug() {    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getSummary() {
        return summary;
    }
    public void setSummary(String summary) {
        this.summary = summary;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getAttachmentPath() {
        return attachmentPath;
    }
    public void setAttachmentPath(String attachmentPath) {
        this.attachmentPath = attachmentPath;
    }

    public String getExceptions() {
        return exceptions;
    }

    public void setExceptions(String exceptions) {
        this.exceptions = exceptions;
    }
    public String getComments() {
        return comments;
    }
    public void setComments(String comments) {
        this.comments = comments;
    }
    public String getFoundDateTime() {
        return foundDateTime;
    }

    public void setFoundDateTime(String foundDateTime) {
        this.foundDateTime = foundDateTime;
    }
    public String getTags() {
        return tags;
    }
    public void setTags(String tags) {
        this.tags = tags;
    }
    public String getPriority() {
        return priority;
    }
    public void setPriority(String priority) {
        this.priority = priority;
    }
    public String getServility() {
        return servility;
    }
    public void setServility(String servility) {
        this.servility = servility;
    }
    private Long id;
    private String title;
    private String summary;
    private String description;
    private String attachmentPath;
    private String exceptions;
    private String comments;
    private String foundDateTime;
    private String tags;
    private String priority;
    private String servility;

    @Override 
 public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Bug)) return false;
        Bug bug = (Bug) o;
        if (!getTitle().equals(bug.getTitle())) return false;
        if (getSummary() != null ? !getSummary().equals(bug.getSummary()) : bug.getSummary() != null) return false;
        if (getDescription() != null ? !getDescription().equals(bug.getDescription()) : bug.getDescription() != null)
            return false;
        if (getAttachmentPath() != null ? !getAttachmentPath().equals(bug.getAttachmentPath()) : bug.getAttachmentPath() != null)
            return false;
        if (getExceptions() != null ? !getExceptions().equals(bug.getExceptions()) : bug.getExceptions() != null)
            return false;
        if (getComments() != null ? !getComments().equals(bug.getComments()) : bug.getComments() != null) return false;
        if (getFoundDateTime() != null ? !getFoundDateTime().equals(bug.getFoundDateTime()) : bug.getFoundDateTime() != null)
            return false;
        if (getTags() != null ? !getTags().equals(bug.getTags()) : bug.getTags() != null) return false;
        if (!getPriority().equals(bug.getPriority())) return false;
        return getServility().equals(bug.getServility());
    }

    @Override 
 public int hashCode() {
        int result = getTitle().hashCode();
        result = 31 * result + (getSummary() != null ? getSummary().hashCode() : 0);
        result = 31 * result + (getDescription() != null ? getDescription().hashCode() : 0);
        result = 31 * result + (getAttachmentPath() != null ? getAttachmentPath().hashCode() : 0);
        result = 31 * result + (getExceptions() != null ? getExceptions().hashCode() : 0);
        result = 31 * result + (getComments() != null ? getComments().hashCode() : 0);
        result = 31 * result + (getFoundDateTime() != null ? getFoundDateTime().hashCode() : 0);
        result = 31 * result + (getTags() != null ? getTags().hashCode() : 0);
        result = 31 * result + getPriority().hashCode();
        result = 31 * result + getServility().hashCode();
        return result;
    }

    @Override 
 public String toString() {
        return "Bug{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", summary='" + summary + '\'' +
                ", description='" + description + '\'' +
                ", attachmentPath='" + attachmentPath + '\'' +
                ", exceptions='" + exceptions + '\'' +
                ", comments='" + comments + '\'' +
                ", foundDateTime='" + foundDateTime + '\'' +
                ", tags='" + tags + '\'' +
                ", priority='" + priority + '\'' +
                ", servility='" + servility + '\'' +
                '}';
    }

    public Bug(Long id, String title, String summary, 
String description, String attachmentPath, String exceptions, 
String comments, String foundDateTime, String tags, String priority, String servility) {
        this.id = id;
        this.title = title;
        this.summary = summary;
        this.description = description;
        this.attachmentPath = attachmentPath;
        this.exceptions = exceptions;
        this.comments = comments;
        this.foundDateTime = foundDateTime;
        this.tags = tags;
        this.priority = priority;
        this.servility = servility;
    }
    
    public static Bug getABug() {
        return new Bug(null, "title", "summary", "description", "/home/shantonu", 
        "RuntimeException", "from code", "Today","rest assure", "NORM", "BLOCKER");
    }
}
```

![bug](/images/restassured/bug-entity.jpg)
 I have added this **Bug** class under  package **org.automation.model**

Now, lets write our first test case. In test folder ,
1. Create a test package
2. Create an abstract test Base class (**BugTestBase**)
2. Create a test class which extends test base (**BasicTests** extends **BugTestBase**) . 
Like this  ![test-case](/images/restassured/test-case.jpg)

#### Why test base ? 
Following test organization best practices, i am using BugTestBase as test class common method and initialization items which i need for each test class before running. 

Now, define **BugTestBase** class like following
```java
public abstract class BugTestBase {
    private static final String URL = "http://localhost:9100";
    private static final String user = "shantonu";
    private static final String pass = "123456";
    protected static final Long globalResponseTimeout = 2000l;
@BeforeClass 
public static void initClass(){
    RestAssured.baseURI = URL;
    RestAssured.basePath="/table/bugs/";
}}
```
You can see, I am assigning base URL, primary path for BUG web service.
Now, lets open **BasicTests** class and add following test method
```java 
@Test 
public void testAddOne_validateResponse(){
    Bug aBug = Bug.getABug();
    given().
            auth().basic(user,pass).
            contentType(ContentType.JSON).body(Bug.getABug(),ObjectMapperType.JACKSON_2).
            post().then().assertThat().
            statusCode(HttpStatus.SC_CREATED).
            contentType(ContentType.JSON).
            header("Content-Type", "application/json;charset=UTF-8").
            body("title",equalTo(aBug.getTitle())).
            time(lessThan(globalResponseTimeout));
}
```
Now, we see what we are doing here. (important part to understand rest assured)
1. Creating a Bug instance
2. Initiating a HTTP POST request with this bug instance.
3. When we are putting this request , we are converting in JSON with Rest Assure built in object mapper which usages JackSon_2 type mapper.
4. We are declaring the content type as JSON which will be included in request header.
5. We are hitting URL (localhost:9100/table/bugs) which is coming from BugTestBase . So, no need extra path in post().
6. After posting request, we get response and validating response code, header item , content type, body title=the bug's title. And finally the response time is less than 2s.

Now, run the test case either from IDE or maven command. We will see test pass

![test-ide-running](/images/restassured/test-run-ide.jpg)

Now, this proves the test has pass and created a bug entry. If you want to validate , if it is create or not, you can use Postman chrome extension (or any other REST client) to check.
From bug webservice URLs , we can see there is ***GET /table/bugs*** request which shows all stored bugs. So, i use this url in post man and send the request, I can see stored bug as JSON response.
![postman-tc](/images/restassured/test-postman.jpg)

![postman-tc2](/images/restassured/test-postman-headers.jpg)

So, the bug is added and we can see. 

Now, as we know, for testing if we add any new data we should cleanup. So, this test case does not clean up. This was purpose of validating response. Now, create another test case for creating a bug , validate that it is exact same match with the bug we tried to add and finally delete from DB entry.
```java 
@Test
 public void testAddOne_validateResponseObject() {
    Bug request = Bug.getABug();
    Bug responsedBug = given().
            auth().basic(user,pass).
            contentType(ContentType.JSON).
            body(request,ObjectMapperType.JACKSON_2).
            post().as(Bug.class);
    Assert.assertTrue(request.equals(responsedBug));// validating responseded item is equal to what i put in    
    System.out.println(responsedBug.toString());// optional, to view purpose
    //cleanup my data    
    given().auth().basic(user,pass).
            delete(responsedBug.getId().
                    toString()).then().
            assertThat().statusCode(HttpStatus.SC_NO_CONTENT);
}
```
So, what is happening here which is not same like as previous one?
1. We are not validating http responses, but we are converting into **Bug** object (responsedBug).
2. Comparing two bug which we send, which we get
3. Deleting the response bug with its id using exposed URL DELETE : /table/bugs/{id}
4. When deleting, we are also checking http status for successful deletion.

### Step 4: Write others tests
#### 1. View all bugs :
```java  
@Test 
public void testViewAll() {
   given().
           auth().basic(user,pass).
           get().
           then().assertThat().
           statusCode(HttpStatus.SC_OK).
           contentType(ContentType.JSON).
           header("Content-Type", "application/json;charset=UTF-8").
           time(lessThan(globalResponseTimeout));
}
```
- Destination URL(GET ) = localhost:9100/table/bugs
- We are checking Http status, response type, content header, time.

#### 2. View One bug
assuming that bug with ID 1 present
```java 
@Test  
public void testViewABug(){
    given().
            auth().basic(user,pass).
            get(Integer.toString(1)).then().assertThat().
            statusCode(HttpStatus.SC_OK).
            contentType(ContentType.JSON).
            header("Content-Type", "application/json;charset=UTF-8").
            body("id", equalTo(1));
}
```
- Destination URL(GET ) = localhost:9100/table/bugs/1
- We are checking Http status, response type, content header, and response body should have id = 1, which we are requesting.

#### 3. Update a bug

```java
@Test 
public void testUpdateeABug(){
    Bug createdbug =
            given().
                    auth().basic(user,pass).
                    contentType(ContentType.JSON).
                    body(Bug.getABug(),ObjectMapperType.JACKSON_2).
                    post().as(Bug.class);

    createdbug.setTitle("This is modified title");
    createdbug.setDescription("This is modified description");

    given().
            auth().basic(user,pass).
            contentType(ContentType.JSON).body(createdbug,ObjectMapperType.JACKSON_2).
            when().put(createdbug.getId().toString()).
            then().assertThat().
            statusCode(HttpStatus.SC_ACCEPTED).
            contentType(ContentType.JSON).
            header("Content-Type", "application/json;charset=UTF-8").
            body("id",equalTo(createdbug.getId().intValue()));
    //cleanup    
     given().
            auth().basic(user,pass).
            delete(createdbug.getId().toString()).
            then().assertThat().
            statusCode(HttpStatus.SC_NO_CONTENT);
}
```
 
- Destination URL(PUT) = **localhost:9100/table/bugs/1**
- We are Creating a bug
- From response, we get a bug and change its title & description.
- We send update request for this the bug with same ID.
- We are checking Http status, response type, content header, and response body should have id = same as requested bug's id
- Finally we are deleting the bug & checking its status for cleaning up. 

#### 4. Delete a bug  
- Add a bug & delete that bug with ID and check http status
```java
@Test
public void testDeleteABug(){
    Bug respnsebug =
            given().
                    auth().basic(user,pass).
                    contentType(ContentType.JSON).
                    body(Bug.getABug(),ObjectMapperType.JACKSON_2).
                    post().as(Bug.class);
    given().auth().basic(user,pass).
            delete(respnsebug.getId().toString()).
            then().assertThat().
            statusCode(HttpStatus.SC_NO_CONTENT);
}
```
- Destination URL(DELETE ) = **localhost:9100/table/bugs/1**
- We are creating a bug and deleting that bug.  
- We are checking Http status only.

Now, if you are sending same request , we will see http 500. This examples only have happy paths to test. You can add all of the exception cases and boundary values by looking at the web service [**source**](https://github.com/sarkershantonu/Bug-Storing-WS).

So, finally if we run all the test case together, we will be looking like following.
![all-tc](/images/restassured/all-test-run-ide.jpg)

Now, you may say, these are not all. The main purpose of this post is to help on getting start testing with Rest Assured. I will be gradually adding more example to the repository. I have added small Response utilities already. So, more item will come gradually.

#### Note : 
if you use my webservice version 1.0, please do not use this line for authentication

        auth().basic(user,pass)

# [Source](https://github.com/sarkershantonu/Automation-Getting-Started/tree/master/RestAssured)

# [wiki](https://github.com/rest-assured/rest-assured/wiki/usage)
  
Please comment if you have any query.
  
----- 
Thanks.. :)


