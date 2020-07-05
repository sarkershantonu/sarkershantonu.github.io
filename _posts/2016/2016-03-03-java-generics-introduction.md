---
layout: post
title: Generics in Java
date: "2016-03-03 08:07"
tags: [java]
permalink: /2016/03/03/Java-Generics/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Generics in Java"
gh-badge: [star,follow]
comments: true
---
In this article we are going know about Java generics, basic idea, how to implement, how to use with different scenarios. This post is intend for QAs and novice Java developers who need to read code frequently and most of use it. I will clear on concepts as well try to give some good examples. I will try to make statements / interpretation for each generic expression. 
## What is generics ?
Avoiding bookish statement, Generics is a technique which allowed programmers implement features/functions not specific to particular data types rather more general ways.
So, the implemented functionality become general use and can be applied beyond of specific data types. 

Good example, think of sorting (we know sorting from collage), if we apply sorting only for integers then other data types will need separate implementation of sorting. And, if sorting is applied in such way so that every type of data type may use this, then it can be used by all . So this is generic implementation of sorting.

Now , start with declaration. To make things manageable, I am making in 3 parts. 

## Typed Generics : Class/Interface
In collection classes or other, we will see some thing like ```List<String> ```. It is a list that contains String type Data. 
Now, if we want to make our own type.```List<OurOwnType>```
Now , in language as well as community, this is applied like ```List<T>``` where **T** is OurOwnType. (So, keep in mind , when ever you see T or any other class name, it is just our own type that we define, we will also see , undefined /wildcards in the end)

- So, how to declare a class that will provide common functionality for all other classes? just adding class parameter in class declaration level .
```java
class House<T>{}
```
it means, House is a class that can contains any type.

- if we want to have multiple generic type , it is simply
```
class House<T,H,J,K..., > {}
```
- You may have seen multiple generic types for collection like
```
HashTable<k,v> ,
Hashtable< String, Integer>. 
```
**Note** : when using the generic type, if you don't use parameter then it is called Raw type.
```
public House = new House();  
```
You might be confused, why only T. Well, that is just a meaningful name. You can use your own. In community, you might see following as best practices.

- E - Element (any)
- K - Key
- N - Number
- T - Type
- V - Value
- S,U,V etc based on you problem domain. 

#### How compiler handles ?
Very important note here. Java compiler manage this generic notifier T as object. That means, in compiler, it assumes this ```<T extends Object>```.Unless we tell compiler specifically.

**Note** : For all preemptive data types , java compiler automatically **boxing  & un-boxing** when we use them. (using int when declared as Integer) 

Now, lets define this following two terms that we will use next

- **Sub type** = When a class is implemented interface(s) or extended a class, then that class is call subtype of those interfaces or super class. Example : 
```
class A extends B, implements C, D {} 
```
- A will be called subtype of B as well as C & D. It is also part of SOLID , the **L = Liskov Substitution Principle**

- **Super type** : Just inverse of subtype. A subtype's parent or definer is called super type. That means, the class which is extended or interfaces which are implemented are called super type. From the same example, B, C & D are super type of A. 

Java Generic support super typing or sub typing. It means, we can define our generic type for their sub & super types like this.
Super type can be used only in method level . So, here is subtype example. 
```
class House<T extends AnyOtherDeclearedClass> 
```
- It means, House Class takes T which should be subtype of AnyOtherDeclearedClass. 

BTW, This time, there is an interesting thing happens. Compiler treat this differently than previously T . This time compiler handle this T object as **AnyOtherDeclearedClass** instance. So, we are bounding compiler for treating generic T. And This **AnyOtherDeclearedClass** can't be another generic type, should be declared explicitly.

