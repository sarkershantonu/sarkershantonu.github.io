---
layout: post
title: JMeter JDBC Connection Configuration
date: "2013-01-30 05:51"
tags: [jmeter, java, jdbc]
permalink: /2013/01/30/jmeter-jdbc-connection-config/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter testing with DB"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker
---
In this following article we are going to see what is JDBC Connection Configuration in JMeter and why we use it.By naming, we can understand it is one king of Connection Configuration element that controls the JDBC connection. It will control the communication to any Data Base used by JDBC. And, it will be present in side a config element.

When we add a  JDBC Connection Configuration(Thread group->(right click)add->Config Element)-> JDBC Connection Configuration) we will find These

Variable Name*: Connection settings will be stored in this variable. Use unique names for Multiple connections Configuration as JDBC Samplers will select any one to use. If two configuration elements using the same name, only one will be saved.
Max Number of Connections* : Number of threads allowed in the pool the connection.
[0=the connection is not shared between thread,
any number = The max count of thread share this connection.(to ensure threads don't wait on each other)[Note: on sharing, thread number = this number]
Pool timeout(m)*: Time to retrieve a Connection Pool (Throws an error when the timeout period is exceeded in the process)
Idle Cleanup Interval (ms)*: Time to Clean a connection pool when it is Idle.( need more experiment on exact functionality)
Auto Commit* Enable/Disable auto commit for connections.
Transaction Isolation* : Transaction Behavior for a connection pool.
Keep-alive*: Logically, connection behavior for validation query( need more experiment on exact functionality). Default true.
Max Connection Age (ms)*: Logically, connection life time for the validation query.( need more experiment on exact functionality). Default 5000.
Validation Query*: A simple query to know the database response.
Database URL*: JDBC DB Connection string
JDBC Driver class*: Fully qualified(including package) name of driver class(Include .jar to \lib)

*= Mandatory

Why we use this ? As it is the configuration for database connection. It will be used for any request that needs a database.Different database's JDBC driver should be located in \lib or should be added to class path(of test plan).
We can see more with the example from my jmeter database related posts.

..Thanks..:)