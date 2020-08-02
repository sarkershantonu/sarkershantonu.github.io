---
layout: post
title: Singleton Design Pattern
date: "2014-01-27 01:07"
tags: [java,design-pattern,dotnet]
permalink: /2014/01/27/singleton/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java"
gh-badge: [star,follow]
comments: true
---
In this article we are going to learn about what is singleton pattern? What are the basic principles? What are the supported keywords  in java/c#? How we can Implement this in code? Where we can use this? 

And , A simple jdbc Gateway example with Java (eclipse) and a SQLServer example with c#(VS 2010)

# What is singleton pattern?
In object oriented world, sometimes we might need to create a singe object in all over execution time. To do that we need a design principle that satisfy the needs. 

Singleton pattern is a way to keep an class one time creatable and accessible globally(so that every one can use that) 

### What are the basic principles? 
- Only one instance of the class can be created.
- Provide a global access of the object

So, to implement that two behavior in java/c#, we have to think ways to do that. As we know
- If we keep the default constructor as private, it can not accessed by others
- If we keep only one constructor in the class, we can ensure our access is restricted to single rule.(no overloading constructor)
- If keep our target class not inheritable, we can protect it from creating similar instances. In java we have to use final keyword and in c# we have to use sealed keyword to make that possible.
- We need a method in the class that creates & returns an object of it self. 
- And, if we use static keyword before that method , it can be accessed globally. 

**Note**: In multithreaded scenario, we need **synchronized** keyword(in java and in c#, keywords are volatile , lock ) to make the method access globally among the threads. 

# UML

![single-tone](/images/Patterns/singleTone.jpg)

### Code

```
public final class MySqlConn {
    private static MySqlConn db;
    private MySqlConn() {    
    }   
    public static synchronized MySqlConn getDbConnection(){
        if(db==null){
            db = new MySqlConn();
        }
        return db;
    }
```

In the example, I have used JDBC sql connection with java(sql express in c#). As, this class contains configuration. So, it is an ideal candidate for Singleton implementation. 

In the project we will see com.core package as core library implementing singleton. 

It has , DbInfo class for static resource info and MySqlConn is the main singleton implementation. 

In the project, com.userClient contains DbUser class which actually representing a client that uses the singleton implementation. 

### Where we can use? 
Mainly the scenarios that meets the requirements which is described in the beginning of the post. So, we usually use this for
- The class that contains configurations , so that it can be used all over the program centrally.
- The class contains global variables. 
- The class who is responsible for describing any state( of any info, resource, object etc)
- The class which creates a Facade object(a simplified interface to a large body code).
It can be used with other patterns (like abstract factory, builder, prototype etc) 

### Example: 

In the example code , if we see, MySqlConn class, we will have clear idea about implementation. 

In the project you may see , I have added two extra method, query and insert . Both are for running sql commands. I will not go detail for those methods. Let's look at the class.

```
public final class MySqlConn {
    private Connection conn;
    private Statement statement; 
    private static MySqlConn db;
    private MySqlConn() {
        try{
            Class.forName(DbInfo.driver).newInstance();
            this.conn = (Connection)DriverManager.getConnection(DbInfo.URL+DbInfo.dbName,DbInfo.userName ,DbInfo.password);         
        }catch (Exception sqlException) {
            sqlException.printStackTrace();
        }    
    }
    /**
     * Main object creator
     */
    public static synchronized MySqlConn getDbConnection(){
        if(db==null){
            db = new MySqlConn();
        }
        return db;
    }
}
```

In here, we see the constructor is private ***private MySqlConn()*** that actually creates instance and get db connection with help of DbInfo class for static information. 

And, ***getDbConnection()*** static synchronized method that checks if the class instance present or not and then it returns the object instance(either created or newly created). 

In the project we will get DbUser class, which actually shows how to use the singleton class. Just simply if we call the static method getDbConnection(), then we get the instance of MySqlConn class. 

# Sources
- [Java](https://github.com/sarkershantonu/java-novice-to-advance/tree/master/DesignPatterns/SingleTone)
- [DotNet](https://github.com/sarkershantonu/blog-projects/tree/master/DesignPatternsDotNet/SingleTone)

**Notes**:
1. In My c# project, I have used local SQL Express connection string as example which is similar. You might get small differences in names.

2. For Java project, you need jdbc mysql connector in the project. I have establish a connection only. And for SQL Server, I have establish a connection and open it.  

3. For dotNet project I have used, multithreaded scenario, if you use single thread, try to delete volatile keyword and use readonly(for myInstance), no need sync for locking and no need lock keyword using code and null checking twice(first time is okay).  

Thanks...:)
