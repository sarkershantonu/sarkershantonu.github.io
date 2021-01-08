2021-01-08-jmeter-distributed-testing-revised

---
This is an update blog post of original posted blog from 2013 about distributed testing with jmeter. 

What id distributed testing? 
- A performance test tool simulate user behaviour and use parallel executions to simulate multi-user behaviour. This part is not easy when you are testing a big number of users. 

Jmeter has nice approach to actually distribute its load(test executions) among its slaves. 

The way it works is : 
- A Master Jmeter is present to start , stop test and collect results.
- One or more Slave Jmeter present which runs in a spatial mode to get instructions(load) from Master and run those as well as send results back to Master. 
- Tester will collect results from Master without worry about how they aggregate many Slave jmeter results. 

- Master Slave communication is established by Java RMI (remote method invocation)
- 