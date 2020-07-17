---
layout: post
title: Field Info by Java Reflection
date: "2014-08-03 01:02"
tags: [java,reflection]
permalink: /2014/08/03/java-reflection-field-info/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on java Reflection"
gh-badge: [star,follow]
comments: true
---
In this article we will see how can we retrieve Filed Information using Java Reflection

Please read this [**post**](https://sarkershantonu.github.io/2014/08/01/java-reflection-class-info/) before follow post. 

## How to get all declared Fields ? 
This means , we will get the fields names which are declared inside of the class(public , private, default, protected). 

This is similar to what we did while method name extraction. 

    public String[] getAllOwnFieldNames(){
            ArrayList<String> allFields = new ArrayList<String>();
            for(Field aField : myClass.getDeclaredFields()){
            allFields.add("Field Name : "+aField.getName()+" , Full Name : "+aField.toString());
            }
            return allFields.toArray(new String[allFields.size()]);
        }

## How to get all Fields accessors?
(which includes inherited fields of its own, super class and full hierarchy) 

That means , we will get fields which are included in the class and the method which are taken from its parent class.(following full hierarchy)

    public String[] getAllAccessableFields(){
            ArrayList<String> allFields = new ArrayList<String>();
            for(Field aField : myClass.getFields()){
                allFields.add("Field Name : "+aField.getName()+" , Full Name : "+aField.toString());
            }
            return allFields.toArray(new String[allFields.size()]);
        }

**Note** : 
- in both cases, I used **getName()**, and **toString()** get full information. 
- And , for both scenarios we can get access to the fields by specific names.

```
myClass.getDeclaredField("StingName");
myClass.getField("StringName");
```

And, we need to know the field name . 

Thanks..:)
