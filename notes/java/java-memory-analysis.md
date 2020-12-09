In this article we are going to see how to analyze GC Logs for finding memory leak. Previously we have seen generic approach of memory leak finding (top down analysis). In here we will see more quick and efficient approach to detect memory leak. In this approach, we will not pinpoint where is the root cause but we will see how can we quick make decision about memory leak and go for further investigation.

What is memory leak?
When an application memory usages is not dropping after high usages or memory usages increases(may or may not with certain condition) then a memory leak is suspected. We need to find an easy way to get that.
So, first, we need to generate GC logs. GC logs represents GC activity. For GC activity monitoring we can do following
1. Storing GC logs in a log file  :
2. Printing GC activity in console :
3. Monitoring GC activity using Tools :

I will skip monitoring GC part as I will cover in separate post with JMX monitoring.

How to view & take GC logs via JVM Arguments :
The following JVM argument applicable to show GC logs and later on on save the log to a file will enable us to analyze.

Oracle JDK 1.8 -Xloggc: [-XX:+PrintGCDetails] [-XX:+PrintGCDateStamps]
Sun / Oracle JDK 1.7 with option -Xloggc: [-XX:+PrintGCDetails] [-XX:+PrintGCDateStamps]
Sun / Oracle JDK 1.6 with option -Xloggc: [-XX:+PrintGCDetails] [-XX:+PrintGCDateStamps]
Sun JDK 1.4/1.5 with the option -Xloggc: [-XX:+PrintGCDetails]
Sun JDK 1.2.2/1.3.1/1.4 with the option -verbose:gc
IBM JDK 1.3.1/1.3.0/1.2.2 with the option -verbose:gc
IBM iSeries Classic JVM 1.4.2 with option -verbose:gc
HP-UX JDK 1.2/1.3/1.4.x with the option -Xverbosegc
BEA JRockit 1.4.2/1.5/1.6 with the option -verbose:memory [-Xverbose:gcpause,gcreport] [-Xverbosetimestamp]

-verbose:gc = will show GC logs in command line
-XX:-PrintGC Print messages at garbage collection. Manageable.
-XX:+PrintGCDetails = Shows details logs.
-XX:+PrintGCTimeStamps= Shows with time stamp

To save GC log in a file :
IBM JVM : -Xverbosegclog:<path to file>
Oracle  : -Xloggc:<path to file>

in both case, it is pointed to current working directory. But we can customize that. 

File format Example : 
For IBM : -Xverbosegclog:<path to file>\verbosegc.%Y%m%d.%H%M%S.%pid.txt
(year, month, date, Hour, Min, Second format)
For Oracle : -Xloggc:<path to file>\gc.%t.%p.log
%t=current time
%p=Process ID
Note :
-XX:-UseGCLogFileRotation : Enabled GC log rotation, requires -Xloggc.

So, finally, for IBM :
-verbose:gc --Xloggc:verbosegc.%Y%m%d.%H%M%S.%pid.txt -XX:+PrintGCDetails -XX:+PrintGCTimeStamps

For Oracle :


Note : This option is available for Oracle JVM 1.7+(after bug fix)

you can specify path also, 
Tools for analysis:
I prefer :
independent tool : . https://github.com/chewiebug/GCViewer
Eclipse IDE tool :
IBM tool :
You can see details in this post for tooling.

Raw Log File Format :
Oracle/OpenJDK/Sun Format :



IBM : it is XML format , having all information in XML about GC. Here is one example from IBM JVM 1.5 (single GC event entry)

<?xml version="1.0" ?>
<verbosegc version="20110524_AA">
<af type="nursery" id="1" timestamp="Sep 08 15:30:58 2015" intervalms="0.000">
  <minimum requested_bytes="48" />
  <time exclusiveaccessms="0.039" />
  <nursery freebytes="0" totalbytes="33554432" percent="0" />
  <tenured freebytes="1006030712" totalbytes="1006632960" percent="99" >
    <soa freebytes="955699064" totalbytes="956301312" percent="99" />
    <loa freebytes="50331648" totalbytes="50331648" percent="100" />
  </tenured>
  <gc type="scavenger" id="1" totalid="1" intervalms="0.000">
    <flipped objectcount="77666" bytes="6260096" />
    <tenured objectcount="0" bytes="0" />
    <refs_cleared soft="120" weak="20" phantom="0" />
    <finalization objectsqueued="20" />
    <scavenger tiltratio="50" />
    <nursery freebytes="26810800" totalbytes="33554432" percent="79" tenureage="10" />
    <tenured freebytes="1006030712" totalbytes="1006632960" percent="99" >
      <soa freebytes="955699064" totalbytes="956301312" percent="99" />
      <loa freebytes="50331648" totalbytes="50331648" percent="100" />
    </tenured>
    <time totalms="18.420" />
  </gc>
  <nursery freebytes="26808752" totalbytes="33554432" percent="79" />
  <tenured freebytes="1006030712" totalbytes="1006632960" percent="99" >
    <soa freebytes="955699064" totalbytes="956301312" percent="99" />
    <loa freebytes="50331648" totalbytes="50331648" percent="100" />
  </tenured>
  <time totalms="21.991" />
</af>

Each GC action create and af block.

 What to monitor ?

This is very important part. You must have clear conception about JVM memory & types as well as GC & different GC types/algorithm. For, jvm fundamentals, you can see my post. .

So, first, get what type of memory you need to monitor form each GC log. Typically,
1. Necessary/Eden Space
2. Survivor Space(s0, s1)
3. Old Generation Space
4. Meta Space/Perm Gen Space

You can see these in command line

or in log
Oracle :

IBM :

How to analyze ?
This part is based on your application and its implemented behavior. I used to ask following questions for analysis in the first level of analysis. 
1. What memory type is growing? (Java Heap break down analysis)
2. What is the growth rate of each memory type?(kb/s)
What type of GC event is happening?
What is the Major GC event interval.
What is total % of major GC among all GC.
3. Is memory release after each GC event? how much %..

4. What is full heap size after each GC?
5. What is memory usages trends for a long run (1 hour / 24 hour/ 1 week/ 1 month, depend on you app) (behavior of memory growth)
6. What is the GC event trends for particular period of time.

Tips : I follow some technique to make this analysis useful for specific context.
1. Make time limit of monitoring.
2. Relate only one user activity(or user action) and repetitive do that to know the impact. You can use load generator tools(like jmeter) to do that work for you.
3. For the selected activity, define behavior like , is it Eden space consuming, or survivor? how much perm-gen is occupied. Try to narrow down scope of analysis to be more effective.
4. Try to do live monitoring GC logs , each run each type of memory. If you are saving logs, log analyzer will get that for you.
5. Add some extreme condition (long run+ multiple scenario) to see whether you can create any error

So, after getting all those data, you may observer high memory use (not dropping) or growth. In this step you know you have memory leak.
Now, it will be the time to analyze your code with debugger or profiler.

GC Viewer suggestion :

GCMV suggestion : 

Please comment if you have any question.

 Thanks.. :)