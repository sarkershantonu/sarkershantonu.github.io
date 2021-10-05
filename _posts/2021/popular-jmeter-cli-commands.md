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