#### Intersection types. 
By the name you can understand it is like Set theory of math. When we want to define our generic class T is a subtype of multiple types, then we use intersection. To define intersection , we simply use "&" operator or comma "," . 
- Example - Let assume we have InterfaceA, superClass, InterfaceB. So, we can use
```
<T extends superClass & InterfaceA & InterfaceB>
```
or 
```
<T extends superClass,  InterfaceA,  InterfaceB>
```
**Note** : Among sub classes, the expandable class should be at the beginning.  If we put super class after interface, compiler will throw error as class get more priority than interface. (tightly coupled)

#### How compiler will treat this T?
It's simple, following math of set theory. T represents superClass,  InterfaceA,  InterfaceB as common part. So, you can access all methods/fields from superClass,  InterfaceA,  InterfaceB.

**Notes** :
- We cant use super type in class level like this class House<T super AnyOtherDeclearedClass>
- Super type can only be used with wildcards.

**In summary** :
- ```<T extends A>``` :  T class is subtype of A class
- ```<T extends A & B >``` : T is a subtype of A and B
- ```<T extends A , B >``` : T is a subtype of A and B

### Interface : 
Like as Class, we can use generics in interface. Here is a declaration
- ```public interface InterfaceAB<T> extends Collection<T> {}``` : InterfaceAB is an interface that takes extends Collection of generic type T . 
- ```public interface GenericInterface<T> {}```: Generic Interface is generic type interface.

**Note** : In type level , (class/interface) we can not use wildcards. (what is it, see detail in method section)

## Method level :
Like as class level (type) , we can declare method level generic parameter.

```public void doSome(T aT ){}``` : doSome method takes a generic parameter T. 

Here is an important note, this **T should be defined in class level**. That means, in a class ```House<T>``` , we can define T as parameter. So, what happens is, when class does not take generic parameter but we need to implement method with generics. We simply need to define T in the method declaration.

### Method level declaration : 
T should be defined before return type of the method. for doSome method, it should be like 

```public<T> void doSome(T aT ){}```: doSome method takes a T. So, declaration in the beginning. Let' see if we have multiple type parameter and one of them used in return. 

```
public<T,K> K doSome(T aT, K aK){       
return aK;
}
```
This means, doSome takes T & K type parameter and returns K type.

Now, when we are using generics in method, it follows all rules from Sub Typing. So, it can have multiple subtype as well as inner subtypes. Let see some subtype example.
- ```public <T extends AbastractA> void doATask(T t){......}```: doATask method takes a generic type T which is extended from AbastractA (it can be class or interface, in my code it is class) 

- ```public <T extends InterfaceA> T doSomeWork(List<T> items){``` : In here , this method takes a list of generic type which should implement InterfaceA.

We have seen in class level, the keyword extends is used for both interface & Class subtypes.Super type can be used with wildcard. 

So what is wildcard? It is very simple in Java. Just using **?** instead of T. So, why we use this. Actually , wildcard has separate meaning . When we use **the type** it self , we define the type(like as T), so, when we actually use **wildcard , we wont be able to use the type**. 

For example, if we make a function that actually shows its collection no matter what type of item inside collection, we can use Collection<?>
```
public void printInUI(Collection<?> items){...}
```
##### Example to understand : 
Let's assume we need to get Max value from a collection. so, first thing in mind. 
```
public <T> T getMax(Collection<T> items){....} 
```
But, the generic type T should be able to compare to it self, so that we can actually get the max. So, now the following will be our mind. 
```
public <T extends Comparable<T>> T getMax(Collection<T> items){...}
```
This means, T will be treated as comparable to java compiler. So, it will loose its authenticity (type will be changed, so we will loose functionality.) . To overcome this, we will intersect this with Object  (intersection type) 

```
public <T extends Object & Comparable<? super T>> T getMax(Collection<T> items){...}
```
As java compiler peak first intersection type, so it will treated as object. 

Now, If we handling with legacy code with no generic type and this method needed to be used with classes from legacy code, wildcard can be used to do that. It will make this method more compatible to different type. 

Let's think from a user prospective. 
- Initially, we wanted to use getMax method to take a collection of T.
- we wanted comparable collection of T.
- we want this T to be flexible. 
And, inside this getMax method we will do
1. compare with collection of items(working with references)
2. Return one Item.

