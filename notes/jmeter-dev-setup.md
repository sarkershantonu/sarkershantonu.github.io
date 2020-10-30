# Eclipse 
In this article, we are going to see how can we start Jmeter from source code. This is important for extending jmeter, creating own plugins, sending custom protocol requests. 

Download jmeter applcaiotn
Download the code fron here 
Extract it and 
goto the folder that you have extracted
Add the .project file (you can create also, here is the link), this is a standard project file for eclipse
rename Eclipse.classpath to .classpath 


now, From jmeter application directory
copi directory to another location
make api, ext, junit, opt folders and 
download this two api and keep in api folder
keep all extensions in ext
junit jar, in jnunit
opt contains all rest of jars (as quckli i am running, I will expalin which jars for what later on) 

Open ecplise
Click File, import
select Existing ptoject
show the directory pointing the jmeter code
keep the source in copiec to workspace
now, from explorer copy Lib and past to imported project
It will marge to lib directory of the project
This step is important if we do not want to buils ant for downloading a all of the lib files.
Now, in ecplise, windos, show view , ant 
from project, drag & build.XML to ant window
it will get the build file , now run as androif build.
(not, you maigh fiund some error related to workspace\lib not found, 
as that is mentioned in ant script, if you do not want to change the script, just copy the lib directory and past to your workspace. Later on we will show hoe to change the Ant script 
to know ehre is the workspace of ecplise, see window>preferrence>general>startup & Shutdown

core > package org.apache.jmeter.util;
> JMeterUtils
> loadJMeterProperties
>

# Idea