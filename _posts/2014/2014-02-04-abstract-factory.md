---
layout: post
title: Abstract Factory Design Pattern
date: "2014-02-04 01:07"
tags: [java,design-pattern,dotnet]
permalink: /2014/02/04/abstract-factory/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java"
gh-badge: [star,follow]
comments: true
---
In this article we are going to learn about **Abstract Factory**(or sometimes, only **Factory**) Design pattern.
- What is factory pattern? 
- What are the basic principle? 
- How to implement and what are the uses.

# What is Factory Pattern?
Factory pattern is the ultimate factory implementation. In my .[previous post of factory method pattern](https://sarkershantonu.github.io/2014/02/02/factory-method/) we knew about a method which works dynamically(run time) by loose coupled objects. In factory pattern we will find every aspect is dynamic.

In factory method we get only a method, but here we get a full class of that factory behavior(that is why it called abstract factory). 

Factory provides facility to create a family of related object(meaning commonly implemented/extend). 

Unlike factory method pattern ,it encapsulate everything 
- Method that ordered the object(Factory)
- Factory that build the object(Product)
- Finally created objects(products by factory)
- Finally created objects' dependent object that use strategy pattern(it is another type, I will elaborate in another post)   

Suppose, we are making **UFO Enemy Ships**. And we have separate factory to build each type of UFO Enemy ships. And, a UFO Enemy ship will have a engine and a gun. 

Our client knows only the ship building contractor and order specific type of ship to contractor. 

Now, think about the abstract factory situation.
- A client will order to a ship building contractor. So, we can implement the contractor as generic with contractor interface/abstract class
- The contractor will take the order and creates different builders for making different ships. So, we can use generic builders and ships.
- The builder add Gun & Engine in the ship. So, again, those gun & engine can be generic. 

So, now we think of those loose couple situation. I have elaborated and explained in detail with another example in code section below. 

- Abstract factory is one of the most uses pattern in Object Oriented world. Though it creates some complexity but, it is most necessary in case of frameworks. 

# Principle :
- Creates objects without exposing the product object creating logic in the client
- Refers to newly created objects through common interface.

# UML :
![uml-abstract-factory](/images/Patterns/abstractFactory.jpg)

# Example : 
Suppose we are making a strategy game like as famous Age of Empires. And we are building houses. 

Every house have some materials, like Door, Window, Toilet, Furniture. There are 3 types of houses, resident, shop, office. 

And to build those house we have separate builders(resident builders, shop builders, office builders). 

And, we have a contractor who actually take the work order from a client(contains main class) and provides to specific builder. So, now think, how to implement abstract factory. 

As we know, it is an ultimate loose couple pattern. So, we have to make Interfaces/abstract class for out main three kind of class

- Interface/Abstract class for each item of a house(window, toilet, door, furniture)
- Interface/Abstract class for house(implemented by all three class). This actually the active product class refer to my previous factory method pattern  post
- Interface/Abstract class for Builder(all type of builder will implement that). This actually the active factory class refer to my previous factory method pattern post
- Interface/Abstract class for contractor(in our example, we have only 1 contractor object but, we will keep that generic so that we can build other contractor)

Most of the cases, I have used Interface in place of abstract class unless when I need to use the global implementation 

So, lets make interfaces for each item of the house. And consider toString() method.(we will use this method to print console which will tell use that the item is created.

I am showing one interface IWindow here, you can see IDoor, IFurniture , IToilet  interfaces from code. 

```
public interface IWindow {
    public String toString();
}
```

And the implemented for resident , shop and office

```
public class ResidentWindow implements IWindow{
    public String toString(){
        return "Size 10";
    }
    public ResidentWindow(){
        System.out.println("Resident window is created");
    }
}
public class ShopWindow implements IWindow{
    public String toString(){
        return "Size 40";
    }
    public ShopWindow(){
        System.out.println("Shop Window is created");
    }
} 
public class OfficeWindow implements IWindow{
    public String toString(){
        return "Size  20";
    }
public OfficeWindow(){
        System.out.println("Office Window is created");
    }
}
```

We can find Door, IFurniture , IToilet implementing classes from code.

**ResidentDoor, OfficeDoor, ShopDoor, ResidentFurniture, OfficeFurniture, ShopFurniture, ResidentToilet, OfficeToilet, ShopToilet**

Now, Lets make houses. So, there will be a abstract class/interface( I have use abstract class for reusing the code) describing the house.
```

public abstract class House {
    private String name;
    public String getName(){return name;}
    public void setName(String newName){name=newName;}   
    IDoor aDoor;
    IWindow aWindow;
    IFurniture furniture;
    IToilet aToilet;   
    public abstract void makehouse();   
    public void displayName(){
        System.out.println(getName()+" is the Name of the house");
    }
    public String toString(){
        String info= "The "+name+" has a door which is "+aDoor+", a window which is "+aWindow+
                " , a toilet which has "+aToilet+" and "+furniture;
        return info;
    }
}
```
And we have 3 type of house(our products), resident , office , shop. I am showing resident only here, see other from code. 

Before that, we need to create our factory class which will be used in those products.

```
//this is abstract factory as interface
public interface IHouseBuilder {
    public IDoor addDoor();
    public IWindow addWindow();
    public IToilet addToilet();
    public IFurniture addFurniture();
}
```

So, in one of product class Resident we use the factory and implement generic way.

```
public class Resident extends House{
    private IHouseBuilder myBuilder;
    public Resident(IHouseBuilder aBuilder) {
        myBuilder=aBuilder;
        System.out.println("Resident house Created");
    }
    public void makehouse() {
        System.out.println("Making house "+getName());
        aDoor = myBuilder.addDoor();
        furniture = myBuilder.addFurniture();
        aToilet=myBuilder.addToilet();
        aWindow=myBuilder.addWindow();
    }
}
```

We will find similar product class (shop & Office) in the code.

So, now we have our product classes , necessary items of product classes and builder interface. 

Lets make builder classes for each type of product. I have shown ResidentBuilder here,

```
public class ResidentBuilder implements IHouseBuilder{
    public ResidentBuilder(){
        System.out.println("Resident builder is created");
    }
    public IDoor addDoor() {
        return new ResidentDoor();
    }    
    public IWindow addWindow() {
        return new ResidentWindow();
    }
    public IToilet addToilet() {
        return new ResidentToilet();
    }
    public IFurniture addFurniture() {
        return new ResidentFurniture();
    }
}
```

You will find OfficeBuilder and ShopBuilder in the code.

Now, we will work on the contractor, who will actually call those builders to build product. Let's make abstract class expressing general contractor behavior and a real class BuildingContractor who extend that class.

```
public abstract class Contractor {
    public abstract House makeHouse(String typeOfHouse);
    public House orderAhouse(String typeOfHouse){
        House myHouse = makeHouse(typeOfHouse);
        myHouse.makehouse();
        myHouse.displayName();        
        return myHouse;
    }
}
//This class is responsible for creating all factory classes to build product objects 
public class BuildingContractor extends Contractor{
    public BuildingContractor() {
        System.out.println("Building contractor created ");
    }
    public House makeHouse(String typeOfHouse) {
        House myHouse = null;
        IHouseBuilder myBuilder = null;
        if(typeOfHouse.equals("Resident")){
            myBuilder = new ResidentBuilder();
            myHouse = new Resident(myBuilder);
            myHouse.setName("Resident House");
        } 
        else if(typeOfHouse.equals("Office")){
            myBuilder = new OfficeBuilder();
            myHouse = new Office(myBuilder);
            myHouse.setName("Office");
        } 
        else if(typeOfHouse.equals("Shop")){
            myBuilder = new ShopBuilder();
            myHouse = new Shop(myBuilder);
            myHouse.setName("Shop");
        }        
        return myHouse;
    }
}
```

So, now let's make client class(contains Main) that calls he house contractor to make houses.

```
public class Client {
    public static void main(String[] args) {
        Contractor myContractor = new BuildingContractor();
        House myHouse = myContractor.orderAhouse("Shop");
        System.out.println(myHouse+"\n");
        myHouse = myContractor.orderAhouse("Office");
        System.out.println(myHouse+"\n");
        myHouse = myContractor.orderAhouse("Resident");
        System.out.println(myHouse+"\n");
    }
}
```

So, its done. we have applied abstract factory in all solution. 

# [Java Example](https://github.com/sarkershantonu/java-novice-to-advance/tree/master/DesignPatterns/AbstractFactory) :
I have added println in every contractor so that we can understand the steps.  

# [C# Example](https://github.com/sarkershantonu/blog-projects/tree/master/DesignPatternsDotNet/AbstractFactory) :  
I have changed some method names as well as calling as dot net works little differently.

### Where we use it?
- Building frameworks/utilities class libraries
- Building APIs
- Building reflection based object creation scenarios.  

# Sources
- [Java Example](https://github.com/sarkershantonu/java-novice-to-advance/tree/master/DesignPatterns/AbstractFactory)
- [C# Example](https://github.com/sarkershantonu/blog-projects/tree/master/DesignPatternsDotNet/AbstractFactory)

### Drawback : 
It might create un necessary complexity, so make sure you need it.  

