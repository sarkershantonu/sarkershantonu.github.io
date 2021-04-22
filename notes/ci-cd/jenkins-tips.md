
# Installing necessary plugins 
- You have to goto jenkins => Manage jenkins => 

# Enabling jenkins Slave via TCP(JNLP/Remote Agent)
- Goto Manage Jenkins 
- Goto Configure Global Security ```/configureSecurity/```
- Navigate to Agent Section => Select Random
- Save

![enable-tcp](/images/jenkins/enable-tcp-communication.JPG)

To See this is implemented : 

- Goto Manage Jenkins 
- Goto Manage Nodes & Clouds
- 

### Jenkins Agent Jar Location 
- JENKINS_URL/jnlpJars/agent.ja
### JNLP Jar Location
- JENKINS_URL/computer/your_name_of_slave/slave-agent.jnlp