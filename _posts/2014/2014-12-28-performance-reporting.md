---
layout: post
title: Performance Reporting
date: "2014-12-28 10:35"
tags: [performance-testing]
permalink: /2014/12/28/performance-reporting/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Performance testing"
gh-badge: [star,follow]
comments: true
---
In this post we are going to learn what are the things need to be included for report after performance testing, results and analysis. This is typically as integration of performance results. 

This document communicates with different type of people interested with performance testing. 

# What is performance report?
After a successful performance test execution, we testers has to provide a report based on performance results. I am referring that report not raw results. 

A report should be fully formatted based on requirement and targeted for specific people or group of people.
First of all we need to know what does reporting means. I have seen lots of performance reports with very much technological terms with a lot of numbers. yes, that is what we performance testers do.

But, what I found, every one is not very good with those numbers. Actually, i think, those numbers **does not mean anything** if there is no certain **context**. 

So, how can we get context? Its not that hard. Performance testing is related to certain type of people in the group. And, a good performance engineer should add value with those results by analyze them based on different goal and requirements. 

Please read performance [**goal**](/2014/12/15/performance-test-goals/) and [**requirements**](/2014/12/16/performance-requirements/) before this. 

So, after getting requirement we have to make reports. I will give an example of web application(financial domain) to have better understanding. So, lets discuses what should be the steps.

# Step 1 : Analyze the results : 
This is very fundamental. We have to analysis the results. I believe, analysis is same important as performance test run. This actually get real value for the test execution and can pinpoint the problem. 

And, a performance tester should have that capability unless where is the skills. He has to analyze and define the issues may or may not be there.

So, based on the goal and requirements we should gather information and categorize them .

### Example : 
we have a financial software that does transactions (debit, credit) with a lot of approval process. So, we have a lot of people interested among those transaction results (all business , marketing and software team). So, we categorize rest results in those grouping and show repot to only related groups.

Next is, we do, matching requirement with grouped data.
- What were the goals for these kinds of people?
- What were the primary requirement and target?
- What is the actual value and how far we are from expired? 
- What are the impacts? Impact based on revenue , client feedback, prestige of the company, interaction to another system etc.
- What are the causes? Architectural problem,database problem, application problem, human resource skill problem, process problem, resource problem, deployment problem etc. 
- What are the evidence of those causes? What are those related values? How much the project can tolerate and how much they cant. We might need to use profilers along with performance test tools. Like Ants memory profiler, Yourkit profiler, or even framework build in profiler(on the language platform that you are using).
- What are things can be done to resolve those?

This part is tricky, a new performance tester may not come up with this, but he can talk to his system architect or lead to come up with solution. 

In my current project , I am trying to do. I am proposing possible solution and discuses with dev lead about those and we sit together and do some experiment to suggest the best solution that match with existing architecture. 

BTW, there can be issues with architecture, I have seen this in 2009, where I was involve with a product that could support some amount of users, (avoiding to be specific). 

To scale up the software, our team have to change the full architecture of the application to support almost 4oo% more

So, we have done some analysis. We can do a lot more in analysis. 

Usually, if you are doing analysis with performance results for a product for the first time, you will get a lot of issues and need a large time to do that. But, gradually time goes, issues will be solved.

# Step 2: Group Data :  

After analysis, we need to select what data should be involve with each group. 

This is king of tricky if you do not know the interested group. 

First step should be know those people and have some idea on how to communicate them. 

I think, performance report is just a communication format of you performance results. So, you have to very careful in this. It should be based on goal. 

Let me give **example** from project, (web app). We have 3 kind of people interested with performance testing.

### Business users or client : 
They are real users interact with the system. They do trading by them self. So, for them, the high priority is , how fast we can do business transaction. 

A transaction includes multiple steps and involving approval, so how fast we can do that. Think, if we add anything like throughput or request size or bandwidth measures, it will not get as much attention as the time for each total business transaction. 

And, as they are paying, we have to ensure, after each build/release we are not decreasing. And , if we decrease, there should proper explanation from development team.(like, new feature, DB shifted, adding more security etc).

### Product Stakeholders(all CxOs, BAs and Managers): 
These people are not like business users, they know the basic of inner system component but most of the time i found they want to avoid technical details. 

