In this article we are going to have a basic idea about 
What is chaos in software testing?

What is all chaos engineering all about? 

How to perform chaos engineering? 

What are popular tools for chaos?

How to learn by Practice & POC? 

My thoughts on Chaos Engineering 

### Requirements 

### Example : Requirements 

### Documents 
- Component Diagram 
  - Internal Application component
  - External Upstream & downstream components
  - Component Distributions (multi tire, multi DB, caching ) 
- Sequence Diagram
- If possible , data flow diagram 
- Deployment Details

### Activities :
- Analyze & get each component , all ins & out as well as relationships 
- Get every deployment component & configurations 
- Make all combinations (you may use tools) 
- Eliminate impossibles
- Consider infrastructure Resources
  - Availability range, (min max) of CPU ,Storage , IO, Memory , Network
  - Error in CPU, storage, IO, memory, network
  - Not Available at all 
- Consider OS Layer behavior
  - Kernel Errors
  - Process/IO/Memory/CPU Limitations in kernel level
  - Network latency and configurations 
- Consider Platform Behavior
  - JVM/ Dotnet CLR Limitations/ Errors
- Consider Application behavior 
  - deployed app server limitations(like Apache, nginx)
  - Stress Applications to limit Process/Memory/IO usages(you may need to incorporate load testing tools)
- Consider Chaos Tool Limitations/Facilities 
  - Chaos Mesh
  - Litmus Chaos
  - Chaos Toolkit
  - gremlin (commercial)
- Chaos Experiment Test Plan
  - How it will be run
  - How to track
  - When to trigger
  - Paperer Tests to run during Chaos Experiments. Since Chaos is an Experiment not testing, you need to interact with existing performance & functional tests. 


### Analysis Prod incidents 
- Find out incidents previously happened in Prod (if deployed previously)
- Categorize scenarios based on 
  - Application Architecture
  - Deployment Architecture (infrastructure)
- Identify "what-if" Scenarios 
- Prioritize Scenarios 

### Choosing A Tool
- Choose a tool based on 
  - What Scenarios you need to cover
  - how long you will maintain these tests
  - How People will Execute the test
  - How this tool might help you for Problem Analysis 
  - How quickly your team can learn and use the tool
  
My personal Opinion
- if your organization is small and semi or less technical people will maintain these Experiments  , choose a tool which has better gui and easy to deploy Experiments.
- If your organization has mature devOps culture , you can use WebGuis to create tests and use tool APIs/Rest clients to invoke tests
- If your organization is very robust and code friendly technical people, you may not need to interact with Webui, all experiments are creatable and deployable from API 

### Flowchart 

```mermaid
  info
```