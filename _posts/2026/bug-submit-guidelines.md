If you are submitting Bug during any testing phase, (Regression testing or any testing), if you follow these steps, it will be nice for teams to debug and find root cause.

Title : A title of a bug should have

Single line to represent the bug , example=>
Standin Transactions is falling due to Velocity Grid is not available.
Realtime transaction is not processing de108
Annotate with [] to indicate main area, example =>[automation] , [standin] ,`[rtswebserice]`,  
Annotate with Release info , example => `[25.4]'

Description : In your bug , these should be present in description

EIB Info :
Selections details
if there was any post/script performed share those details
Patching details
Steps of patching
Scripts for deployment
Scripts for DB
Log info: Instance Logs (single or more instances may be involved)
Clear log before test run
Include log for the testing window time frame only
If needed, enable debug log and please include log configuration file or at least direction which part to enable debug log.
App info :
Details about application in test, version (flatpack versions)
If necessary global JSON configuration
Release reference page to share details about the release.
Test info:
Steps to reproduce
Reference Testcase ID
Confluence Pages (if applicable)
Report Portal Images (if applicable)
Screenshots (if applicable)
If you run by simulator,
Simulator version
Properties file
if automation present ,
prerequisite steps/setup suite
Failed Test class/Method suite
Test Running Parameters
Test code branch info
Test logs :
if you run by IDE, Intellij Idea HTML export
If you run Jenkins : Console output
Tips :

Be handy with HM cli commands
Docker cli commands
Log parsing cli commands. 