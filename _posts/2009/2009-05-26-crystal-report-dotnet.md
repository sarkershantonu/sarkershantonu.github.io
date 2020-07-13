---
layout: post
title: Crystal Report using UDL
date: "2009-05-26 16:20"
tags: [dotnet]
permalink: /2009/05/26/crystal-report-udl-dotnet/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Crystal Report"
gh-badge: [star,follow]
comments: true
---

#### How to make a crystal report in dotnet ? 
##### Language: C# (dot net 2.0) 
##### Database: SQL 2005 Express 
 
### Step 1:  
Make a new file with extension (any name) *..udl In you solution Folder.( Creating a link file for report communication) 

### Step 2:  
Double Click to configure. Choose SQL Native Client 

![data-link-properties](/images/dotnet/crystal-report/data-link-properties.JPG)

### Step 3:  
Then next tab connection 

![data-link-properties-connection](/images/dotnet/crystal-report/data-link-properties-connection.JPG)
 
**Here Pc Name: BJIT-0667A6AC89**

**SQL 2005 Server instance: SQLEXPRESS**

**Database name: UniversityAutomation**

### Step 4:
Press ok to end up making link file. 

### Step 5. 
Go to your development code 

### Step 6. 

Take a form ( blank) 
### Step 7. 
Take component from form tool box ( choose Crystal reports -> CrystalReportViewer) & drop to your form 

![crystal-reports](/images/dotnet/crystal-report/crystal-reports.JPG)

### Step 8. 
Right click on report sowing form choose create report ( new) 

![crystal-reports-properties](/images/dotnet/crystal-report/crystal-reports-properties.JPG)

### Step 9. 

![crystal-reports-gallery](/images/dotnet/crystal-report/crystal-reports-gallery.JPG)

### Step 10. 
Create new connection Select OLE DB (ADO) 

![crystal-reports-ado](/images/dotnet/crystal-report/crystal-reports-ado.JPG)

### Step 11. 
Select SQL Native Client ( Higilight) 

### Step 12. 
Click DATA LINK Filter 

### Step 13. 
From (…) Show the path of created link file. 

### Step 14. 
Click NEXT 

![crystal-reports-ado-wizard](/images/dotnet/crystal-report/crystal-reports-ado-wizard.JPG)

### Step 15. 
Serve : pc name\sql client name (Example: BJIT-0667A6AC89\SQLEXPRESS) 

### Step 16. 
It will automatically get the database. 

### Step 17. 
Choose Next & Finish 

![crystal-reports-oledb](/images/dotnet/crystal-report/crystal-reports-oledb.JPG)

### Step 18. 
Next steps are configuring the report (May 7) . These depend on Requirements 

![field-explorer](/images/dotnet/crystal-report/crystal-reports-field-explorer.JPG)

### Step 19. 
Editing from there you can easily find the components to show. 

Final: How to show a report 

Now you have to just LOAD your form from any (May main) form to show as you configure. 