They interested same as users on those values, but they not only need to know time values, they also want to know more detail regarding what is causing those. 

And, if you include how to resolve those in minimal cost (with cost measurement) , believe you will be appreciated . Believe me, if you add those work values and your findings, these people will be interested more in performance reports.

### Development team(DEVs or QAs): 
These are people are from development team. We used to attach raw results with report. 

In their report , things are little different. We start with problems, and explain those problem, provide them evidence with reproducible way(even teach then how to use performance tools ), and some guidance how to solve them like best practices, code samples, tricks people have used so far. 

And, as graph, we give them detail timing. Like , throughput, size, hit to server, server processing time , db request time, post/get request individual time), resource time with expected measurements.

# Step 3: Arrange reports :Drive Shared Example
Like as all other report, typically a repot contains (I am adding common for all groups)

- First page with **Heading as Home** where product name and performance testing
- A page for **Table of content**
- **An introduction**: This will keep people on context. Add objective of the report in 2/3 sentences.
- **Summary**: It should contain what is the final outcomes. Pass/fail/improvement areas.
- **Test Objectives**: Why we testing? This should contain the requirements in bullet format.
- **Test Strategy**: This contains, what was the plan, which tools was used, what tools for analysis or debugging.
- **Test Overview**: How it was tested, during testing, what were the situation, what were monitored, what were the observation.
- **Test Scenario**: What are scenarios involved in test execution (It may be presided based on group of users)
- **Test Conditions**: Test conditions based on tool, environment, application settings and configuration including delays.
- **Load Profile**: How user was generating load during test. Jmeter/ Load runner or all other tools provide this. You can take screenshot of the graph and add here. Like, 100 user, 1 hour, 500 users 3 hours like this with graph.
- **KPI**:It is optional. It is called Key Performance Indicator. Based on requirement , each group need to know a value that indicates performance situation of the product. Usually it drives future investment and activity.
- **Results**: Tabular results, common for every tool. JMeterprovides summary results or Synthesis Report. Some times, this can be optional to hide detail results from end user/business users. We used hide them.
- **Results Graph**: All graphs based on tabular results. We should be very careful in this area. We should put only related report here. We have see the goal and requirements and then decide. I mean, put the context with each graph. Ask yourself, why this graph you use.

For **example**, in our project, we include only transaction comparison graph for business users.

But, for stakeholders, we added Throughput/min, Hit/Sec, Error% over time and user. Etc.

And, for developers, we include al most all type of graphs following jmeter listeners. And, graphs with raw request reference not in business transaction so that each step can be shown.

### Notes:
- Some time we might have to change the unit of the results for better graph, like through per second to per minuets. It should be based on what are your value in range. 
- Please be careful to add at least 1 line to describe each graph before putting them in report.

### [shared example/template](/files/performance-testing/Performance-test-report.docx)

### Product Analysis : 
This part should be shown only to DEV/QA team. if interested, to stakeholders. 

This is very important part if you consider about project. Put all necessary part based on your analysis here, specifying issues with evidence.
- This might include detail report separately. 
- This might have detail screenshots with different tools.

###  Suggestions : 
This part should be based on group. Suggestions for business user report should be more generic way , at best reference with UI.  

For stakeholders, it can be referenced with product module or resource(like DB server, app server). 

But for DEV team , it should be pinpointing solutions or best practices. 

This whole area is based on project context, so use it sensibly. 

Try to be more generic and non technical in language( I have learn this in hard way..).

###  Conclusion : 
This section should contain, 3/4 sentence defining performance status and things can be considered for testing in future.

###  Appendix : 
This section should have detail definition on the terms we have used in whole report. 

Usually what is throughput, hit per second, transaction, average, min, median, 90% line etc should be defined here.

# Step 4: Report Format :

Performance reports can be in provide in PDF, DOC, Excel or even Power point format. 

It really based on your company or working group. If you don’t have any standards, just follow any other report of you project. 

It is not that important unless your group maintain a system that reads the report and shows to other people. In that case you have to be specific  on file specification. I personally like PDF edition.

### Notes :
- Some time we need to have section for report document summary.
- Some reports might have a section for who will see this report.
- Some reports may have less sections than example, just making sure that it follows your requirements.

So, have performance report with context. and have priority for the management in performance test activity.

Thanks..:)