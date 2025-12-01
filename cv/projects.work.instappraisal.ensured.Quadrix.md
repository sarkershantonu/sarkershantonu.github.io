#TODO

# Instappraisal | ensured | QuadrixIt | Client : Sony Pictures
- DMP : Decision management platform is service for processing mastercard transactions(ASA/ASB). It's a plugins architecture application transitioning from monolith to microservice. 
- Flex : Flextp is flexible transaction executor that runs the DMP transactions . It is also monolith plugin architecture. We have flextp core and flextp plugins. All of the DMP services are divided into multiple channels. 
- A business flow is run by each channel. A mastercard customer(card issuer) choose certain features and apply its rules (IBM ODM rules) for their customers (end card users)
- Typically a Realtime Channel Runs 1.5-2Million Transactions/sec , a standin would do 300-500k TPS. 
- All failed transactions are flagged as 18U where as passing transactions are 18C and mastercard tracks all of them. All are logged in streaming clusters DB in downstream. 
- DMP transactions are not only for Mastercard Provided Cards, its also available for 3rd party cards, like Amex or VISA. 
- Since 2015, mastercard runs AI mdel driven fraud detection algorithm besides its proprietary scoring algorithms. Initially it was called IPrevent , not they are TPP(Temporal Point Processes) models. based. All models are stored in Parquet file. Once models are loaded, application scores a transaction to detect fraud. 
- DMP usages world largest in memory Database Grid (gemfire) for transaction processing.  

## Clients 
- Sony Pictures
- TVGLA (Sony Vendor)


### jeopardy.com
- Realtime is the main DMP transaction processing channel . We have many features like AAV Dynamic Linking, cross-site execution etc. 
### wheeloffortune.com
- Standin is a alternate transactions runner when realtime or near-realtime is not available. Its business flows are different but scores transactions for fraud detections. 
### Sony Connect 
  - This is streaming application
### DMP |Test-RBD | realtime0110
- This is alternative to realtime channel available in specific zone for running alternative business flows of realtime channel 

##### Technology Stack 
- Programming Language : Java, Groovy, python
- DB : GemFire,Oracle
- Testing : Junit, TestNG, Selenium, RestAssured, JDBC
- frameworks/Tools : Spring, Spring boot, IBM ODM, log4j, 
- Internal frameworks: HostManager cli & API, AON, 
- Monitoring : Splunk, prometheus 
- DevOps : [XLR](https://digital.ai/products/release/),Jenkins cloud,maven, gradle, Jfrog,docker, Vmware

##### Responsibilities:
1. Test plan , manages, define scenarios and write test cases
2. Requirement Analysis and Test strategy documentations for both manual and automated tests cases. 
3. Writing Automated Tests in each iteration
4. Design & Implement Test Automation Frameworks
5. Fraud detection with AI model & testing Efficiency of Ai models.
6. Implement CI/CD with XLR, Jenkins Pipeline for testing & releases.
7. Code /PR reviews , refactoring, implementing company wide best practices for Test Automation repositories.
8. Test Review with Developers, testers as well as product owner.
9. Educate QA team to start using automation
10. POCs for Development & Testing
11. AI model Testing with million+ data Points.
12. Making confluence pages for design and test documentations. 
13. Chaos testing with gremlin & Chaos Monkey 
14. Maintain Autmation Utilities 


##### Achievements:
1. Best performer in the team for two times 2022, 2023
2. Go to person in the team for product & architectural information.
3. Representing team to external contractors for overall testing.
4. Implemented Test Automation Completeness
5. Completed POC on kubernetes, docker for App deployment with Redhat team (Mastercard external)
6. Full Automation with cloud Jenkin Ci/CD both scheduled & ad-hoc
7. Created guidelines for new automation testers onboarding
8. Created Guidelines for testing best practices, Code review, Test review, PR checklist, jenkins pipeline scripts, selenium grid executions etc.
9. Implemented companywide testing best practices and help other teams to have end to end testing. 

# Luxoft Poland| DXC | Client : Mastercard