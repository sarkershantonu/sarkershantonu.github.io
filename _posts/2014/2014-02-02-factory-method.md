---
layout: post
title: Factory Method Design Pattern
date: "2014-02-02 01:07"
tags: [java,design-pattern,dotnet]
permalink: /2014/02/02/factory-method/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java"
gh-badge: [star,follow]
comments: true
---
In this article we are going to learn about Factory Method Design Pattern.
- What is factory Method pattern? 
- What are the basic principle? 
- How to implement and what are the uses.

# What is Factory Method Pattern? 
Factory pattern is a way to use abstract classes(or interfaces) to define and maintain relation between objects. 

It is also known as virtual constructor, which is vastly implemented in class libraries/frameworks. Simply, the library will know when an object will be created(of a abstract class/interface) but do not know the exact kind of the object(class name).

In another way, factory method pattern is a way to keep responsibility among object as loos coupled. Any object that meets the core contract(interface/abstract declared method) can do the work. 

# Where to use it?
When we have many objects having common function which can be implemented as base object and we have a need to manipulate them. Though it creates some complexity, but still its one of the most uses pattern.

For understanding, Let say, a client need to do a function call ABC. Client do not need to concern which class's object need to have the function ABC rater client will call who ever have the function call ABC and in run time, the object having ABC will be asked to do the work. It's more like loose coupled. 

More generic way to call a function rather than specify the responsibility to a class. 

Another example, suppose we are designing a super store where we have many suppliers supplying same food(say, loaf). 

When a customer orders a loaf, we can take any of our supplier's loaf to deliver. That means, We are providing any one of the suppliers that can supply the loaf that our client need.

I have found 3 very good lines from wiki regarding when we use this 
- The creation of an object makes reuse impossible without significant duplication of code.
- The creation of an object requires access to information or resources that should not be contained within the composing class.
- The lifetime management of the generated objects must be centralized to ensure a consistent behavior within the application.. 

# Principles : 
- Defining an interface to create object(making generic way, no specific class pointing). We will let subclasses to decide which class instance needed.
- Referring that to the newly creating object through a common interface.

# UML :
![unl-factory-method](/images/Patterns/factoryMethod.jpg)

# How to implement?  
Suppose, we have a factory where Pen, pencil, eraser etc products are made. We have a client(containing Main) who calls a factory to make a product. 

And every product has common capabilities. So, let's have Enum that contains what products can be asked to made by the client object

```
public enum Products {
    pen,pencil,eraser
}
```

And, now we need a product interface, any product which can be created should follow that(mean, implement that Interface).

```
public interface IProduct {
    public void showMe();
}
```
And who ever implements that will be a considered as product. I have added two product Pen & Pencil here.

```
public class Pen implements IProduct{
    public void showMe(){
        System.out.println("A Pen is made");
    }
} 

public class Pencil implements IProduct{
    public void showMe(){
        System.out.println("A Pencil is made");
    }
}
```

So, now we have to think about the Factory who creates the products(Implementers of IProduct interface). 

I have used a Interface(u can use class) IFactory that defines the behavior of a Factory(who creates the products, which is actually the factory method). So, it is

```
public interface IFactory {
    //The Factory method
    IProduct CreateProduct();        
}
```

And, A factory class that implement it

```
public class Factory implements IFactory{
    Products productName;     
    public IProduct CreateProduct()
    {    
        switch(productName)
        {
            case pen : 
            return new Pen();
            case pencil :
            return new Pencil();
        }
        return null;
    }
    public Factory(Products product) {
        this.productName = product;
    }
}
```

So, If we look at the factory method we see, depend on the product type, factory choose products and return as generic product type(IProduct).

Now, lets use the factory in a client. I have named a class as client that includes a Main method(us factory) and a static method which actually do a supplementary work responsible to a IFactory type.  

```
public class Client {
    public static void main(String[] args) {
        IFactory creator = new Factory(Products.pen);
        DeliverProductToAShop(creator);
        creator = new Factory(Products.pencil);
        DeliverProductToAShop(creator);
    }   
    public static void DeliverProductToAShop(IFactory aFactory) {
        IProduct aProduct = aFactory.CreateProduct();
        aProduct.showMe();
    }
}
```

# [Java Example](https://github.com/sarkershantonu/java-novice-to-advance/tree/master/DesignPatterns/MethodFactory) : 
We can use abstract classes in case of Interface, I thought of interface as it is more generic way. 

# [C# Example](https://github.com/sarkershantonu/blog-projects/tree/master/DesignPatternsDotNet/FactoryMethod) : 
I have change some implementation as c# works little bit differently.(like naming, conversions)

# Sources
- [Java Example](https://github.com/sarkershantonu/java-novice-to-advance/tree/master/DesignPatterns/MethodFactory)
- [C# Example](https://github.com/sarkershantonu/blog-projects/tree/master/DesignPatternsDotNet/FactoryMethod)

**Caution** : Please be sure before using this. It may create UN-necessary complexity. But, in case of extendable robust code, it is very useful. 

