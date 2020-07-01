---
layout: post
title: What is annotation in Java?
date: "2016-01-28 07:46"
tags: [java]
permalink: /2016/01/28/java-annotation/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java annotation"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see Java Annotation in basic level, implementation and usages. This is very fundamental of Java . Almost all frameworks works based on this. Full AOP implemented using annotation. 

### What is annotation?
By the name we can understand, it is like as tag , which used in books. Conceptually annotation works like tag for a specif code that we use. That means, it is data about data means meta data. In summary, when we need to apply meta data over our source then we use annotation. (again this is small use case , there are lot more and elaborate usages too)

Now, you can say, we can use annotation in other ways. Yes we do. Annotation can be used in different context and we can define context while doing this. Usually annotations can be scooped
1. Pre compilation / Source (it will process before compilation to give instruction to compiler)
2. Compile time or Deployment (it will process before deployment or during compilation , used for code generation, configuration (XML or etc files) changes)
3. Run time (it will process during run time, like changing behavior)

![annotation-basic](/images/java/annotation/basic.jpg)

Run times are mostly used for dynamic behavior. Specially in AOP, when we define scopes it will change the app behavior. This is vastly used in spring.


### How it works?
Annotation has 3 parts which work combined.

1. Declaration(where we declare annotation)
2. Using annotation (where we apply)
3. Processor (where we process data) 

So, based on processor , annotation will perform its purpose. What ever we define in processor, it will be processed. (check detail in creating processor section)

##### Notes : 
- Poplar frameworks like aspectj, spring actually inject code before after the code block (search for how spring works or **spring weaving** , you will get detail architecture).
- via **@Target** this processor will define its behavior on those purposes in scope ( we will see detail in below)

Let see more detail. 

### How to declare annotation?
- Each annotation is a class file, so annotations are Type in java compiler.So, if it is a public type, should be in separate java file.
- The declaration keyword is **@interface**. In the example, I have used like this

```java
public @interface Info {}
```

This is an annotation name Info. So, it;s simple.

##### Notes :
1. Annotation can be **public/intra package only** (so no private/protected, Compiler Error)
2. As Annotation declared as @interface, it acts like interface, so no effect if you add abstract keyword before declaration. 

So, as we declared annotation, we need to define when it will be active. Java has helper annotation called @Retention which directs when it annotation will be invoked. There are three retention policy , CLASS, SOURCE, RUNTIME which defines the execution scope for annotation.
- **CLASS** policy refers to annotation work in class files. That means code injection in byte code after compilation.
- **SOURCE** policy annotation work on source code, before compilation. So, very good place if you are parsing source and applying additional code inside before compile.
- **RUNTIME** simply works during run time at JVM. So, you can do all reflection based annotation using this policy(much easier to use)

I will use simply run time **@Retention(RetentionPolicy.RUNTIME)** , to have impact only on run time.

And, I will need to provide scope of annotation. Scope means, where it can be used in source code. Again, java compiler has @Target which defines this. It takes parameter ElementType(by enum) . I have used following like this. 

```java
@Target(value = { PACKAGE, TYPE, METHOD, FIELD, PARAMETER, LOCAL_VARIABLE, CONSTRUCTOR, ANNOTATION_TYPE })
```

Now, these are are pretty mandatory , you can use when you need. You need to know where you will let your coders to use your annotation and based on that you need to define the target area. The names are self explanatory. For example, if you want to limit your annotation to use for class fields only , choose only FIELD.

##### Note : 
Some predefined annotation ( @Deprecated , @Override, @SuppressWarnings, @SafeVarargs , @Documented, @Repeatable ) are also present in JDK, you can check their usages. 

Now, Let come to Annotation Body. Annotation body act like as annotation parameter. That means, if your annotation has annotation body, when it is used in code, those values need to be inserted. That meas, we can enforce some data as input when some one use our annotation. I will use an enum Importancy defining priority and a string array as input. So, lets define that

```java
public @interface Info {
    enum Importancy {HIGH,MEDIUM,LOW,CRITICAL}// enum declaration
    Importancy[] priority();//adding enum
    String[] values() ;//adding string array 
}
```

Look at the declaration. Each member of Annotation declared like
        
        Type parameterName();

And if you have default values, you can define (example)

```java
String[] values() default { "Default Value 1", "Default2" };
```

So, we know how to declare annotation , lets make an Annotation processor.

