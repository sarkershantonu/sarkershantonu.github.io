---
layout: post
title: Composite Design Pattern
date: "2014-02-08 01:07"
tags: [java,design-pattern,dotnet]
permalink: /2014/02/08/composite/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java"
gh-badge: [star,follow]
comments: true
---
In this article we are going to learn Composite Pattern. 
- What is composite pattern? 
- What are the basic principle? 
- How we can implement 
- where we can use this.

I have used mainly Java with eclipse, and c# with VS2010.

# What is composite pattern?
By the name we can understand it actually associate with composition. 

In OO world when we need an tree data structure where both branches as well as nodes will be treated uniformly then we will use composite pattern. 

As, it seems related to tree structure, it might looks complex, but if we have clear conception then we can easily understand. 

Lets discuses further with examples. Think of a file system. A file system contains folders and files. A folder also contains folders and files. 

So, file as leaf and folder as root of several files as well as folders makes a complex structure to handle with. And, among files and folders there are some common set of functions & properties.  

Or, a company, where every one is a worker. There are supervisors who can supervise another supervisors as well as workers. So, it makes a tree structure. And head of company is also a supervisor. 

- Composite pattern allows individual object and composition of object uniformly
- Composite pattern allows us to represent part-whole hierarchies (components can be divided into smaller components) . So that we can structure data or represent the inner working of every part of a whole object individually.
- Composite pattern is used to separate abstraction from its implementation(so that both can be modified independently)

### elaborate with example 
Suppose we are making a song library. In here , we will have
- Individual song
- A Group of song
- The client(like a library) who creates the list of all songs along with grouping.

**Note**: For helping we may add more types but, these three are basic

In here, a group of songs contains songs as well as more groups.

A song and a group contain some information which are specific to it self as well as some information which are common. 

And the client contract the tree and use that. (like as song library arrange all songs) 

Now, think of how to implement that.

Composite pattern allow use to do that. Like, if we make an abstract class contain common information of group & songs. 

And extend separately to songs and group songs. And If we call group or a song from the abstract class then we can treat both commonly where as a group can contain another group as well as another class. 

So, this is how the composite pattern works , Remind that, we may use Interface but then we may have to treat them separately(not calling from interface) but we can still composite them (as tree). I will elaborate in our example. 

### Principles:
- To compose object into tree structure to represent part-whole hierarchies
- Client can treat individual object as well as composition of object uniformly. 

# UML :
![uml-composite](/images/Patterns/composite.jpg)

# How to implement?
As for principle, we see that there are 3 main roles.
- Leafs , the class that can not have child.
- Composite object that contains add/remove or all other operations to its child component. That means it also have the container of its child. (I have used an array list in the example)
- Component, an abstract class defines common behavior/function for every element of the tree(object hierarchy). It will be the base class of the tree and every one will be initiated referenced by this.

#### Example : 

Lets think about a Book Store. A book store can store a many single books or can store many book stored in different kinds like children book, travel books, fiction books. 

And each of the kind consist of either many book or kind of book. Like as, children book contains many books as well as kind of books like fairytale books, child fiction books etc. 

I have used, **robindronath tagore** books, **rokib hasan**'s tin goyenda and **Masud rana**'s book in the example . 

All of them are great writer in Bangle Literature. So, in here we have a Abstract class which contains the common function(in here display book info). 

You will also find an interface doing the same in the project.

```
public abstract class BookComponent {
    //Book type related task , so exception for book as leaf 
    public void add(BookComponent aComponent){
        throw new UnsupportedOperationException();
    }
    public void delete(BookComponent aComponent){
        throw new UnsupportedOperationException();
    }
    public BookComponent getComponent(int index){
        throw new UnsupportedOperationException();
    }
    public String getName(){
        throw new UnsupportedOperationException();
    }
    public String getAutherName(){
        throw new UnsupportedOperationException();
    }
    public int getPublishedYear(){
        throw new UnsupportedOperationException();
    }
    //This is common function, if we implement only interface we can put it in interface
    public void displayBookInfo(){
        throw new UnsupportedOperationException();
    }
}
public interface IComponent {
    public void displayBookInfo();
}
```

