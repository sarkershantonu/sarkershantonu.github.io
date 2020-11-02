---
layout: post
title: L10N testing
date: "2013-06-29 03:51"
tags: [regex]
permalink: /2013/06/29/regular-expression-intro/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on L10N testing"
gh-badge: [star,follow]
comments: true
---
In this article, we are going to learn basic Regular Expression.

### Why Regular Expression(Regix)
Regular expression is one of the daily necessary items for a developer as well as tester. My focus will be on how to cover both side. I personally use regular expression
- Jmeter, Gatling, Load Runner for extracting information from response data/headers/cookie/url
- Data Scraping, for extracting information from any HTML/CSS/XML element
- Selenium webdriver, for finding element
- Robotium, for finding element
- Genie, For finding element.
- NodePadd++ to modify regex based information.

So, my focus will be the basic terms and examples which are used by me.

First, let's have an idea about what is Regular Expression. A regular expression is the set of characters containing symbolic and literal meaning, together they create an expression that matches like as pattern match from a given character set. Detail description, you may find in [wiki](https://en.wikipedia.org/wiki/Regular_expression). The main objective is , getting objective character set from given set of characters.
So, a regular expression activity will have 3 parts.
a. Given text or set of characters or a doc( text/html/xml or any)
b. Pattern to match( the regular expression)
c. Matched Array(the result set)

Before start writing Expressions, we need to know some string meaning(literal) in the regex. Let's use see in the rgular expression the meaning of the symbols.
a-z - Letters
0-9 - Digits
A-Z  - Capital Letters
. - any character

\d - any digit(single character)
\D - any Non Digit character
\. - Period
\s - white space
\S - any Non White space
\w - any alpha numeric character
\W - any non alpha numeric character

^ - starts with indicator
$ - ends

( ) - makes/captures in a groups
(a(bc)) - makes/captures in a sub groups
(.*) - makes/captures variable content
a|b - matches a or b

[abc] - only one of a, b or c
[^abc] - Not of [abc], means no a/b/c
[a-z] - any single character of range a to z
[A-Z] - any single character of range A to Z
[0-9] - any single number between 0-9, it is similar to \d

{m} - m Repetitions
{m,n} - m to n Repetitions
* - 0 or more Repetitions
+ - 1 or more Repetitions
? - optional

So, what are those. Those are meaning in the expression. Example - if our data string is like abcdefgh123ijklmnopqrstuvwxyz
and we need to find 123 from there. so, our regular expression will be simple
123
we can add some intelligence here..  what if we do not know the value is 1,2 or 3. If it was told to use that 3 adjacent digits. so , our expression will be
\d\d\d
If we do more smarter way, as there is 3 times digit we ca write the same thing in this way
\d{3}
If, it was mentioned that we will have a digits but there can 1 digits minimum and max 3 digits. Then expression :
\d{1,3}
If we make a stile change , say, we want to have at least 1 digit to and up to infinite(all digits serially), so the expression will be
\d+

I will provide several useful regular expression example with explanations in separate post.
Here are some useful tutorial
1. For learning basic with JAVA
2. To practice
3. To do experiment or test before apply , use this tool "The Regex Coach"

And for advance users , you may see this. It's a very enlarge support for JAVA.

Thanks...:)...