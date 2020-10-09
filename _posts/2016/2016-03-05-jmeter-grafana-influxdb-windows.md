---
layout: post
title: Jmeter Live Test Monitoring in windows 8x64
date: "2016-03-05 08:31"
tags: [performance-testing,Grafana,InfluxDB,jmeter]
permalink: /2016/03/05/live-performance-monitoring-jmeter-grafana-influxdb-windows/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Live Jmeter Test Result Monitoring"
gh-badge: [star,follow]
comments: true
---
This is continuing post of [Live Performance Dashboard](https://sarkershantonu.github.io/2016/02/22/live-performance-monitoring-jmeter-grafana-influxdb/) only this time with windows(as I have promised). I would suggest, please visit that post to continue.

In this example, I am going to setup influxdb & Grafana in windows 8x64 PC in VM. You can use real PC/AWS. And like as before, I will run jmeter in my local PC to test keeping monitoring system isolated. My Local Address (in this whole example) : 172.16.244.135

**Note** : As influxdb/grafana will be accessed from outer network, make sure you put in outbound firewall rules so that others can access this

### Step 1: Installing InfluxDB : 
- Download Influxdb from [**here**](http://s3.amazonaws.com/influxdb/influxdb-nightly_windows_amd64.tar.gz). It is standalone zip. If you extract, you will see something like this.(i renamed in to  influxdb-0.11.0)

![influxdb-folder](/images/jmeter-grafana-influxdb-windows/influxdb-folder-structure.jpg)

- Now, open command prompt and get default configuration (in **bin** directory all exe are present)

        influxd.exe config

So, you will get default configuration. 
- Copy this to a notepad and save as influxdb.conf. [to make life easy, i save my own influxdb.conf in bin , so default one in etc, my one in bin]

- Now, if you run this you will see error messages due to local host address resolver is not working for windows. [Github discussion.](https://github.com/influxdata/influxdb/issues/5848). Easy to solve , add local host with port number. I change the under

        [meta]
          bind-address = "localhost:8088"
          http-bind-address = "localhost:8091"

- Now, add graphite configuration at our influxdb.conf. 

        [[graphite]]
        enabled = true
        bind-address = ":2003"
        database = "jmeter" 

- So, open command line , goto bin directory (where influxd.exe & influxdb.conf are present )

        influxd.exe -config influxdb.conf

![influxdb-running](/images/jmeter-grafana-influxdb-windows/influxdb-running.jpg)

- Now,  if we goto browser and see http://172.16.244.135:8083 , we will be able to see home page. 
- Like as before , create a table 'Jmeter'.

![influxdb-running](/images/jmeter-grafana-influxdb-windows/influxdb-db.jpg)

And , if we see show database ,we should be able to see DBs. So, our influxDB setup is done.

My [Windows influxdb.conf](/files/grafana-jmeter-influxdb/win/influxdb.conf)

### Step 2 : Installing Grafana :
- Download grafana standard from [**here**](https://grafanarel.s3.amazonaws.com/winbuilds/dist/grafana-2.6.0.windows-x64.zip) . I am using 2.6. 
- Extract it in your suitable location. (i also renamed in grafana-2.6.0 to keep things simple)

- Now , Open command line, goto **bin** directory under grafana-2.6.0 and execute grafana-server.exe. You will see server running.

- Goto browser http://172.16.244.135:3000/. And you should able to see **grafana home page** for login prompt. use **admin, admin** to login 

Like as previous [**post**](https://sarkershantonu.github.io/2016/02/22/live-performance-monitoring-jmeter-grafana-influxdb/), configure influxDB settings into grafana. 
 
![data-source](/images/jmeter-grafana-influxdb-windows/db-source.jpg)

Like as previous [**post**](https://sarkershantonu.github.io/2016/02/22/live-performance-monitoring-jmeter-grafana-influxdb/), make a dashboard. (I am using same request count) 

![data-source](/images/jmeter-grafana-influxdb-windows/data-graph.jpg)

So, we are done setup, now lets test it.  

## Jmeter Tests : 
Like as previous [**post**](https://sarkershantonu.github.io/2016/02/22/live-performance-monitoring-jmeter-grafana-influxdb/) , I am using same test case just changed the URL to 172.16.244.135
 
Now, if we run jmeter  
- goto http://172.16.244.135:8083 
- select Jmeter from right upper corner.
- from query template SHOW MEASUREMENTS

we will see like this.

 ![db-jmeter](/images/jmeter-grafana-influxdb-windows/data-jmeter.jpg)

This means DB is getting Data.  

- Now if we goto grafana dashboard (our dashboard name Jmeter  Live ), we should be see graph for request sending

![dashboard](/images/jmeter-grafana-influxdb-windows/dashboard.jpg)

So, Like as Ubuntu , we have completed our setup a live Jmeter result monitoring system with Grafana & InfluxDB. 

**Note** : As I am installing in my PC, ignore my user name, for your PC , it will be your's. So, don't just copy past my configurations.  

Thanks.. :)