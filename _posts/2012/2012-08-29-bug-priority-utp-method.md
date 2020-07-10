---
layout: post
title: Bug priorities in Agile
date: "2012-08-29 02:28"
tags: [testing]
permalink: /2012/08/29/bug-priority-utp-method/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Bug priorities in Agile"
gh-badge: [star,follow]
comments: true
---
This is an article on prioritization of bugs in Agile (Scrum/KAB-BAN) We will discuss on some scenario and mathematical formulas to measure. 

### Roles in Agile
In Kun-Ban/scrum we may see the following roles very interactive.
- project manager,
- product owner ,
- sales team
- sometimes End Users/SQA(optional)

As kan-ban/scrum cares all roles, so based on their feedback the priority should be fixed. In here QA guys can make a very important feedback of their gut feelings.

Let's start in steps : 

#### Step 1 :
First, let’s define the value . Like as tradition, I am suggesting 4,3,2,1 values to your priority. Greater value is shows more importance.

| Priority | values | Cause                                    |
|----------|--------|------------------------------------------|
| Critical | 4      | Very important issue, Major issue, Basic Feature. Main business value, End user importance, stability, performance, security, Crashes |
| high     | 3      | Important but can be partially implemented, Feature missing but user can work with it, less business required. |
| Medium   | 2      | Feature missing but wok ground is there, Some features are not working |
| Low      | 1      | Text, spelling, cosmetic type. can be ignored  or left for future solve. |

#### Step 2 :
Now , it the time to think about which role’s feedback we need to care about. 

###### Feedback from Project manager?
But sometimes he may not know actual priorities about product features (because of development management tasks, parallel projects etc. BTW ,he never interact with end users like marketing people)

###### Feedback from Product owner?
But sometimes he may not know what the user and business need. Because he is focused on product quality and value.

###### Feedback from marketing team?
But they just gather feedback from user and put their own thoughts (some time imaginary) in a sales prospective not in organize way. And also they can't give feedback from the view of company future or product future.

###### Feedback from user?
They are always lazy and ask every thinks must be done with no payment and no effort (I am also a user all the time) . They can give vast features to work on but most of the time they hardly know what to do with it.

###### Feedback from QA guys?
They always think they work for the developer’s mistakes, so more mistakes he found, the more credit they get. Most of the time they get thousands of bugs without knowing what is the most important (because of Bug find prospective). A very good QA can set the priority when he is associated with product plan, business domain and end user. But, most of the time they are biased with development process. So , you can’t say they are perfect.

So, what to do now, will we put all to gather? No, I think we need to focus on what we have here.
- We have a lot of people's feedback.
- We have small development team to solve .
- And we have a dead line to catch.

Let's make them in categories.

###### End User: 
Who really uses the software. More often we don't get chance to work with them directly. But by using survey/feedback we can get the user's main focus on the software. What are their needs, their expectations, reason to buy software. So as user will pay, their feedback is important.

######  Project planners: 
CEO, CTO, Project manager, product owners have their plans on the project( how long they go, how secure they make, what is the company vision, what is the product future, how can they make more intelligent & attractive, how they can impress users to buy the product). So their feedback is important.
Basically this feedback is based on what process they are following for development, i.e. - In agile, if you are focused on performance improvement in a sprint, the performance enhancement related tickets (tasks/bugs/issues) will get higher priority. Or if you focused on refactoring, that relevant tickets will be higher priority. This is very important, because I have seen teams making sprint for software architectural enhancement where a big change increases the overall satisfaction of the product.

######  QA/Development team: 
They directly work with the product on development time. They know most of hidden Ares, weak nesses. More over as the time goes, they can feel & predict how the product will behave from time to time.

So, let’s make a summary & put all them to gather
- Issue id(IV)
- Issue Title
- User value(U)
- Tester Value(T)
- Planner Value(P)

Here, issues ID & Title are related to the issue of what’s priority we are trying to measure.

#### Step 3:
From here we start UTP model(An anonymous name, if you get better, suggest me). I am calling as UTP model as it is involved with User-Tester-Planner. So, now we have 4 variables
1. IV = Issue Id value (The priority value) ,            
2. U = User value             
3. T = Tester Value          
4. P = Planner Value

In Here the calculation which is very easy:  IV = U+T+P

#### Step 4:
But, in real life scenario, we need to focus on priorities based sprint planning. So, now we introduce another constant with all representing process planning. These values will differ from sprint to sprint. This is important because, a software focus should be depend on satisfaction to the whole team (Development, QA, Management, Marketing,Users).

So the formula becomes **IV = Uu + Tt + Pp** where
- u = User Constant
- t = Tester constant
- p = Planner constant

The constant are define before each cycle of sprint.This is very important To specify priority factors for each sprint.
- If you make a sprint on bugs (bug cycle), the priority for testers (t) will be 4(t=4), client/ user(u) will be 3(u=3), planner(p) will be 2/1(p=2/1).
- If you make a sprint on feature implementation, the value may be p=4, t=2, u=1.
By default u=p=t=1. These values depend on cycle/release goals.

#### Step 5:
Now, start a calculation with a scenario. So, let’s consider a sprint of performance improvement. Before starting ,you should have performance testing report on previous build from QA side. Now ,you have to assign values for that sprint .
- t=4 (or 3)
- p=2 (or3)
- u = 1 (or 2)

Now, if a performance bug/issue have

- U=1 (less user will Find the problem, follow 80-20 principle to give values),
- T = 3 (Tester thinks that is medium important as some user will get the bug),
- P = 1(planners will let it leave for future sprint).

So the IV(issue value) of that bug/issue is **Uu+Tt+Pp = 1x1+3x4+1x2 = 15**

Again , If the you are planning for a sprint of UI(user interaction), then u=4, t=3, p=1 .
In here the same bug have **IV = 1x4+2x3+1x1=11**

Again, If the you are planning for a sprint of Feature Implementation, then u=1, t=2, p=4 .
In here the same bug have **IV = 1x1+2x2+1x5=10**

Again , If the you are planning for a sprint of Bug Solve Cycle, then u=2, t=4, p=1 .
In here the same bug  have **IV = 1x2+2x4+1x1=11**

So, depend on your sprint planning, you are prioritizing the bugs. It can be easily integrated to scrum or kan-ban.

### Find the bugs and get the score: 
You may also keep group of the bugs based on value. i.e.
- if a bug has more than 13 IV, then it will be shown as **DEEP RED** Ticket, If IV grater 16  DEEP RED with STAR markings, if IV smaller 11 light RED, etc. (depends on company)

So , you get the priorities, now what?....Just fix the bugs according the priorities..:)

I have made these from the inspiration of [**this link**](http://www.softwaretestingstuff.com/2011/09/how-to-prioritize-bugs-numerically.html) added with my present company's software development process. This is actually very much fit for a large group( 20-50 or more) with a very good issue tracing/ bug tracking system under agile( scrum or kan-ban or modified Kan-Ban). This can help a project planner on task queuing.  