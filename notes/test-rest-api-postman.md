In this article we are going to see how can we use Postman to test a webservice. For this example , I will be using a REST example.

Before starting, you may ask Why postman and what is postman?

What is postman? 
Postman is a webclient to send request to service endpoint. In simple, just another tool like SOAP-UI. It has several versions , one of the popular is google chrome apps.

Why Postman? 
Like as all other rest client, post man has some advantages. The first think I like about is , it is very lightweight and installation via chrome is very quick. I also like validation/checklist capabilities and finally newman makes possible to run post man generated test scripts in command line. That means, you can use the same tool for initial manual testing, adding validation and run in command line more with your CI systems.

[Download Postman](https://www.getpostman.com/apps)


Example :For this testing, I will use my same example that I have used in [previous RestAssured example](https://sarkershantonu.github.io/2016/12/24/rest-assured/) : Here is the [link](https://github.com/sarkershantonu/Bug-Storing-WS/releases/tag/2.0)

you need to download the version 1.2 and run in PC with java. 

So, out test webservice is ready, now start with writing test case.

Step 1 : Run Postman and create simple create bug request:
To do that, open post man and have a blank request by pressing + (you can see below menu ) 



 Then add the full  URL  , in our case localhost:9100/table/bugs

Now, as our webservice is REST which takes data type as JSON, we need to define that in the request header. So, if we see header tab, click that and add content type as application/json. You probably see header like this.

 




in the next post, I will show how can we use newman to run our post man test script.


----- Thanks.. :)