---
layout: post
title: What is PreQA or Dev testing in Agile?
date: "2012-09-25 01:03"
tags: [testing,agile]
permalink: /2012/09/03/pre-qa/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on PreQA or Dev testing"
gh-badge: [star,follow]
comments: true
---
In the following article we are going learn major testing activities in Agile(both Scrum & KanBan). This might drive your team faster release and less bug cycle & maintenance. 

### What is Pre QA? 
Pre QA by word definition, some processes or tasks done before real QA. In another word, when we do testing beside developer before the code committed to main trunk , that is called pre-qa. After Pre-qa pass , the work will be ready to QA. We can say, it’s more like development sand box testing
The main goal is for pre-QA to get issue(ticket) ready for full QA .

### How to do Pre-QA/Dev Testing
- Pre -QA is always a On Developer’s call( developer’s demand). In many team it is must do, but better On Developer’s call as it will instantly find the bugs and developer need to have the mindset. 

- Pre -QA is always done before code committed to main trunk(not even local committee)

- Pre -QA is always done on developer’s PC side by side(like pair programming, where QA will be the driver & the may be the developer himself)

- On a Pre-QA, a SQA Role is like as Driver (Ref- pair programming). The steps a tester should do.
    - Read the full ticket before coming to developer’s environment
    - Spatially read the comments & define the scopes
    - Keep the major test areas/paths before coming
    - Double check the ticket on satisfying the FRS/SRS before coming
    - With the developer, first listen the full ticket/job about from developer
    - Then discuses with reading the ticket & define the scope for testing
    - Define the paths to test
    - Do the tests with keep eyes open to find bugs & behavior of the product
    - On fail, no argument, Just make a list of failed cases and give to developer
    - Keep a list of possible fail areas for further necessary (from observation during Pre-QA) and if possible comment / discuses with QA team and have listed for checked items before release or integration.
    - When developer will come up with solved list (provided in pre-qa), do the test paths again.
    - Some case will verify, some cases won’t and some new faults will rise up.
    - Now, Notify to QA Lead and project manager or product manager.
    - In here, the scope will be specified. Some will go to known bug, some will move to next sprint or rescheduled and some will go to QA box.
    - Now, QA will take a build, verify the solved & unsolved issues, and post the unsolved issues with the reference(build no) in the bug tracker as well as Agile board.  

- On a Pre-QA, a Developer role is as Navigator 
    - Open the ticket read with the SQA
    - He should discuses about scope & effect of the code that he has done.
    - He might show the changes in the modules related to topic( detail understanding for code effects)
    - He can show the design diagrams to SQA
    - If , Frontend work involved, Mock-Ups should be shown to verify. 

- Time limit 
    - 10 min default
    - Best practice 5 min
    - Maximum 15 min  on EPIC ticket

### Merits: 
- Faster delivery tickets(quick builds & Rapid development)
- Stop wasting time on reporting/reading/communicating with bugs(less posted bugs)
- Discuses more on issues for better understanding among the team(developers or QA members)
- There will be no unknown areas to anyone with More knowledge about business requirement
- Team became more careful on product ( I have seen many developers showing bugs while doing pre QA)
- Product become more stable before release and the risk factors become less. 

### Demerits: 
- Developer/QA members may react on the Pre-QA. A negotiation and professional attitude may resolve the issue( a senior may involve initially to clarify the necessity among the team)
- It does not follow the traditional testing process.
- Some issue may be easily miss-judge or overlooked or forgotten if notes are not carefully taken care of. 
- Senior QA members preferable for initial Pre-QA process, so hard for newly QA member to adopt the process and attitude.
- Large number of team(200+) may face some difficulty to follow all the procedure if they are not properly grouped.

### Pre-QA , Why & when? 
Well, if you look at the above article, it’s very clear that pre-qa eliminates un necessary documentation, bug reporting, bug investigation time(both qa/developer). 

So, when we need a rapid development, when there is small release time, which will be perfect situation for Pre-QA practices. 

Pre-QA not only boosts up the development process, but also increases the interpersonal relationships among team. A team of 20-60 members , can easily follow the pre-qa process along with agile board. If the team is in large scale, they can also follow this by grouping them into small team(scope wise). 

And, for following best practices of agile, pre-qa is unavoidable to ensure quality products in quick time. 

Thanks :) 