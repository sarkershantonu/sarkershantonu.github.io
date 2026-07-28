EST :

One assert per test :
Single Assertion
Soft Assert
Multiple validation method for each assertion points


Readable :
No Comments required
Prerequisite should only be commented
Warning can be commented (i.e previous failed rate)
Fast :
Externalize all resources
Use Jenkins as much as possible
Local Run : Avoid IDE, use maven commands , so test should be runnable by commands only.
Independent
A test method should be independent , now we might need to run multiple steps(define as dependent @Test) but objective is not make a test independent among others. In this case, if a method does not perform any testing but @Test only run dependent step , avoid inclusion of text "test" in the method name.
If a test method needs to run some other tests before (like some assertions), you should indicate in comments why.
Repeatable :
A test should be repeatable. If you annotate with @Test, should be repeatable.
But, it does not mean, a test class should be repeatable . If you have some setup/config step should be run before a group of test (multiple test/ multiple suite), should be present separately. Can be used @BeforeSuite or can be used in separate test class.
A test class with @BeforeClass/ @AfterClass has responsibility to execute or perform common steps for all tests which in included. So, if you have some steps (at start/end) , you should have separate out and put with proper annotations.
If a @Test is not repeatable, at least containing class should be repeatable. This is MUST. So that , we can put into any suite and run this.


Names rules

Choose descriptive and unambiguous names :
No duplicate
Enough to understand but not too long
Best practice 20-25 character
No context duplicate,
Serves only purpose of naming the test, not class/package/descriptions
Approach can be added , i.e  dataDriven
Make meaningful distinction.
Should be separate from similar tests

Use pronounceable names, so that we can understand
Use searchable names **** A Must
Replace magic numbers with named constants:
Avoid numbers in naming unless it obvious(like flow400 )


Avoid encodings. Don't append prefixes or type information.


Source code structure

Separate concepts vertically :
Divide as much as possible
Multiple test can only be together if they are related somehow
I prefer negative, positive value test separately and exception condition tests separately.
Use Data driven test as much as you can. This is possible if you can separate the test.
Related code should appear vertically dense :
If you have one feature needs multiple classes, think of putting in package.
If you see, already you have package of that name, you can include classes there or, if relevant , add sub packages.
Declare variables close to their usage :
I see all the time, variable generic names. i.e => DE elements, I see variable names like deElement, not deElementForRt400FlowTest
If your variable is a constant value , not related to test, rather related to environment, should be in constant , so that others can use this. i.e => location path of realtime log. Most of tests might need , but this variable should be present in RtAppConstant, where variable name should be EIB_FT_2_LOG.
If you have shell script or SQL or Rule Text in your tests, they must be externalize to a file or at least separate  class named.. SomethingRuleText, or SomethingShellScript.
Dependent functions should be close.
If a method is dependent , should be inside test class. Now, you may use lambdas and if you do, make sure its in declarative way.
If a validation methods can be reused by others, should be in separate class.


Place functions in the downward direction
Rule of thumb is
All fields will start a class
All Static declaration in 2nd place
All constrictor are next
All Public Methods are next
All private methods are at last.
In a testNg class,
Start with all field names
Then all before/after Class items
Then all Test methods
Then all private methods.
Keep lines short :
Best practice 500 Lines , must be below 750. Because of better visibility
Avoid long naming of a method. If you contextualize class, method names can be relatively small. (i.e, flow400BobTest class should have tests like testTrPresentInEvery10s  in stead of -> shouldBeJournaledARealTimeTransactionInProcessedTranTableEvery10Seconds)
Don't use horizontal alignment
As we are give laptops only, unless you have wider external monitor, its hard to see.
Always use formatter , this is must.
Don't break indentation.
Don’t break sequence of import
Avoid * import unless you have to