So, if we apply wildcard here, we get something like this.
```
public <T extends Object & Comparable<? extends T>> T getMax(Collection<Comparable<? extends T>> items){...}
```

This means, any type that extends T can be accepted to use this.

Now, when we are using legacy code, most of the time we have to use excising type or at most we can extend it. So, how can we return such object that actually be more generic. Here comes super. If we return by any type which is a super type of our generic type T, so, that any existing can actually call our method. So, we will get this.
```
public <T extends Object & Comparable<? super T>> T getMax(Collection<Comparable<? extends T>> items){...} 
```
you can see, I am returning T. ```<T extends Object & Comparable<? super T>>``` means, this function will return an object which was actually a subtype of legacy class(super of T) that we don't even know. 
This is one of the most useful example I found which may look weird but very very useful .

(this example is widely used for understanding generics, you may check VJug session of generic to have more expert opinion, I love [VJug](https://virtualjug.com/) )

### Why T or ? : 
This is one of the most commonly asked or found confusing. 
- when you are defining ? (not T) that means you can not use the generic class or its referenced object. That means, there is no implementation with any function depends on that class. 
- when you use T, you can reference instance of T and use it in you function. 

**when to use what?** if you are writing any function that works on your generic type, you need to use T, if not , simply ? (wildcards).

**Perfect example** : comparable object collection. 
- If you need to short an list of object which are comparable to make the list short you may use ```public List<? extends Comparable<?>> shortThis(List<? extends Comparable<?>> items){...}``` this will take any List of object that is comparable(subtype of comparable) 
- you can keep this for you own generic type with interface ```public <T extends InterfaceA > List<? extends Comparable<? extends T>> shortThis(List<? extends Comparable<? extends T>> items){.... }``` Your generic type T, extends, is the super type of ? do the same thing. You just include restriction, where previously only using ? refers to simple object by compiler. 

##### When sub type when super type :  
I like the get/put principle describe in -> [**Java Generics and Collections , By: Maurice Naftalin; Philip Wadler**](https://www.oreilly.com/library/view/java-generics-and/0596527756/)

"***The Get and Put Principle***: use an extends wildcard when you only get values out of a structure, use a super wildcard when you only put values into a structure, and don’t use a wildcard when you both get and put"

The concept is simple : 
- When you need to use only type item references(the object items), use extends 
- When you need to to return item reference(as super type) use super. 

Wildcards(?) has lots of limitation, I am not going to detail on that as it is not the target of the post. 

## Constructor level :
Declaring inside constructor is simple, it will take the type as parameters.
```
class MyClass<T, U> {
    private T first;  
    private U second;
    public MyClass(T first, U second) { 
        this.first=first; 
        this.second=second; 
    }
}
```
- If we need new item here, we can define type same like as method.  Let's add Key(K)
```
public <K> MyClass(K key, T first, U second) {
        this.first = first;
        this.second = second;
    }
```
- It means , K is new type can be used as parameter , but remember , as it is not declared in class level, we have use in the scope of constructor. 

All rules of method are applied here (as compiler treat constructor as spatial type of method) 

### Rules for static Items :
As, static items are context of a class(shared by all), we cant declare member variable as static.  

### Usages of Generics in Test automation : 
Being an automation engineer for more than 7 years, I use generics in very limited scopes, mainly in test methods and framework building. I am using  in following scenarios

- Making a generic test class to test all web page common tests like page static validation, style sheet validation, resolution checks for compatibility etc.
- In selenium with page object principle, i use generics for common events, like click, right click, mouse scroll , mouse hover, drag & drop. It helps me to have quick development as well as no repeat of code.
- Browser Behaviors validation for compatibility testings(common for all browsers)
- Error Handling in generic way with screen shots + log + action/steps+ exceptions messages.
- Utility classes having common functionality. 

Please comment if you have any question.
Thanks .. :) 