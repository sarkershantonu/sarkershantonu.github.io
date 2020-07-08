---
layout: post
title: What is Deployment Testing?
date: "2012-12-17 05:02"
tags: [testing]
permalink: /2012/12/17/deployment-testing/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Deployment testing"
gh-badge: [star,follow]
comments: true
---
In this article we are going to learn how to perform deployment testing (for web, desktop, mobile application). Since there are many type of application in the world, I will try to update Info incrementally. 

### What is deployment testing? 
Deployment testing refers to test installation (now a days with Uninstall) process for developed software. It is also known as **Installation testing** or **Implementation testing**. The testing process may involve full, partial or upgrades **install/uninstall** processes. 

At a glance, A deployment testing refers to test full install, Update, Uninstall process with configuration management.

We have to admire that, a deployment testing is fully referred to client requirement and end user conditions. 
- If we make a software for configuring in device (firmware configuring application) that will be used in production house where a predefine process and environment is present and limited user will be using that.
- If we make a web application for a particular enterprise, that will be used inside that organization only and may be to specific person. If we make the a web application for social networking (like Facebook) , it will used by billions of people including different age, language, location, culture. So, our application need to be that scaled and deplorable. 
- If we make a mobile application(common platform) , then it will be reaching to all platforms' mobile users.

### The objectives of deployment testing : 
- To identify end user problems when they will initially try to use/deploy the software/site.
- To measure the scalability and stability of the system.
- To measure the performance rates, such as discovery rate, trap processing rate, and data collection rate.
- To identify issues pro- actively that would occur in the deployment site, etc 

Before starting the deployment we have to think the end user scenarios. If we think about following issues, it might help to define the scope of testing.

### Common Scenarios : 
For any application that uses the internet 
- What are the communication protocol use(used in server/ client)
- How many type of proxies going to be supported?
- Is there will be a VPN?
- Is there any IP filtering?
- Is there any User Authentication? 

### Desktop Applications:
- What are the minimum requirements to run the software(Configuration for PC(memory, processor, hard drive space, cache memory etc ) )
- How many OS Environment going to be supported? (different OS)
- What are the Pr- Installation requirements. (the software to run the software)
- How many languages are supported ?(OS language/UI language/culture/ Unicode) 
- What are the effects after install/update the software (Resources, Hard drive(User Space, System space, registry), Ram, Processor, Internet Traffic Data Uses)
- What are the User Interaction specification for installing /uninstalling the software? 
- Uninstalling requirements(what are thing will be stored, what are needed to be cleaned)

### For a application patch/update(desktop application / OS patch)
- All point from an desktop application 
- Changes to the Resources(Settings , Space in Hard drive(User Space, System space, registry), Ram, Processor, Internet Traffic Data Uses) after installing/updating the patch
- Undo- able or Disabling requirements(if there is any scope to stop the patch)
- Previous Settings restoring policy after patched/update (i.e.- will the update back up the previous user settings and apply after update) 

### For a Web service 
(Can be used in both desktop/web/mobile apps)
- How many user going to use that?
- What type of server/client going to be supported 
- What are the data format(xml, txt, JSON etc)
- What are the session/cookie policy(period, privacy) for server and client.
- Update policy

### For a web application
- All issues from web service area
- What are the browsers supported 
- what are resolution supporting(Part of compatibility issues also)
- What are the specific settings of different type of browser(if needed, like cache enable, pop up enabled, JavaScript enabled, any plug- in enabled etc)
- Is there any SSO(single sign on) supporting?
- What are the language specific UIs will be there ?(language/culture/ Unicode) 
- Update policy

### For a Mobile Application
- If it is using Internet, all web application issues applicable. Either wise, all desktop application issues applicable(Both are partially applied due to mobile domain & environments) 
- Minimum specification of mobile hardware
- Minimum specification of mobile OS platform(Ex- For Android , 2.3.3/3.2/4.0.4/4.1, IOS 3.2+/4.1+/5.1+, Symbian, Brew, JVM version)
- Minimum specification of network module used for data communication(if it use internet, spec of GPRS/EDGE/3G/4G/Bluetooth/NFC etc) 

### For Firmware applications
- Follow desktop application points for the software to Flash Device with firmware 
- Firmware memory mapped settings(that would be written after flashing)
- Device required settings
- Device effect after flashing(or writing)
- Device specific rules which are mandatory to see how it is impacting after deployed. 
- Device error handling after deploying
- What are the real scenarios of the device in the customer's environment?(i.e.- is that be EMF, what is the operating/preserving temperature etc) 

### For a plug- in 
- What are the required software?
- Where the plug- in going to be deployed, effect of that software(like , Firefox for a Firefox plug- in) 
- What are the changes to the uses of the resources that is used by the plugins(like using traffic, using local memory) 
- Update policy

Thanks...:) 