### How to make annotation processor? 
This part is kind of tricky. There are different ways to make the processor. When annotation came first, Java has build in annotation processor called [APT(annotation process tool)](https://docs.oracle.com/javase/7/docs/technotes/guides/apt/index.html) . This APT tool was integrated form 1.6.
So, the best way to make an annotation processor to use this APT tool. This is basically a processor , following all standard processor rules. There is an abstract class for this "AbstractProcessor" , if you extend this, you need to apply processing , example

```java
public class InfoAptProcessor extends AbstractProcessor{
    @Override
    public boolean process(Set<? extends TypeElement> annotations, RoundEnvironment roundEnv) {
        //TODO -> Need to implement 
        return false;
    }
}
```

There is very detail article in this link, where you can try to make @Factory annotation which will work as factory for object (factory design Patten)

Another useful way is, using reflection. Again, this is actually workable if retention policy is run time because reflection works in run time. If your annotation retention policy is source level, that means reflection cant find anything to work on.
That is why, frameworks , code injectors use APT tool which needs pre processing , need to be include in meta info to instruct compiler to run before compilation to work additional task.

In the below example, I made processing via reflection (so, run time as retention policy, try to change and see nothing in output) 

### How to Use Annotation?
I first use annotation for unit testing with Junit & NUnit(for dotnet). Its very simple to use it

Syntax :
- @AnnotationName :-> No parameter
- @AnnotationName(Parameter1, Parameter2 ... ) ;-> One or more parameter
- @AnnotationName(Parameter={array of values, typically enum or string}... ) -> with array inside one parameter.

Like as we use in Unit test :

```java
@Test
public void testGetAllBugs() throws Exception{....}
```

Use in Spring Boot :(A Rest Controller, takes JSON format data )

```java
@RestController//defining class as controller
public class BugWSController extends BaseController {
    @Autowired//dependency injection(IOC)
    private BugService bugService;

@RequestMapping(value = "/api/bugs/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Bug> getABug(@PathVariable("id") Long id) {
      ....
    } 
```

Used in Spring Data :(a simple entity class representing a bug)

```java
@Entity
public class Bug {
    @Id
    @GeneratedValue
    private Long id;
}
```

Used for jcabi logging(Method level logging using AspectJ) :

```java
@Loggable(Loggable.DEBUG)// will log automatically with code injection
    public static void show(){...}
```


#### Example(Create & Use Custom Annotation) : 

**Problem** : Let's assume we need to get information from different part of source (test/code). Developers should be able to keep information from anywhere using annotation . So, we have to apply annotation @Info in every where (Class, method, constructor, field) in source code.
Typically we need to either print in string or store it some where for each usages. We will try to implement that via an annotation that can be used in our desired places and will show in command line about what info was inputted.

*I like this because , in Automation testing using selenium java , we can actually maintain logging of each tests/class/data for tests with our vastly writing lots of codes that makes test class more neat & clean.* 

So, Declaring an annotation

```java
import static java.lang.annotation.ElementType.*;
@Retention(RetentionPolicy.RUNTIME)
@Target(value = { PACKAGE, TYPE, METHOD, FIELD, PARAMETER, LOCAL_VARIABLE, CONSTRUCTOR, ANNOTATION_TYPE })
public @interface Info {
    enum Importancy {HIGH,MEDIUM,LOW,CRITICAL}
    Importancy[] priority();
    String[] values() default { "Default Value 1", "Default2" };//default values 
}
```

Now we need a **Processor** where Main duties are :
1. See all classes in current package if it is using our annotation.
2. If using, find Class Information
3. Find constrictors of the class
4. Find fields of the class
5. Find Methods of the class


```java
public class InfoProcessor {
public void processAnnotation() throws ClassNotFoundException, IOException {
        Class[] all = InfoProcessHelper.getAllClasses(this.getClass().getPackage().getName());
//Getting class
        for (Class aClass : all) {
            // System.out.println(aClass.getName());
            if (aClass.isAnnotationPresent(Info.class)) {
                Annotation annotation = aClass.getAnnotation(Info.class);
                Info info = (Info) annotation;
                System.out.println("This is a Class , Name ->" + aClass.getName());
                printAllInfo(info);
            }
// Getting Constructors
            int k = 0;
            for (Constructor constructor : aClass.getConstructors()) {
                if (constructor.isAnnotationPresent(Info.class)) {
                    Annotation constractorAnnotation = constructor.getDeclaredAnnotation(Info.class);
                    System.out.println("Constructor : " + k++ + ", Name ->" + constructor.getName());
                    printAllInfo((Info) constractorAnnotation);
                }
            }
// Getting fields
            int i = 0;
            for (Field f : aClass.getDeclaredFields()) {
                if (f.isAnnotationPresent(Info.class)) {
                    Annotation methodAnnotaitons = f.getAnnotation(Info.class);
                    System.out.println("Field : " + i++ + ", Name ->" + f.getName());
                    printAllInfo((Info) methodAnnotaitons);
                }
            }
// Getting methods
            int j = 0;
            for (Method aMethod : aClass.getDeclaredMethods()) {
                if (aMethod.isAnnotationPresent(Info.class)) {
                    Annotation methodAnnotaitons = aMethod.getAnnotation(Info.class);
                    System.out.println("Method : " + j++ + ", Name ->" + aMethod.getName());
                    printAllInfo((Info) methodAnnotaitons);
                }
            }
        }
    }
    private void printAllInfo(Info info) {
        for (Info.Importancy property : info.priority()) {
            System.out.println("Importancy:" + property.toString());
        }
        int i = 0;
        for (String aValue : info.values()) {
            System.out.println("Value:" + i++ + " : " + aValue);
        }
    }
}
```

To Help processor , I am using Helper to get all classes from current package :

```java
public class InfoProcessHelper { 
public static Class[] getAllClasses(String aPackageName) throws ClassNotFoundException, IOException {
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        if (classLoader == null) {
            throw new ClassNotFoundException(aPackageName);
        }
        String path = aPackageName.replace('.', '/');
        Enumeration<URL> resources = classLoader.getResources(path);
        List<File> dirs = new ArrayList<File>();
        while (resources.hasMoreElements()) {
            URL resource = (URL) resources.nextElement();
            dirs.add(new File(resource.getFile()));
        }
        ArrayList<Class> classes = new ArrayList<Class>();
        for (File dir : dirs) {
            classes.addAll(findClasses(dir, aPackageName));
        }
        return classes.toArray(new Class[classes.size()]);
    }

    private static List<Class> findClasses(File dir, String packageName)
            throws NotDirectoryException, ClassNotFoundException {
        List<Class> classes = new ArrayList<Class>();
        if (!dir.exists()) {
            throw new NotDirectoryException("No directory in the path : " + dir);
        }
        File[] files = dir.listFiles();
        for (File aFile : files) {
            if (aFile.isDirectory()) {
                if (aFile.getName().contains(".")) {
                    classes.addAll(findClasses(aFile, packageName + "." + aFile.getName()));
                } else {
                    throw new NotDirectoryException("No directory in the path : " + aFile.getPath());
                }
            }
            if (aFile.getName().contains(".class")) {
                classes.add(Class.forName(packageName + '.' + aFile.getName().substring(0, aFile.getName().length() - 6)));
            }
        }
        return classes;
    } 
}
```

##### Note : 
if you need to know about Java reflection, you can check my old posts in this page on reflection ]

