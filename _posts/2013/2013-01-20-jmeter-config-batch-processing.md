---
layout: post
title: JMeter Config | batch processing
date: "2013-01-19 03:51"
tags: [jmeter]
permalink: /2013/01/20/jmeter-config-batch-processing/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter testing"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker
---

In this article we are going to see how can we configure JMeter by changing property of JMeter. In this section we will see the different mode settings for batch processing in ```jmeter.propertie```.

In the jmeter installed bin directory(in my case C:\apache-jmeter-2.8\bin), we get a file named jmeter.properties. Open this with note pad.

# Batch Processing Configuration
- To set Sample sender configuration [true = client (default), false=server] ```sample_sender_client_configured=true```
- To set remote batching support ```mode=Standard```

### Other values :
Standard= returns each sample synchronously(default)
Hold = retains samples until end of test (need memory)
Batch = returns samples in batches
Statistical = returns sample summary statistics
Spatial combined values : Stripped, StrippedBatch.
StrippedBatch mode will remove some data from the SampleResults as the response body and it will send Sample Results as Batches (low resource using) ]

- To load a class of an implementation of org.apache.jmeter.samplers.SampleSender ```mode=org.example.load.MySampleSender```
- To Set key statistical samples on threadName (false for threadGroup) ```key_on_threadname=true```

- DiskStore: For Hold mode, but serialises the samples to disk, rather than saving in memory, ```mode=DiskStore```
Note: the mode is currently resolved on the client, other properties (e.g. time_threshold) are resolved on the server.

- To set for holding samples up to 100
```
hold_samples=true
num_sample_threshold=100
```
- To set threshold time(ms) ```time_threshold=60000```

### Asynchronous sender: 
- To use a queue and background worker process to return the samples
- To set queue size to 100 [Asynch Mode] ```asynch.batch.queue.size=100```
- To set the Monitor Health Visualizer buffer size to 800 ```monitor.buffer.size=800```

...Thanks..:)