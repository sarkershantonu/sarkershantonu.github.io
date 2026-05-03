

Branch Name
Rally Story number should be included
Name may contain description or purpose text.  
Include Reviewer
People must review this (integration testers, manual testers etc)
People who are maintaining this repository  
Check Branch Locally
Compilation is successful
mvn dependency:resolve  
mvn clean compile
Check style has no error
Git Branch is Up to date with remote.
Your Branch should be sync with Master/Develop
Get remote branch locally
git pull origin master
Resolve if any conflict you may see
Commit your resolved branch
Push your changes to your branch
Perform Local commit with proper message
Each commit should have independent changes for specific goal.
Only commit files that have your changes based on purpose.
Try not to include file that have changes for ONLY check style . Only include your classes/files . Others file may be changed by check style but if you include those, you should be responsible for the files. (last edit).
Commit message may contains story link , confluence link or annotated with username.
PR Info:
Include Screenshots (if possible) for test running successfully
Include Proper Descriptions and intent for the PR
include target release information
May include screenshot for conversation or Development story/PR links for the reference.  
Contact Respective people related to this PR for Discussion/Review/Approvals


DO NOT CREATE PR

when you are not sure you have done your work
Test not run in EIBs for any issues
Dependent project/pr not done yet