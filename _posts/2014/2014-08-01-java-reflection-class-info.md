---
layout: post
title: Class/Type Info by Java Reflection
date: "2014-08-01 23:17"
tags: [java,reflection]
permalink: /2014/08/01/java-reflection-class-info/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java Reflection"
gh-badge: [star,follow]
comments: true
---
In this article we will see how can we retrieve Class Related Information using Java Reflection .

I will make a separate class reflector utility class where we input a target class in its constructor and we will retrieve information using separate method. 

In this way ,we can isolate our needs. To do that

```
   public class ClassReflector extends BasicItemsComponents{    
       private Class myClass;
       public ClassReflector(Class aClass){
           this();
           myClass = aClass;
       }
       ClassReflector(){//todo for next default initiation 
       }
```

## How to Get Interface Names ?

So, lets have a meted for getting all Interface names which will provide output as string array where every string represent name of the implemented interface. 

```
    public String[] getAllInterfaceNames(){
            String[] interfaces = null;
            int x=0;
            for(Class aClass: this.myClass.getInterfaces())
            {
                interfaces[x]=new String(aClass.getSimpleName());
                x++;
            }
            return interfaces;
  1     }
```
## How to Get Super Class Name ? 
As we know, Java does not support multiple inheritance, so there will be one name.  

```
public String getParentClassName(){
      return this.myClass.getSuperclass().getName();
    }
``` 

## How to get Package Information? 

``` 
public String getPackageName(){
           return "Package Name : "+myClass.getPackage().getName()+", Version :"+myClass.getPackage().getSpecificationVersion() ;
       }
``` 

## How to get Access Modifier Name ?

``` 
public String getModifierName() {
           return "Modfiers : "+Modifier.toString(myClass.getModifiers());
       }
``` 

JVM assumes the static, abstract, final as modifiers and with reflection we get int value for those. We use Modifier class to translate the int into proper modifier string. 

## How to get Class Names? 
Usually, when we talk about a class name, we mean its name that we declare after class keyword. 

But in compiler , a class is represented with its namespace or package information. That is why the term Class Name can provide different type of information. In the refection we get

- **Full Name/getName()** = Full name of a class which includes package info , like java.util.ArrayList.
- **Canonical Name/getCanonicalName()** = Is shows Full name with uniquely identifying element(often $<num value>) for inner classes. 
- **Simple Name/getSimpleName()**  = It means Only the name (what we declare with class keyword) like myClass
- **Type Name** =  It will express the type, usually either primitive type or other class. Usually , a class type represents it self(Full Name). 
- **toString()** = This will provide  class keyword, and full name. like class <full name of the class>
- **toGenericString()** = This will provide modifier name, class keyword, and full name. like <access modifier> class <full name of the class>

I am using a single string variable and adding each information with separate method call. 

``` 
   public String getAllTypesOfClassNames(){
           String allTypeNames; 
           allTypeNames = "Name : "+ myClass.getName()+"\n";
           allTypeNames+="Canonical Name : "+ myClass.getCanonicalName()+"\n";
           allTypeNames+="Simple Name : "+ myClass.getSimpleName()+"\n";
           allTypeNames+="Type Name : "+ myClass.getTypeName()+"\n";
           allTypeNames+="To String Name : "+ myClass.toString()+"\n";
           allTypeNames+="To Generic String Name : "+ myClass.toGenericString();
           return allTypeNames;
  1    }
``` 

## How to get Class’s Signer Names? 
What is Signer? I will be very brief as it is not Signer Specified post. When we sign a jar file (which is actually a class archive), java signer tool go through every class inside of the jar and sign every class with specific sign information. 

Usually, for every signing has purpose. That is why, a class may be signed by multiple signer tool with different signs. 

By reflection , we can get all signer names for a particular class. Default a sign is represented as object, I will call for its **toString()** method to retrieve information. 
``` 
   public String[] getAllSignerNames(){
           String[] names=null;
           int x=0;
           for(Object a: myClass.getSigners()){
               names[x]=a.toString();
               x++;
           }
           return names;    
       }
```    
Thanks ..:)