
---
This is an update of [**original  blog from 2013**](https://shantonusarker.blogspot.com/2013/01/how-to-distribute-test-in-jmeter.html) about distributed testing with JMeter. 

### What id distributed testing? 
- A performance test tool simulate user behaviour and use parallel executions to simulate multi-user behaviour. This part is not easy when you are testing a big number of users. 

JMeter has nice approach to actually distribute its load(test executions) among its slaves. 

### How it works?
- A Master JMeter is present to start , stop test and collect results.
- One or more Slave JMeter present which runs in a spatial mode to get instructions(load) from Master and run those as well as send results back to Master. 
- Tester will collect results from Master without worry about how they aggregate many Slave JMeter results. 

In JMeter bin folder, we can see JMeter-server.bat/jmeter-server.sh. This will allow JMeter to run as slave. Thought the name is server, but this actually put JMeter in server mode allowing remote JMeter to control execution. 

To avoid confusion , I will refer a JMeter server as slave. 

- Master Slave communication is established by Java RMI (remote method invocation)
- We can install a certificates for secure master-slave communication. 

[Install JMeter in master & slaves](/2021/01/06/install-jmeter-plugins-cli/)

# Example Without SSL : Non-Secure setup:
server.rmi.ssl.disable=false

Defining Ports : 
server.rmi.localport=4000
server.rmi.port=1234
Prerequisite : 

Create a Secure 

assign port in master

assign port in slave 

define slaves in master

install firewall 
apt install ufw 

# Example SSL : 