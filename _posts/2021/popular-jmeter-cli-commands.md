In this blog, we are going to see Jmeter Commands that I use when running in CLI or CI/CD. 

This is very useful if you are a DevOps person creating performance testing systems for testing. This will also help you to setup runtime environments using Jenkins. 

All example will be based on linux so, before starting , you need to install Jmeter in your linux environment. [**This blog might help you on how to do setup in cli.**](https://sarkershantonu.github.io/2021/01/06/install-jmeter-plugins-cli/)

# Run Headless Jmeter 
- Running with specific Test case (JMX)

```jmeter -n –t your_test_case.jmx```

- Running with specific Test case & Result Log (JTL)

```jmeter -n –t your_test_case.jmx -l your_test_result.jtl```
  
- Running with specific Test case , Result Log & Jmeter Log(jmeter.log)


# Jmeter Remote Execution
- Run Jmeter with specific host RMI (Jmeter Master)
  
- Run Jmeter with Slaves with RMI

### Example : Execute a test on Jmeter Grid(master-slave) with result log

# Jmeter HTML Report
- Generating HTML Report 

- Generating HTML with custom properties 

# Jmeter common CLI Options 
- To know Jmeter version ```jmeter --version``` , you should see jmeter banner in CLI 

![banner](/images/jmeter/install-cli/env-jmeter-version.JPG)

### All Jmeter Options 

``` 
shantonu@ubuntu:~$ jmeter --help
    _    ____   _    ____ _   _ _____       _ __  __ _____ _____ _____ ____
   / \  |  _ \ / \  / ___| | | | ____|     | |  \/  | ____|_   _| ____|  _ \
  / _ \ | |_) / _ \| |   | |_| |  _|    _  | | |\/| |  _|   | | |  _| | |_) |
 / ___ \|  __/ ___ \ |___|  _  | |___  | |_| | |  | | |___  | | | |___|  _ <
/_/   \_\_| /_/   \_\____|_| |_|_____|  \___/|_|  |_|_____| |_| |_____|_| \_\ 5.4

Copyright (c) 1999-2020 The Apache Software Foundation


To list all command line options, open a command prompt and type:

jmeter.bat(Windows)/jmeter.sh(Linux) -?

--------------------------------------------------

To run Apache JMeter in GUI mode, open a command prompt and type:

jmeter.bat(Windows)/jmeter.sh(Linux) [-p property-file]

--------------------------------------------------

To run Apache JMeter in NON_GUI mode:
Open a command prompt (or Unix shell) and type:

jmeter.bat(Windows)/jmeter.sh(Linux) -n -t test-file [-p property-file] [-l results-file] [-j log-file]

--------------------------------------------------

To run Apache JMeter in NON_GUI mode and generate a report at end :
Open a command prompt (or Unix shell) and type:

jmeter.bat(Windows)/jmeter.sh(Linux) -n -t test-file [-p property-file] [-l results-file] [-j log-file] -e -o [Path to output folder]

--------------------------------------------------
To generate a Report from existing CSV file:
Open a command prompt (or Unix shell) and type:

jmeter.bat(Windows)/jmeter.sh(Linux) -g [csv results file] -o [path to output folder (empty or not existing)]

--------------------------------------------------

To tell Apache JMeter to use a proxy server:
Open a command prompt and type:

jmeter.bat(Windows)/jmeter.sh(Linux) -H [your.proxy.server] -P [your proxy server port]

---------------------------------------------------

To run Apache JMeter in server mode:
Open a command prompt and type:

jmeter-server.bat(Windows)/jmeter-server(Linux)

---------------------------------------------------

```