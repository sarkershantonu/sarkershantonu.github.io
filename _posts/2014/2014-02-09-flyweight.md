---
layout: post
title: Flyweight Design Pattern
date: "2014-02-09 01:07"
tags: [java,design-pattern,dotnet]
permalink: /2014/02/09/flyweight/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java"
gh-badge: [star,follow]
comments: true
---
In this article we are going to learn about another simple Design Pattern, **Flyweight**. We will discuses about 
- What is Flyweight Pattern?
- What are the basic principle? 
- How to implement that 
- where we can use it?

For code I have used c# with VS2010 and Java with Eclipse.

# What is Flyweight Pattern?
In object oriented world sometimes we have to **deal with huge number of objects**. If we directly create object , it might overflow the memory boundaries. Like, creating 1000000 objects for a particular request. 

So, how can we do it. Because, if we make the real object then our system will not be usable. So, to solve the situation **Flyweight pattern** is mostly use. But there is a condition, there should be a shared state. 

That means , some thing should be common among them.

And, Flyweight pattern allows us to make unlimited or huge number of objects if they have shared properties/state.

For **example**, in a strategy game like [Age of Empires2](https://en.wikipedia.org/wiki/Age_of_Empires_II) or [Red Alert2](https://en.wikipedia.org/wiki/Command_%26_Conquer:_Red_Alert_2) , the large number of soldiers object. In here, they have common think like their body parts, behaviors, weapons. The value will be change but criteria are common.  

Let's think of a system(from my work experience), There is a windows service that takes request over local network from device that comes to the network. The device send an object contain configuration of the device. And the service can take more than 100 Million. 

How can we test those?, we do not have that amount of device to test. But in real life, client may have **100M** devices. My problem was to make a tool that can simulate 100M configurations. 

What I did, I use flyweight that generates 100Mill+ requests. So, it is very useful when creating load/performance testing tools. 

We can more think of, a Grid component like MS Excel. There are millions of cells. If we want to make a component like that, we have to use flyweight.

Or even a text editor. Text view are that display texts also have the same problems of creating many objects to display.  

# Principles :
- Object should have a common part which will be shared
- Object should have a part which will differ from each other. 

# UML :
![uml-flyweight](/images/Patterns/flyweight.jpg)

# How to implement that?  
- They have common properties, so if we have multiple type of object(classes) then there should be either an interface or abstract class containing the common property/function. And those classes will be extending that. Lets call the interface/abstract class as Flyweight. And the implementing classes will be Concrete Flyweight.
- We should have the a class that makes the  Concrete Flyweight object and keeps track. This class is responsible **tracking all Concrete Flyweight objects and handle object creations**. It will also makes a mechanism to share common and differ property or function. Let's call it flyweight factory. This factory class will store all objects and share common property/function. So, we will need a storage here(I have use hash-map in java example and Dictionary in c# Example)

And, finally a client who actually use the factory to create Concrete Flyweight objects. 

# Example : 
In Example, I have not use the interface. I keep only one kind of Object. Every object has sharing property and differ property. Let's elaborate the example.

A bank has millions of account. And, we have know all account information. So, we have created account class. 

That has common property name & differ property Account type. And, account type is an enum type. And, all account object can print it self. So, The Account Class

```
public class Account {
    private String name="Shantonu Blog Example ";
    private AccountType type;
    public void setName(String name) {this.name = name;    }
    public String getName() {        return name;    }
    private static long objectCounter=1;
    public Account(AccountType aType){
        this.type = aType;
        System.out.println("Object number : "+objectCounter++);
    }    
    public void printInformation(){
        System.out.println("Account Name = "+this.name+", Account type = "+type.toString());
    }
}
```

And AccountType Enum (it contains a randomize method, applied for java only)

```
public enum AccountType {
Current,Savings,Salary,student,employee,premium,fc,rfcd;
public static AccountType getARandomeType(){
    return values()[(int)(Math.random()*values().length)];
}
}
```

The factory class who is responsible for sharing and keeping track.

```
public class AccountMaker {
    private static final HashMap<AccountType, Account> myAccounts = new  HashMap<AccountType, Account>();
    public static Account getAccount(AccountType aType){
        Account myAccount;
        myAccount = (Account)myAccounts.get(aType);        
        if(myAccount==null){
            myAccount = new Account(aType);
            myAccounts.put(aType, myAccount);
            System.out.println("Object Added in hash"+myAccounts.size());
        }
        //myAccount = new Account(aType);
        //myAccounts.put(aType, myAccount);
        return myAccount;
    }
}
```

And the client, who actually call

```
public class Program {
    public static void main(String[] args) {
        new Program();
    }
    public Program(){
        long startTime = System.currentTimeMillis();
        for(int i =1; i<=1000000; i++){
            AccountMaker.getAccount(AccountType.getARandomeType()).printInformation();
            //new Account(AccountType.getARandomeType()).printInformation();
        }
        long endTime = System.currentTimeMillis();
        System.out.println("Time Passed : "+(endTime-startTime)+" MS");
    }
}
```

# [Java Example](https://github.com/sarkershantonu/java-novice-to-advance/tree/master/DesignPatterns/Flyweight):
1. I have printed object creation count each time object is created.(objectCounter=1). 
2. I have printed object adding count each time an item added in out hash map System.out.println("Object Added in hash"+myAccounts.size());
3. Start time and end time mentioned to actually get to know the performance enhancements.
4. In the for loop, you may add more numbers.
5. In the loop, you will find commented code, those are actually creating accounts without flyweight. You can try to compare time. In my PC, flyweight provide 400% performance.

**Note** : In shared code, you may see another practice project which I made from online learning, little bit complex but does the same conception 

# [C# Example](https://github.com/sarkershantonu/blog-projects/tree/master/DesignPatternsDotNet/FlyWeight) : 
1. Java hash-map is used as Dictionary here. 
2. for enum, I have not created new file.
3. Naming and function calling are changed due to different implementation. 
4. Function added in program class for Randomize account type value. 

# Sources
- [Java](https://github.com/sarkershantonu/java-novice-to-advance/tree/master/DesignPatterns/Flyweight)
- [DotNet](https://github.com/sarkershantonu/blog-projects/tree/master/DesignPatternsDotNet/FlyWeight)