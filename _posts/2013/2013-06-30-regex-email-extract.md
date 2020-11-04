---
layout: post
title: Extract Email by Regular Expression
date: "2013-06-30 03:51"
tags: [regex]
permalink: /2013/06/30/regex-email-extract/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on L10N testing"
gh-badge: [star,follow]
comments: true
---
![image](/images/regex/regex-tut-1.jpg)

In this article, we are going to see how we can retrieve different information from an email address.

### The Email Format 
Normally we have email address like **sarker.shantonu@gmail.com** and some time we may find **sarker.shantonu+abcedd@gmail.com** , but due to implementation rules , we omit the characters after+ . 

So, we need to retrieve information from a valid email address. What info can be retrieve?
- Domain Name(in example gmail.com) 
- User name

### Retrieve with analysis
So, let's take the complex data as  sarker.shantonu+abcedd@gmail.com

In here, the domain name start from @ and then small letter words, here can be capital and numbers. 

And end will be up to dot(not including). So, our regular expression will indicate a alphabet/ numeric number from beginning and end which can be one or more(to accurate 2 or more)

So, for domain name extraction, it will be ```@[a-zA-z0-9]{2,}``` 
- In here max limit is not mentioned, so I keep it blank ```{2,}```. And ```[a-zA-z0-9]``` means, any character range a to z or A to Z or 0 to 9. 
- To  simplify, ```@[a-zA-z0-9]+``` will results same but ```+``` refers to 1 or more existence of the character set. 

Now, we need to get the username. A username start with any of numeric or alphabetic character, ends with numeric or alphabetic character, and in between them it can contains dot(.) , Dash(-), underscore(_). 

So, our regular expression will be  ```[0-9a-zA-Z]*[-._\w]*[0-9a-zA-Z]```
- ```[0-9a-zA-Z]``` means any character a-z or A-Z or 0-9.
- ```*``` means previous charter set can be repeated 0or more time
- ```[-._\w]``` means it can have - or . or _ or any alphanumeric character
- ```*``` means previous charter set can be repeated 0or more time
- ```[0-9a-zA-Z]``` means any character a-z or A-Z or 0-9. 

### Finally 
If we now, use grouping both where first group will show user name and the 2nd group domain. Then our expression will be like as below ```([0-9a-zA-Z]*[-._\w]*[0-9a-zA-Z])@([a-zA-z0-9]+)```

so, we have our user name and domain in separate group.

Thanks....:) 