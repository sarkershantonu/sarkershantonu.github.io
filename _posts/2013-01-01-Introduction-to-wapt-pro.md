---
layout: "post"
title: "Introduction to WAPT/WAPTPro"
date: "2013-01-08 17:54"
tags: [blog, wapt, wapt-pro, Performance, Performance-testing]
permalink: /2013/01/08/Introduction-to-wapt-pro/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on WAPT/WAPTPro Basic"
gh-badge: [star, fork, follow]
comments: true
---

In this article, We are going to see how to use WAPTPro. This is an introductory learning for invoice testers like me. I hope it will help others also. I haven’t tried anything complex, just small concept of testing with an example. 

First see the requirement of PC and install from [here](http://www.loadtestingtool.com/download.shtml). I have user WAPTPro trial edition 

What is WAPT? WAPT is a tool for Performance Testing (load and stress testing) on a website (with load balancers, web servers, application servers, database storages, etc) in an easy manner. For more, see their [link](http://www.loadtestingtool.com/).

# Basic : WAPT follows
-One execution runs under one user session.
-A virtual user (VUser) may consist of several user sessions.
-A virtual user operates under several user profiles. Different profile simulates different type of user. 

-Load agents run Virtual Users. (A Load Agent is installed as a Windows service on your system during installation, we can configure that).

-We can run load agent manager(from start menu) to manage multiple agents.
 
- Load Agent installation
![LoadAgentinstallation](images/wapt/Load_Agent_installation.png)

- LoadAgent
![LoadAgent](images/wapt/LoadAgent.jpg)

- LoadAgentManager
![LoadAgentManager](images/wapt/LoadAgentManager.jpg)

- LoadAgentManagerAccounts
![LoadAgentManagerAccounts](images/wapt/LoadAgentManagerAccounts.jpg)

- A scenario consist of Settings and Configurations (Test Volume, Log/report settings/Performance counters)

- A Test Volume may have multiple User Profiles.

There are three type of VUser generation can be done by WAPT

# Concept 
A. Constant type loads Fixed Number of users at same time. This is used in Background Load Generation.

B. Ramp-UP type increases Number of Users in defined time. This is used in Benchmarking, Stress testing, Performance testing . Ex- Increasing from 0 user to 30 user, with 3 user increment in every 5 seconds means , it will need 50 second to get total users.

C. Periodic type generates Constant load for a defined period of time. It has Two mode, Low phage and High Phage. This is used in Endurance Test. Ex- 50 User load(all at a time) for 1 min , then 100 user for 3 min.

# Type of tests
WAPTPro performs 5 types of tests. These are categorizing by their functionality and need. It may not meet standard definition. I am assuming we all know about those following type of test(you may google it). I am just defining by how they are functioning under WAPT.

1. Performance Test : WAPT defines the Performance Test by answering following questions. 
 - How many users can work with the site concurrently receiving the acceptable quality of service?
 - How many visitors your web site can handle by day or hour?
 - What response time is typical for your web site under load?

2. Stress Test: WAPT defines the Stress Test by answering following questions. 
- It should not crash or stop responding completely.
- The number of correct page responses per second should not decline significantly.
- It should either provide a user friendly overload message for the requests that it cannot serve, or delay all responses equally.
- After a period of overload it should return to the normal operation without performance degradation.

3. Endurance Test : This Type of test checks the ability of website to withstand the specified load for long period of time. In such conditions the performance degradation can be a result of memory leaks or other server resource allocation problem. The endurance testing is usually performed for several hours. The goal is to confirm that the web site performance during different test phases does not differ significantly.

4. Benchmarking : This is used for measuring benchmarking for different function to compare. If we to choose the best configuration, you can repeat same test and compare performance parameters.

5. Background Load Generation: We can create a typical background load and perform manual testing at the same time. This way you can check what real users will experience when working with your web site under load.

# WAPTPro UI :These are some screenshots. 

- Menu-1
![Menu-1](images/wapt/Menu-1.jpg)

- Menu 2
![Menu-2](images/wapt/Menu-2.jpg)

- Menu 3
![Menu-3](images/wapt/Menu-3.jpg)

- Menu 4
![Menu-4](images/wapt/Menu-4.jpg)

- Menu 5
![Menu-5](images/wapt/Menu-5.jpg)

- Menu 6
![Menu-6](images/wapt/Menu-6.jpg)

- Menu 7
![Menu-7](images/wapt/Menu-7.jpg)

- Settings 1
![Settings-1](images/wapt/Settings-1.jpg)

- Settings 2
![Settings 2](images/wapt/Settings-2.jpg)

- Settings 3
![Settings3](images/wapt/Settings-3.jpg)

- Settings 4
![Settings4](images/wapt/Settings-4.jpg)

- Settings 5
![Settings5](images/wapt/Settings-5.jpg)

- Settings 6
![Settings6](images/wapt/Settings-6.jpg)

- Settings 7
![Settings7](images/wapt/Settings-7.jpg)

- Settings-AddCertificate
![AddCertificate](images/wapt/Settings-AddCertificate.jpg)

# An Example of performance test: 

(I am adding Screenshots of a sample Performance Test example)

1. Create Test Scenario: This Contains VUsers, Test Duration, settings.
I use performance test on google. 

- AddTest
![AddTest](images/wapt/AddTest.jpg)

- AddTestWithRempUp
![AddTestWithRempUp](images/wapt/AddTestWithRempUp.jpg)

- AddTestWithPeridodic
![AddTestWithPeridodic](images/wapt/AddTestWithPeridodic.jpg)

- AddTestSetLimit
![AddTestSetLimit](images/wapt/AddTestSetLimit.jpg)

- AddTestWithConstantUsers
![AddTestWithConstantUsers](images/wapt/AddTestWithConstantUsers.jpg)

- AddTestReportSettings
![AddTestReportSettings](images/wapt/AddTestReportSettings.jpg)

- AddTestWithRecording Confirmation
![AddTestWithRecording](images/wapt/AddTestWithRecording_Confirmation.jpg)

2. Create Virtual User Profile: We can record scenarios for VUsers.

RecordingBrowserOption
![RecordingBrowserOption](images/wapt/RecordingBrowserOption.jpg)

RecordingBrowserOptionParameterization
![RecordingBrowserOptionParameterization](images/wapt/RecordingBrowserOptionParameterization.jpg)

Recording-BrowserOptionSelection
![BrowserOptionSelection](images/wapt/Recording-BrowserOptionSelection.jpg)

Recording Message
![Recording Message](images/wapt/Recording_Message.jpg)

3. Verify Test : Verify a test for a profile by running all tests with settings and parameters for one time only. Problems are shown in result Log. 
![Select Profile](images/wapt/Select_Profile.jpg)

4. Run test / schedule test. 
![Select Log level](images/wapt/Log_Level_of_a_Run.jpg)

5. See Results/Logs/Reports(after stopping )
 
A Result contains: 
- Error Rate: Percentage( %) of Error Requests/Completed Sessions .
- Response Time:  Correct reply time to single page request. For Total time, we need to include all. 
- Page/Sec : Number of pages requests successfully saved by site in one second.

We can save the report as HTML and open to see in details (Unzip [this](images/wapt/HTMLReports.rar) file and open Untitled.html and you can find my performed tests report). Some screenshots 

HTML Report in Browser
![Browser](images/wapt/HTML_Report_in_Browser.jpg)

HTML Report in Browser1
![Browser1](images/wapt/HTML_Report_in_Browser1.jpg)

Report
![Report](images/wapt/Report.jpg)

SummaryReportOptions
![SummaryReportOptions](images/wapt/SummaryReportOptions.jpg)

SummaryReport1
![SummaryReport1](images/wapt/SummaryReport1.jpg)

SummaryReport2
![SummaryReport2](images/wapt/SummaryReport2.jpg)

SummaryReport3
![SummaryReport3](images/wapt/SummaryReport3.jpg)

SummaryReport4
![SummaryReport4](images/wapt/SummaryReport4.jpg)

SummaryReport5
![SummaryReport5](images/wapt/SummaryReport5.jpg)

SummaryReport6
![SummaryReport6](images/wapt/SummaryReport6.jpg)

Log: To view log ,select the item from left. Some screenshots. 
LogTotal
![LogTotal](images/wapt/LogTotal.jpg)

Log1
![Log1](images/wapt/Log1)

Log2
![Log2](images/wapt/Log2.jpg)

Log3
![Log3](images/wapt/Log3.jpg)

- Now see profile.

Profile Properties
![Profile Properties](images/wapt/Profile_Properties.jpg)

New ProfileScenario
![New ProfileScenario](images/wapt/New_ProfileScenario.jpg)

Profile Options
![Profile Options](images/wapt/Profile_Options.jpg)

AddOptionsAfterStop
![AddOptionsAfterStop](images/wapt/AddOptionsAfterStop.jpg)

Open Options
![Open Options](images/wapt/Open_Options.jpg)

We can add following items(options) under a user profile: 
- JavaScript
![JavaScript](images/wapt/JavaScript.jpg)

- Loop Control (To execute its content repetitively)
![Loop Control](images/wapt/Loop.jpg)

- While Loop control(To execute its content repetitively with conditions)
![ While Loop](images/wapt/WhileLoop.jpg)

- If then Else condition
![If then Else ](images/wapt/If-Else.jpg)

- Condition box 1
![box 1](images/wapt/)

- Condition box 2
![box 2](images/wapt/)

- Rendezvous Point(either Active% users or number of users)
![Rendezvous Point](images/wapt/Rendezvous_PointSetting.jpg)

- Random Properties (To choose random requests from included properties and send request randomly) 
![Random Properties](images/wapt/RandomProperty.jpg)

- Task(to join series of successive page requests)
![Task](images/wapt/Task.jpg)

- Delay(Inserts delay between pages)
![Delay](images/wapt/Delay.jpg)

- New Page 
![Screenshot1](images/wapt/NewPage0.jpg)
 and 
 ![Screenshot2](images/wapt/NewPage1.jpg)

- Stop Agent(End the test)
![Stop Agent](images/wapt/StopAgent.jpg)

- Stop User(Stops current VUser)
![StopUsgerAgent](images/wapt/StopUsgerAgent.jpg)

- Stop session(stop current session and start the next one)
![StopSession.jpg](images/wapt/StopSession.jpg)

# Note : 
-We may need to Install WPST certificate if required.

![Certificate](images/wapt/certificate.jpg)

![SecurityCk](images/wapt/SecurityCk.jpg)

- We can apply proxy or change other settings from here. 
![LoadAgentSettings](images/wapt/LoadAgentSettings.jpg)

-We can change Browser’s User Agent from profile’s properties 
![UserAgent]](images/wapt/UserAgent.jpg)

-The Rendevous Point instructs VUsers To wait till all VUsers come to a certain point and proceed together. When we are performing load testing we will make the scenario in such a way that all the processes hit the application at a single point of time so using rendezvous point it collects all process and throws on the application at a time. 

I tried WAPTPro for sometime Experimentally. I hope this will help others to use or even buy WAPT pro. Happy blogging.

….Thanks …:)