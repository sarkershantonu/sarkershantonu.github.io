---
layout: post
title: Extract Email by Regular Expression
date: "2013-07-05 03:51"
tags: [regex]
permalink: /2013/07/05/regex-link-validation/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Regular Expression"
gh-badge: [star,follow]
comments: true
---
![image](/images/regex/regex-tut-1.jpg)

In this article, we are going to see how we can retrieve different information from an email address. To know regular expression basics, please see [this old post](https://sarkershantonu.github.io/2013/06/29/regular-expression-intro/).

### What is a Link?
First , we have to identify , what is the characteristics of a **web link**. The generic formula of a link is ```scheme://host.domain:port/path/filename```

### Retrieve with analysis
- A link start with a schema like as http, https, ftp. So, for this part, expression should be ```(https?|ftp)```. I use, http and https together.  
- Then it comes ```://``` so , the expression of this part should be ```\:\/\/``` or we can use simply defining ://
- Then it may come **www.** Sometimes it is www1 or www2. Sometimes we may not find www. Sometimes it is the sub domain name(like as mantis.shantonu.com). Sometime there is nothing, direct domain names. So for this part the expression will be
    - For www or www1  : ```www\d?```
    - For sub domain : ```[a-zA-Z0-9]+```
    - For making this two together and OR operation : ```(www\d?|[a-zA-Z0-9]+)```
    - And the full statement is option(as there may be direct domain name) :  ```(www\d?|[a-zA-Z0-9]+)?```

- Then the domain name comes , so expression will be ```[a-zA-Z0-9-]+``` , considering all characters with ```-```.
- Then we get either com, org . This part is not fixed now a days.(in India some sires have co.in then in Uk co.uk port). So , expression will be ```[a-zA-Z0-9.]+```.

And, in this section, the port address can also be present, which is also optional . So expression will be. (\:\d+)?. So, if we add both in a single manner , ```([a-zA-Z0-9.]+|(\d+)?)```

- And, then the path after the **port/domain** Type. This might have any type of character(Unicode). So,for this part the expression will be : ```([/?].*)?```

### Finally 
So, finally , the regular expression will be ```(https?|ftp)://(www\d?|[a-zA-Z0-9]+)?\.[a-zA-Z0-9-]+(\:|\.)([a-zA-Z0-9.]+|(\d+)?)([/?].*)?```

OR ```(https?|ftp)://(www\d?|[a-zA-Z0-9]+)?\.[a-zA-Z0-9-]+(\:|\.)([a-zA-Z0-9.]+|(\d+)?)([/?:].*)?```

**Note** :  I have added  ```(\:|\.)```  as, there can be colon : with **port** or dot . with domain type name.

Thanks..:)