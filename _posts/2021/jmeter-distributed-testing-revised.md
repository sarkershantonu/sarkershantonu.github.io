
---
This is an update of [**original  blog from 2013**](https://shantonusarker.blogspot.com/2013/01/how-to-distribute-test-in-jmeter.html) about distributed testing with jmeter. 

### What id distributed testing? 
- A performance test tool simulate user behaviour and use parallel executions to simulate multi-user behaviour. This part is not easy when you are testing a big number of users. 

Jmeter has nice approach to actually distribute its load(test executions) among its slaves. 

### How it works?
- A Master Jmeter is present to start , stop test and collect results.
- One or more Slave Jmeter present which runs in a spatial mode to get instructions(load) from Master and run those as well as send results back to Master. 
- Tester will collect results from Master without worry about how they aggregate many Slave jmeter results. 

In jmeter bin folder, we can see jmeter-server.bat/jmeter-server.sh. This will allow jmeter to run as slave. Thought the name is server, but this actually put jmeter in server mode allowing remote jmeter to control execution. 

To avoid confusion , I will refer a jmeter server as slave. 

- Master Slave communication is established by Java RMI (remote method invocation)
- We can install a certificates for secure master-slave communication. 

[Install Jmeter in master & slaves](https://sarkershantonu.github.io/2021/01/06/install-jmeter-plugins-cli/)

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