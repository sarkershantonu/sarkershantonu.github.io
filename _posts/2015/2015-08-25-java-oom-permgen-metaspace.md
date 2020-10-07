---
layout: post
title: Java OutOfMemoryError :PermGen space or Metaspace
date: "2015-08-25 02:54"
tags: [java, jvm,java-oom]
permalink: /2015/08/25/java-oom-permgen-metaspace/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Java, JVM"
gh-badge: [star, follow]
comments: true
---
In this post I will provide how to reproduce out of memory error in Metaspace(java 8+) or PermGen(java 7 & before) Space. I am using [Pierre-Hugues Charbonneau's blog](https://dzone.com/articles/java-8-permgen-metaspace).This is a continuing article of [out of memory error/explanation](https://sarkershantonu.github.io/2015/08/21/java-oom-why/). 

I am using **Oracle JVM 1.6 x64** & **Oracle JVM 1.8 x64** on windows 7 x64/8gb ram/ 2.5Ghz Core i5 laptop. 

## Tools : 
### IDE : 
- Eclipse
### Profiling/Monitoring tool :
1. Visual VM
2. Jconsole (optional)
3. Yourkit (optional)

# Step 1 : Knowing JVM Flags : 

I am using following flags to get detail info

### A. Get full GC information :
- verbose:gc => Detail GC info
- XX:+PrintGCDetails => Details GC info
- XX:+PrintGCTimeStamps => Detail GC with timestamp

### B. To enable JMX (for Visual VM/Jconsole/yourkit attachable)
- Dcom.sun.management.jmxremote=true 
- Dcom.sun.management.jmxremote.port=3000 
- Dcom.sun.management.jmxremote.authenticate=false 
- Dcom.sun.management.jmxremote.ssl=false 
- Djava.rmi.server.hostname=localhost

Change localhost to the IP or host name if you remote profiling.

### C. Creating heap dump on error : 
- -XX:+HeapDumpOnOutOfMemoryError 
- -XX:HeapDumpPath=D:\OOM

### D. Limit Perm Gen space or meta space :
- Java 8 : -XX:MaxMetaspaceSize=64m
- Java 6 : -XX:MaxPermSize=64m

So, finally, these are JVM parameters for all

```
-verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps
-Dcom.sun.management.jmxremote=true 
-Dcom.sun.management.jmxremote.port=3000 
-Dcom.sun.management.jmxremote.authenticate=false 
-Dcom.sun.management.jmxremote.ssl=false 
-Djava.rmi.server.hostname=localhost
-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=D:\OOM
```

And add **anyone from section D**.

# Step 2. Scenario:
A PermGen space is used to store following items [info source](https://blogs.oracle.com/jonthecollector/presenting-the-permanent-generation)
- Methods of a class (including the bytecodes)
- Names of the classes (in the form of an object that points to a string also in the permanent generation)
- Constant pool information (data read from the class file, see chapter 4 of the JVM specification for all the details).
- Object arrays and type arrays associated with a class (e.g., an object array containing references to methods).
- Internal objects created by the JVM (java/lang/Object or java/lang/exception for instance)
- Information used for optimization by the compilers (JITs)

In following example , we will use an invocation handler to invoke a method from ***MyClass*** using reflection. MyClass is implementation of MyInterface, so the invocation handler will be generic invocation handler of MyInterface. 

And, when we execute the handler. We will store each class which is actually an Anonymous class (of MyClass) so that each time we store, the class class will has new hashcode and represent as new identity in JVM. 

In this way , we can store multiple class from same class (Anonymously) and GC wont delete our classes.

# Step 3: Code 
- The interface which provides generic way to implement invocation handler

```
public interface MyInterface {
    void myMethod(String input);
}
```

- The implemented class

```
public class MyClass implements MyInterface {
    @Override
    public void myMethod(String input) {
        System.out.println("Method called");        
    }
}
```

- The invoker (using reflection)

```
public class MyInterfaceInvocationHandler implements InvocationHandler{
    public MyClass aMyClassObj; 
    public MyInterfaceInvocationHandler(Object impl){
        this.aMyClassObj = (MyClass) impl; 
    }
    
    @Override
    public Object invoke(Object invocationProxy, Method method, Object[] arguments) throws Throwable {        
        if(Object.class==method.getDeclaringClass())//checking if the method is valid member of a class
        {
            String name = method.getName();
            if("equals".equals(name))//checking presence of equal method
            {
                return invocationProxy==arguments[0];
            }
            else if("hashCode".equals(name))//checking presence of hashCode method
            {
                return System.identityHashCode(invocationProxy);
            }
            else if("toString".equals(name))//checking presence of toString method
            {
                return invocationProxy.getClass().getName()+"@"+Integer.toHexString(System.identityHashCode(invocationProxy))+
                        ", with invocation handler "+this;
            }
        }
        else{
            throw new IllegalStateException(String.valueOf(method));
        }        
        return method.invoke(aMyClassObj, arguments);//calling the method
    }
}
```

This class generates OOM from a **static** method, it also has the hash map to store all generated class. 

```
public class TestPermGenMetaSpaceOOM {    
    private static Map<String, MyInterface> myMap = new HashMap<String, MyInterface>();
    private final static int iterationDefault =50000;
public static void createPermGenOOM(){
        int iterations=0;     
        System.out.println("Class metadata leak simulator, example from Pierre-Hugues Charbonneau's blog");
        try{
            while(true){        
            String classLoaderJAR = "file:" +iterations+".jar";
            URL[] urlsOfJar = new URL[] {new URL(classLoaderJAR)};//an array containing jar url            
            URLClassLoader aUrlClassLoader = new URLClassLoader(urlsOfJar); //a class loader to load all JAR urls            
            //this will create new proxy to load the class loader
            MyInterface proxyObj = (MyInterface) Proxy.newProxyInstance(aUrlClassLoader, //adding class loader
                    new Class<?>[]{MyInterface.class},//Anonymous class/Interface array which implements myInterface
                    new MyInterfaceInvocationHandler(new MyClass())// an invocation handler(implements InvocationHandler)
                    );            
            myMap.put(classLoaderJAR, proxyObj); // this will store all loaders which eventually leak memory as it is stored.
            TestOOM.showMemoryInfo();
            iterations++; 
        }
        }catch(Throwable anyError){
            anyError.printStackTrace();
            System.out.println("Error = " + anyError);                
        }
    }
}
```

So, from main method , I run only this ```TestPermGenMetaSpaceOOM.createPermGenOOM();``` 

# Step 4 : Observing error & Analysis heapdump in VisualVM  

### JDK 6 : permgen space
- See the Full GC status, it is trying to free up memory in perm gen. At the end, we can see OOM details, 99% used perm gen.

![image-j6-permgen](/images/java/jvm/oom/permgen-j6-error.png)

Fro this you can see , **java_pid15652.hprof** heap dump is created. So, if we use **Visual VM** to open the heap dump. **file –> load –>change file type to .hprof,-> select heap dump & open**. If you see main contributor , is the hash map entry, the collection that we use to store all class loaders.

![hprof-image](/images/java/jvm/oom/permgen-j6-hprof.png)

- As we know, permgen OOM is related to class items, so we might need to see detail about what are the class loader type. In visual VM, we can use predefined Object query set, to do that, select OQL Console,

![image-OQL-Console](/images/java/jvm/oom/permgen-j6-oql.png)

- And if we look all the class loaders, we can see URL class loader is the largest.

![image-classes](/images/java/jvm/oom/permgen-j6-classes.png)

### JDK 8 : Metaspace 
- We can see similar story for JDK 8. Only the error changed to Metaspace.

![image-metaspace](/images/java/jvm/oom/metaspace-j8-error.png)

- If we look at the heap dump from Visual VM , we can see the same class loader is the top of all class loaders.

![image-j8-heap-dump](/images/java/jvm/oom/metaspace-j8-hprof.png)

**Note** : In java 8, meta space have some reserve memory as it is in native memory area. And, some misc meta data moved from perm gen space to heap (from jdk 7 to 8), so, the perm gen requirement in JVM 8 become less then JDK 7 or old versions.

# Step 5: Monitoring at VisualVM : 

### JDK 6 : Heap Space
- Heap Space : 47+MB used from 67+Mb

![heap-use-image](/images/java/jvm/oom/permgen-j6-heap-usages.png)

- Perm Gen : 67Mb used from 67+Mb (all most all space filled up)

![image-permgen-use](/images/java/jvm/oom/permgen-j6-permgen-usages.png)

- In case you use JConsole , you may see this

![image](/images/java/jvm/oom/permgen-j6-jconsole.png)

### JDK 8: 
- Heap Space :

![image-j8-heap](/images/java/jvm/oom/metaspace-j8-heap.png)

- Meta Space :

![image-j8-metaspace](/images/java/jvm/oom/metaspace-j8-meta-usages.png)

# Step 6: (optional) Monitoring from Yourkit :

### JDK 6 : 
- Heap Space : Used 42Mb from 63MB 

![image-j6-yourkit-heap](/images/java/jvm/oom/permgen-j6-heap-yourkit.png)

- Perm Gen : At 61MB using of Perm Gen , OOM occurs.

![image-j6-yourkit-permgen](/images/java/jvm/oom/permgen-j6-permgen-yourkit.png)

### JDK 8: 
- Heap Space :

![image-j8-yourkit-heap](/images/java/jvm/oom/metaspace-j8-heap-yourkit.png)

- Perm Gen :

![image-j8-yourkit-metaspace](/images/java/jvm/oom/metaspace-j8-metaspace-yourkit.png)

# [Source Code in Github](https://github.com/sarkershantonu/jvm-novice-to-advance/tree/master/java-out-of-memory/src/main/java/org/automation/oom/permgen)

Thanks..:)