---
layout: post
title: Interface in OOP
date: "2009-05-17 09:01"
tags: [dotnet]
permalink: /2009/05/17/interface-oop/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Interface in OOP"
gh-badge: [star,follow]
comments: true
---
In this article, we will try to understand  Interface
Definition : We can define interface in different perspectives. They are as follows

Syntactically: Interface is a pure abstract class. Interface is a class which has to be defined (with functionality) to its implemented classes. That means if any class implements any interface that particular class has to implement the methods declared in Interface.
In c#
Interface {

return-type method-name1(parameter-list);

return-type method-name2(parameter-list);

type final-varname1 = value;

type final-varname2 = value;

// ..

….

….

return-type method-nameN(parameter-list);

type final-varnameN = value;

}

Methods won’t be implemented

Attributes will be fixed valued. (Like #define in c) 
Declaration for a class

public Class :

{

// implementation

………..

…………

}


Symmetrically: Interface if the certain restricted set of rules that must be followed by the implemented classes. It means if in a problem domain a interface is declared as standard following. Then the classes have to follow through the interface, which addresses the problem domain.

For example: If our problem domain in making a bank account management software then the interface Account (let) must be implemented among various types of accounts. More likely

Account interface defined as…..( Only functions)

<!--[if !supportLists]-->a. <!--[endif]-->Order Cheque Book

<!--[if !supportLists]-->b. <!--[endif]-->Deposit amount

<!--[if !supportLists]-->c. <!--[endif]-->Withdraw amount

<!--[if !supportLists]-->d. <!--[endif]--> See current balance

In that problem domain Let us consider in bank there are 2 type of accounts

i. Savings Account

ii. Current Account

So, Those two types of account must follow ( let them implement) along the structure of the interface account . They may have additional functionalities but they must follow the interface.

#### My Thoughts:

- Interface generally refers to an [**abstraction**](http://en.wikipedia.org/wiki/Abstraction_%28computer_science%29) that an entity (class) provides of itself to the outside world. For example the interface between a human and a computer is called a [**user interface**](http://en.wikipedia.org/wiki/User_interface).

- Interface is more like gate (for understanding) which through the world knows any module / process block / Class .Or a box (real world object) with predefined holes (interface) to serve its purpose. 

- If a class implement any interface , that means the class must have some pre-define outputs and accepted inputs which are describe in that interface. It is the communication between real life object to the real problem domain.

- Interface is more efficient from the design point of view. In a problem domain if interface is defined that means how it is implemented it is no one’s concern but what the result, is the main subject. It keeps the classes more encapsulated. That’s why Interface relation is called loosely coupled. Interface is the one of major issue in design pattern. Suppose we are making a module that has a particular goal. That module may have many functionality to serve. If we decompose (break into small modules) that into small modules and if some those small modules do exactly same work like invented or old (by others) ones then we can add those invented others’ modules in my module. This is called module incorporation. We should focus on here that we don’t need to know how the others modules work. We just know what it serves. This incorporation occurs due to Interface (implemented in old modules). We just incorporate the modules that implement the Interface which’s output we need in our particular design. For example in account management software if we decompose the problem in small parts, let we need a module that does data communication. That purpose is making a module that does data communication between application & database. There are some standard interfaces that must be implemented in the particular module so that outer world can use this.

- The particular interface used by the module make the module more Reusable & Encapsulated. 

#### clear conception:
In computer hardware (in Mother board) there are some standard interfaces to connect each modules (separated hardware does different function like agp, sound card, tv card etc), like as PCI slot, AGP slot, USB port etc. If some devices can be connected in PCI slot, it means those devices must implement the rules of PCI slot like No. pins, Voltage, Response time, Data band width (33Mhz) etc. Or if we consider USB device, every device must have 4 pins considering no 1 & 4 is for voltage 5v & others are data passing and supports maximum 480Mbps & Minimum 1Mbps.


####  Benefits:
- As c# follows single inference multiple Interface implementations keeps like as C++ multiple inheritance. It is loosely coupled.

- aData encapsulation implemented more dynamically (from design issue). If we use popular interface (by following design pattern) our classes can be used by all in the world. So re usability becomes superior issue.

- As In interface Methods are declared so it permits polymorphism between classes with different base classes.

#### Barriers:

Like as class we can’t just edit a published interface. It means when declared or published that is final. If we upgrade then it will be new (May new versions).Editing will make the exist code useless.

#### Features:

Like class Inheritances can be inherited. Same rules like as class to class , in respect method to method.

Partial Implementation can be done by Abstract Class Inheritance relationship.

...............................(Need) to be continued
