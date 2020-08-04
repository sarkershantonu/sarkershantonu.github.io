---
layout: post
title: Decorator Design Pattern
date: "2014-02-06 01:07"
tags: [java,design-pattern,dotnet]
permalink: /2014/02/06/decorator/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java"
gh-badge: [star,follow]
comments: true
---
In this article we are going to learn about Decorator Design Pattern. 
- what is Decorator Design Pattern? 
- What are the basic principle
- How we can implement 
- Where we can use this. 

I am using java with eclipse and c# with VS2010.

# What is Decorator Pattern? 
In a single word, it is a way to add functionality dynamically without changing code of a class. 

So, it works like composition of different object together act like a single object. 

When we need an object extending its functionality dynamically(run time), we use Decorator pattern.
- It is more flexible than inheritance.  
- And, it is helpful when we have new functionality to add but we do not want the code change and

### Explanation with Example
Let's talk more details about a scenario. Think about a Pizza shop order scenario

We have a plain pizza but we can add different type of topping(added items) like as tomato souse, extra cheese, mozzarella. 

So, we have existing plain pizza and we are extending function(ingredient). 

And we have to remember that when we add ingredient, the price added and description changed to notify to customer.. 

So, what it will be? Here are three things
- Plain Pizza, our existing item
- Addable ingredient(we will use a abstract class which is inherited by different type of ingredients) that have authority to change the price and description. 
- Client who actually order the pizza along with his chosen ingredients 

In this scenario, if we use the common interface of pizza type which allows ingredient family to modify the price & description(the added functions) and it is also applied by our plain pizza, then we can solve easily.

- And, the decorator extended classes (added ingredient)will get the plan pizza object to add its features. 

So, we see we can easily implement decorator easily.

It is very important when we design component. 

Suppose we are designing a window. In the run time we want to add Scroll  bar or add a bar like tool bar or add new label etc. We can easily do that with decorator.  

# Target : 
- Modify object dynamically

# UML: 
![uml-decorator](/images/Patterns/Decorator.jpg)

# How to implement that? 
As we have discuses in previous example about how to do that, lets explain more detail with an example. The actual project code share link in the bottom. 

# Example : 
Suppose we have a book publisher who can publish a book like as plain book. The cost was 300 taka. 

It was perfect until there are some new requirement came to management that book publisher have to publish book with some more advance options. The extra options are
1. Books can be printed with offset pages(plain books had normal paper). And for each book offset printing, publisher will change 200 taka extra. Publisher will add a text as description like as added feature. 
2. Books cover can be laminated to keep it safe. And publisher will take extra 20 taka and add a text as description like as added feature. 
3. Books can be covered with foil paper for gift packaging or traveling. And publisher will take extra 10.5 taka and add a text as description like as added feature.

So, let's think , how can we do that implemented.

First, we need an interface(say IBook) where description and value functions are separated( defined as changeable function). 

Usually in the initial stage of designing , software architect used to make changeable behaviors in to interfaces(one or more , depend on kind). 

So, we will find that interface implemented in our existing system(Plain Book).

```
public interface IBook {
    public String getDescription();
    public double getPrice();
} 
```

And the plain book class

```
public class PlainBook implements IBook{
    private String title = "Title : Decoretor Pattern";
    private String auther=" Auther : Shantonu";
    private String description=title+auther+" , this is Simple Book.";
    private double price = 300.00;
    public String getTitle() {        
        return title;    
    }
    public void setTitle(String title) {        
        this.title = title;    
    }
    public String getAuther() {        
        return auther;    
    }
    public void setAuther(String auther) {        
        this.auther = auther;    
    }
    public void setDescription(String description) {        
        this.description = description;    
    }
    public void setPrice(double price) {        
        this.price = price;    
    }
    public PlainBook() {    
    }
    public String getDescription() {
        System.out.println(description);
        return description;    
    }
    public double getPrice() {
        System.out.println("Plain Book Costs : "+price);
        return price;
    }
}
```

Now, we need an abstract class which will be extended by each new feature . Let's call it BookMaker. 

And , as every feature  will change the description and price, so commonly this class will implement IBook. 

And the extended classes will override the method(this is how they add new features)

```
//This is decorator abstract which composite all decorators togather
public abstract class BookMaker implements IBook{
    protected IBook aBook;
    public BookMaker(IBook book) {
        aBook = book;
    }    
    public String getDescription() {
        return aBook.getDescription();
    }    
    public double getPrice() {
        return aBook.getPrice();
    }
}

```

So, the added featured extended classes are

```
//Offset Printing costs 200 taka extra
public class OffsetPrinting extends BookMaker {
    public OffsetPrinting(IBook book) {
        super(book);
        System.out.println("Offset Printing");
    }
    public String getDescription() {
        return aBook.getDescription()+", offset printing";
    }
    public double getPrice() {
        return aBook.getPrice()+200.00;
    }
}
 
//Foli paper covering costing 10.50 taka extra
public class FoilPaperCovering extends BookMaker {
    public FoilPaperCovering(IBook book) {
        super(book);
        System.out.println("Coverd with foil paper");
    }
    public String getDescription() {
        return aBook.getDescription()+", foil paper covering";
    }
    public double getPrice() {
        return aBook.getPrice()+10.50;
    }
}
 
//Lemination costs 20 taka extra
public class Leminate extends BookMaker {
    public Leminate(IBook book) {
        super(book);
        System.out.println("Leminated");
    }
    public String getDescription() {
        return aBook.getDescription()+", Leminated";
    }
    public double getPrice() {
        return aBook.getPrice()+20.00;
    }
}
```

And the client, who will actually create a book as type of that IBook referenced book along with features that it wanted to be added with plain book. In here, client contains Main method.

```
public class Client {
    public static void main(String[] args) {
        IBook rawBook = new OffsetPrinting(new FoilPaperCovering(new Leminate(new PlainBook())));
        System.out.println("Description "+rawBook.getDescription());
        System.out.println("Total Price "+rawBook.getPrice());
    }
}
```

Just look at the book creation, plain book will be called by **Laminate**, which is called by **FoilPaperCovering** and which is called by **OffsetPrinting** . 

So, we have done added function with our existing codes. 

# Sources
- [Java Example](https://github.com/sarkershantonu/java-novice-to-advance/tree/master/DesignPatterns/Decorator)
- [C# Example](https://github.com/sarkershantonu/blog-projects/tree/master/DesignPatternsDotNet/Decorator)

# When we use it? 
- We use it when we want inherited capabilities along with added functionality at a run time.
- With legacy system when we need to extend. 
