
https://issues.apache.org/jira/browse/DAEMON-170

http://www-01.ibm.com/support/docview.wss?uid=swg21242497

Please comment if you have any question. Thanks.. :)


JVM Analysis : How to create Java Thread Dump? 


Oracle
To create a java thread dump in Linux you must send a QUIT signal to your java process. JVM then catches that and prints the thread dump to standard output. If you are running your program from a script that has it's output directed to a file the thread dump will be written to that file obviously .

So first do we need to find the PID of our java program.

ps -ef | grep java

for example this could return :

lapps     3243  3065 21 Nov12 ?        08:01:50 java -Xms2048m -Xmx10g -XX:MaxPermSize=256m -Djava.awt.headless=true -XX:+UseParallelGC -XX:-UseGCOverheadLimit -classpath .:./test.jar:./lib/:./lib/* mypackage.org.TestApp

Now that we have 3243 as the PID, we simply send a QUIT signal to it.

kill -QUIT 3243

https://www-01.ibm.com/support/knowledgecenter/SSAW57_8.5.5/com.ibm.websphere.nd.doc/ae/tprf_generatingheapdumps.html

https://www-304.ibm.com/support/knowledgecenter/SS3JSW_5.2.0/com.ibm.help.performance_mgmt.doc/SIPM_ThreadDump.html

http://www.oracle.com/technetwork/java/javase/matrix6-unix-137789.html

Please comment if you have any question. Thanks.. :)