And, Implementing Leaf, Book class

```
public class Book extends BookComponent{
    String name;
    String autherName;
    int publishedYear;
    public Book(String bookName, String author, int year){
        name=bookName;
        autherName=author;
        publishedYear=year;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getAutherName() {
        return autherName;
    }
    public void setAutherName(String name) {
        this.autherName = name;
    }
    public int getPublishedYear() {
        return publishedYear;
    }
    public void setPublishedYear(int publishedYear) {
        this.publishedYear = publishedYear;
    }
    public void displayBookInfo(){
        System.out.println(getName()+" was published by "+getAutherName()+" in "+getPublishedYear());
    } 
}
```

And we have a Book Type/Group class act as container of same type books. So, it will contain a list of its leaf. This is actually a node who have leafs. Even, the root of the node(all books) will be a kind of this. This class actually holds the tree structure. But still we need client to build tree.

```
public class BookType extends BookComponent{
    ArrayList books = new ArrayList();
    String typeName; 
    String typeDescription;    
    public String getTypeName() {
        return typeName;
    }
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    public String getTypeDescription() {
        return typeDescription;
    }
    public void setTypeDescription(String description) {
        this.typeDescription = description;
    }
    public BookType(String name, String des){
        typeName=name;
        typeDescription=des;
    }
    public void add(BookComponent aComponent) {
        books.add(aComponent);        
    }
    public void delete(BookComponent aComponent) {
        books.remove(aComponent);        
    }
    public BookComponent getComponent(int index){
        return (BookComponent)books.get(index);
    }
    public void displayBookInfo(){
        System.out.println(getTypeName()+" "+getTypeDescription());
        Iterator i = books.iterator();
        while(i.hasNext()){
            ((BookComponent)i.next()).displayBookInfo();
        }        
    }
}
```

And, a client who build tree using type component & leaf component.

```
public class Client {
    public static void main(String[] args) {
        BookComponent tinGoyendaSeries = new BookType("TinGoyenda", "Written by Rokib Hasan");
        BookComponent masudRana = new BookType("MasudRana", "Written by Kazi Anawar Hossain");
        BookComponent robindroNath = new BookType("RobindroNath", "Written by Robindro Nath Tagor");
        BookComponent allBooks = new BookType("Book List", "All available books");
        allBooks.add(robindroNath);
        robindroNath.add(new Book("Gitanjoli","Robindro Nath Tagor",1905));
        robindroNath.add(new Book("GolpoGuccho","Robindro Nath Tagor",1908));
        allBooks.add(masudRana);
        masudRana.add(new Book("Varot Nattoyom","Kazi Anawar Hossain", 1967));
        masudRana.add(new Book("Agni Purush","Kazi Anawar Hossain", 1969));
        allBooks.add(tinGoyendaSeries);
        tinGoyendaSeries.add(new Book("Jhamela","Rokib Hasan",1994));
        tinGoyendaSeries.add(new Book("TusarMeru","Rokib Hasan",1993));
        BookShelf myShelf = new BookShelf(allBooks);
        myShelf.getBookList();
    }
}
```

My Extra class **BookShelf** only helps me to display info. I use it for better separation of understanding.

```
public class BookShelf {
    BookComponent newBookList;
    public BookShelf(BookComponent bookType){
        newBookList = bookType;
    }
    public void getBookList() {
        newBookList.displayBookInfo();
    }
}
```

# [Java Example](https://github.com/sarkershantonu/java-novice-to-advance/tree/master/DesignPatterns/Composite) : 
1. I have added an extra class BookShelf 
2. I have not use  the interface. 

# [C# Example](https://github.com/sarkershantonu/blog-projects/tree/master/DesignPatternsDotNet/Composite) :
1. I have changed some get methods as property
2. Some naming have been changed due to different implementation.  

# Sources
- [Java Example](https://github.com/sarkershantonu/java-novice-to-advance/tree/master/DesignPatterns/Composite)
- [C# Example](https://github.com/sarkershantonu/blog-projects/tree/master/DesignPatternsDotNet/Composite)

