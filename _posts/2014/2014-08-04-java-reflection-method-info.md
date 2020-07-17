---
layout: post
title: Method Info by Java Reflection
date: "2014-08-04 01:13"
tags: [java,reflection]
permalink: /2014/08/04/java-reflection-method-info/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java Reflection"
gh-badge: [star,follow]
comments: true
---
In this article we will see how can we retrieve Method Information using Java Reflection

Please read this [**post**](https://sarkershantonu.github.io/2014/08/01/java-reflection-class-info/) before follow post. 

## How to get all declared Method Names inside of a class? 
This means , we will get the method names which are declared inside of the class(public , private, default, protected). Not inherited methods.  
```
   public String[] getAllOwnMethodNames(){
           ArrayList<String> allMethods = new ArrayList<String>();
           for(Method aMethod : myClass.getDeclaredMethods()){          
           allMethods.add("Method Name : "+aMethod.getName()+" , Full Name : "+aMethod.toString());
           }
           return allMethods.toArray(new String[allMethods.size()]);
       }
```
## How to get all Method Names accessible from of a class 
(which includes inherited, implemented methods of its own, super classes, interfaces)

Thant means , we will get method names which are included in the class and the method which are taken from its parent class, include its parents and interfaces.
```   
public String[] getAllPubliAndInheritedMethodNames(){
           ArrayList<String> allMethods = new ArrayList<String>();
           for(Method aMethod : myClass.getMethods()){            
           allMethods.add("Method Name : "+aMethod.getName()+" , Full Name : "+aMethod.toString());
           }
           return allMethods.toArray(new String[allMethods.size()]);
       }
``` 
**Note**: To know information in detail i use getName() and toString() method especially. 
 
For both case, we can specify method name to get that specific method.
```
myClass.getDeclaredMethod("StingName")
myClass.getMethod("StingName")
``` 
In the both case we need to know the name of the method. 

In a class, often we need to know either the method is a Getter or a setter method. 

We can apply small string filter. While iterating if we add like following 
 
To know if it is a Setter method :
```
aMethod.getName().startsWith("set"); 
```
To know if it is a Getter method : 
```
aMethod.getName().startsWith("get"); 
```

Thanks..:)

