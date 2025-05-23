---
layout: post
title: Popular Jmeter CLI commands
date: "2021-10-08 00:02"
tags: [jmeter-run, ci-cd]
permalink: /2021/10/08/popular-jmeter-cli-commands/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter Commands"
gh-badge: [star,follow]
comments: true
---

In this blog, we are going to see Jmeter Commands that I use when running in CLI or CI/CD. 

This is very useful if you are a **DevOps** person creating performance testing systems for testing. This will also help you to set up runtime environments using Jenkins. 

All example will be based on linux so, before starting , you need to install Jmeter in your linux environment. [**This blog might help you on how to do setup in CLI**](https://sarkershantonu.github.io/2021/01/06/install-jmeter-plugins-cli/)

# Run Headless Jmeter 

- Running with specific Test case (JMX)

```
jmeter.sh -n –t your_test_case.jmx
```

- Running with specific test case & store result log (JTL)

```
jmeter.sh -n –t your_test_case.jmx -l your_test_result.jtl
```
  
- Running with specific Test case , result Log & Jmeter Log(jmeter.log)

```
jmeter.sh -n –t your_test_case.jmx -l your_test_result.jtl -j jmeter.log
```

- Running with specific Test case , Result Log , Jmeter Log and custom properties

```
jmeter.sh -n –t your_test_case.jmx -l your_test_result.jtl -j jmeter.log -p your_property_file.properties
```

# Jmeter Remote Execution

- Run a Jmeter Slave/server ```jmeter-server ```

- Run Jmeter Slave with specific RMI hostname(its own) 
  
``` 
jmeter-server -Djava.rmi.server.hostname=10.161.142.227

```
  
Here you should change ip ```10.161.142.227``` to your master IP. **This is the most preferable way to avoid RMI errors**. 

- Run Jmeter test from master to slaves(3) and HTML reports (ultimate runnable script )

``` 
jmeter.sh -n -t your_test_case.jmx -l your_test_result.jtl -j jmeter.log -p your_property_file.properties -e -o complete_path_to_output_folder -R 192.168.0.5,192.168.0.6,192.168.0.7
```

You can replace slave IPs ```192.168.0.5,192.168.0.6,192.168.0.7``` with your original IP

# Jmeter HTML Report

- Run with specific Test case (JMX) and Generate HTML Report 

```
jmeter.sh -n –t your_test_case.jmx -e -o complete_path_to_output_folder 
```

- Running with specific Test case , Result Log , Jmeter Log,  custom properties & HTML report

```
jmeter.sh -n –t your_test_case.jmx -l your_test_result.jtl -j jmeter.log -p your_property_file.properties -e -o complete_path_to_output_folder 
```

- Create report from CSV test results 

```
jmeter.sh -g test_result.csv -o complete_path_to_output_folder
```


# Jmeter common CLI Options 

- To know Jmeter version ```jmeter.sh --version``` , you should see jmeter banner in CLI 

![banner](/images/jmeter/install-cli/env-jmeter-version.JPG)

- To run jmeter in GUI mode ```jmeter.sh```

- To run jmeter in GUI mode with own properties 
  
```
jmeter.sh -p your_property_file.properties
```

- To run jmeter under proxy with IP, Port, username(shantonu) & password(123abc) 
  
```
jmeter.sh -H proxy_server_ip -P proxy_server_port -u shantonu -p 123abc
```

### Example : Running Jmeter Tests
I used to make a shell file(run-test.sh) to run script like this.

- Local Test Execution  

``` shell

CURRENT_TIME=d$(ate "+%Y-%m-%d-%H-%M-%S")
#Script Location with Name 
SCRIPT=my_script.jmx
# CSV results
RESULT=result_$SCRIPT_$CURRENT_TIME.csv
LOG=$SCRIPT_$CURRENT_TIME.log
HTML=html-report-$SCRIPT-$CURRENT_TIME

jmeter -n -t $SCRIPT -l $RESULT -j $LOG -e -o $HTML
```

- Remote Test Execution 

``` shell
CURRENT_TIME=d$(ate "+%Y-%m-%d-%H-%M-%S")
#Script Location with Name 
SCRIPT=my_script.jmx
# CSV results
SLAVES=192.168.1.211,192.168.1.212,192.168.1.213
RESULT=result_$SCRIPT_$CURRENT_TIME.csv
LOG=$SCRIPT_$CURRENT_TIME.log
HTML=html-report-$SCRIPT-$CURRENT_TIME

jmeter -n -t $SCRIPT -l $RESULT -j $LOG -e -o $HTML -R $SLAVES

```

### All Jmeter options 

``` 
shantonu@ubuntu:~$ jmeter.sh -?
    _    ____   _    ____ _   _ _____       _ __  __ _____ _____ _____ ____
   / \  |  _ \ / \  / ___| | | | ____|     | |  \/  | ____|_   _| ____|  _ \
  / _ \ | |_) / _ \| |   | |_| |  _|    _  | | |\/| |  _|   | | |  _| | |_) |
 / ___ \|  __/ ___ \ |___|  _  | |___  | |_| | |  | | |___  | | | |___|  _ <
/_/   \_\_| /_/   \_\____|_| |_|_____|  \___/|_|  |_|_____| |_| |_____|_| \_\ 5.4

Copyright (c) 1999-2020 The Apache Software Foundation

	--?
		print command line options and exit
	-h, --help
		print usage information and exit
	-v, --version
		print the version information and exit
	-p, --propfile <argument>
		the jmeter property file to use
	-q, --addprop <argument>
		additional JMeter property file(s)
	-t, --testfile <argument>
		the jmeter test(.jmx) file to run. "-t LAST" will load last 
		used file
	-l, --logfile <argument>
		the file to log samples to
	-i, --jmeterlogconf <argument>
		jmeter logging configuration file (log4j2.xml)
	-j, --jmeterlogfile <argument>
		jmeter run log file (jmeter.log)
	-n, --nongui
		run JMeter in nongui mode
	-s, --server
		run the JMeter server
	-E, --proxyScheme <argument>
		Set a proxy scheme to use for the proxy server
	-H, --proxyHost <argument>
		Set a proxy server for JMeter to use
	-P, --proxyPort <argument>
		Set proxy server port for JMeter to use
	-N, --nonProxyHosts <argument>
		Set nonproxy host list (e.g. *.apache.org|localhost)
	-u, --username <argument>
		Set username for proxy server that JMeter is to use
	-a, --password <argument>
		Set password for proxy server that JMeter is to use
	-J, --jmeterproperty <argument>=<value>
		Define additional JMeter properties
	-G, --globalproperty <argument>=<value>
		Define Global properties (sent to servers)
		e.g. -Gport=123
		 or -Gglobal.properties
	-D, --systemproperty <argument>=<value>
		Define additional system properties
	-S, --systemPropertyFile <argument>
		additional system property file(s)
	-f, --forceDeleteResultFile
		force delete existing results files and web report folder if
		 present before starting the test
	-L, --loglevel <argument>=<value>
		[category=]level e.g. jorphan=INFO, jmeter.util=DEBUG or com
		.example.foo=WARN
	-r, --runremote
		Start remote servers (as defined in remote_hosts)
	-R, --remotestart <argument>
		Start these remote servers (overrides remote_hosts)
	-d, --homedir <argument>
		the jmeter home directory to use
	-X, --remoteexit
		Exit the remote servers at end of test (non-GUI)
	-g, --reportonly <argument>
		generate report dashboard only, from a test results file
	-e, --reportatendofloadtests
		generate report dashboard after load test
	-o, --reportoutputfolder <argument>
		output folder for report dashboard
```

Thanks 