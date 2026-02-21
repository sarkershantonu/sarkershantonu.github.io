---
layout: post
title: Constructor Info by Java Reflection
date: "2014-08-02 20:41"
tags: [java,reflection]
permalink: /2014/08/02/java-reflection-constructor-info/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java Reflection"
gh-badge: [star,follow]
comments: true
---
In this article we will see how can we retrieve Class Related Information using Java Reflection .We will see Constructor Names .

Please read this [**post**](/2014/08/01/java-reflection-class-info/) before follow post. 

## How to get all Constructors of a class?

This is very simple, unlike the method, a class has only its own constructors so, we can have direct access.

```
   public String[] getAllConstructorNames(){
           ArrayList<String> allConstructors = new ArrayList<String>();
           for(Constructor aConstructor: myClass.getDeclaredConstructors()){
           allConstructors.add("Constructor Name : " 
                        +aConstructor.getName()+" , Full Name : "+aConstructor.toString());
           }
           return allConstructors.toArray(new String[allConstructors.size()]);
       }
```

## How to get only Public Constructors of a class?
In this way we can see only public constructors.

```
   public String[] getAllPublicConstructorNames(){
           ArrayList<String> allConstructors = new ArrayList<String>();
           for(Constructor aConstructor: myClass.getConstructors()){
           allConstructors.add("Constructor Name : "
                        +aConstructor.getName()+" , Full Name : "+aConstructor.toString());
           }
           return allConstructors.toArray(new String[allConstructors.size()]);    
       }
```

Like as filed and method cases, we can get access using parameter names. like as follows.

```
myClass.getConstructor(<Parameters>);
myClass.getDeclaredConstructor(<Paraeters>);
```

Thanks..:)