Now we need a simple class that uses our annotation :

```java
@Info(priority = Info.Importancy.CRITICAL, values = {"this is Class", "Important class "} )
public class InfoUser {
    @Info(priority = Info.Importancy.LOW, values = {"this is Private field", "Field value "} )
    private String fname;
    @Info(priority = Info.Importancy.LOW, values = {"this is Private field", "Field value "} )
    private String lname;
   
    @Info(priority = Info.Importancy.CRITICAL, values = {"this is Default Constructor", "Method value "} )
    public InfoUser() {
    }

    @Info(priority = Info.Importancy.HIGH, values = {"this is parametrized Constructor", "Method value "} )
    public InfoUser(String fname, String lname) {
        super();
        this.fname = fname;
        this.lname = lname;
    }
    @Info(priority = Info.Importancy.MEDIUM, values = {"this is public method", "Method value "} )
    public String getFname() {
        return fname;
    }
    @Info(priority = Info.Importancy.HIGH, values = {"this is public method", "Method value "} )
    public void setFname(String fname) {
        this.fname = fname;
    }
    @Info(priority = Info.Importancy.MEDIUM, values = {"this is public method", "Method value "} )
    public String getLname() {
        return lname;
    }
    @Info(priority = Info.Importancy.HIGH, values = {"this is public method", "Method value "} )
    public void setLname(String lname) {
        this.lname = lname;
    }
    @Info(priority = Info.Importancy.CRITICAL, values = {"this is Very necesssary method", "Method value "} )
    public String getFullName() {
        return fname + " " + lname;
    }
}
```

This class extensively using our annotation in each step. And I am using dummy text just for quick code. Now, how to invoke this? In Junit(as junit run via reflection ) they use their own runner that runs all of this. As , we don't have runner, we need to call **new InfoProcessor().processAnnotation();**

Any where from application. I am using a main method in one of the class and running tha.

```java
public static void main(String... args) throws ClassNotFoundException, IOException {
        new InfoProcessor().processAnnotation();
}
```
So, we can see following in command line output.

![output](/images/java/annotation/running.jpg)

Now, you might say, we cant call this from main. So how to do, I use (as best practice) a facade method containing all of my annotation processor executors and run at the end of my test execution , so that wither we get all info or log them. You can apply this way to log all of you test method, data etc. 

##### Note : 
In DotNet , there is similar thing called attribute. Which is declared with [], works similar manner.

Please comment if you have a question

Thanks.. :)