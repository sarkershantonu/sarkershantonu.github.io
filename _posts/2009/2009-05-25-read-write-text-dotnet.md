---
layout: post
title: Read Write Text File in c#
date: "2009-05-25 19:02"
tags: [testing]
permalink: /2009/05/25/read-write-text-dotnet/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Read Write Text File in c#"
gh-badge: [star,follow]
comments: true
---
In this article we are going to simply file read and write in C#.

Let's break down the topic into small problems:  

### Problem 1 : 
Write a program that will generate 4 types of “printable" random objects and store them in a single file, each object will be separated by a ",". 

These are the 4 objects: 
- alphabetical strings
- real numbers 
- integers 
- alphanumerics. 

*The alphanumerics should contain a random number of spaces before and after it (not exceeding 10 spaces).

The output should be 20MB in size. Sample extracted output :

```
youruasdifafasd, 127371237, asdfka12348fas,13123.123, 
asjdfklasdjfklaasf, 123192u3kjwekhf , 89181811238,122, 
jslfhasjdfa900jkifh , 3.781, 2.11, ....
```
### Problem 2 : 
Write a program that will read the generated file above and print to the console the object and its type .Spaces before and after the alphanumeric object must be stripped.

Sample output :
```
youruasdifafasd - alphabetical strings
127371237 - integer
asdfka12348fas - alphanumeric
13123.123 - real numbers
asjdfklasdjfklaasf - alphabetical strings
123192u3kjwekhf – alphanumeric
```

### Solve of problem 1 : 

#### Step 1: 
Start a c# console application in dot net.

#### Step 2: 
Make a class named RandomStringGenerator. The main responsibility of the class is to generate the numbers randomly as required in problem domain.

#### Step 3: 
Copy the following code :

```
public class RandomStringGenerator{
        public RandomStringGenerator(){}
        private string RandomString(){
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < Convert.ToInt32(Math.Floor(100 * random.NextDouble())); i++){
                ch = Convert.ToChar(
                Convert.ToInt32(
                Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            return builder.ToString().ToLower() + ",";
        }
        private string RandumInteger(){
            Random random = new Random();
            return random.Next().ToString().ToLower() + ",";
        }
        private string RandomRealNumber(){
            Random random = new Random();
            return (random.NextDouble() * random.Next()).ToString().ToLower() + ",";
        }
        private string RandumIntegerForOwn(){
            Random random = new Random();
            return random.Next().ToString().ToLower();
        }
        private string RandomStringForOwn(){
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < Convert.ToInt32(Math.Floor(100 * random.NextDouble())); i++){
                ch = Convert.ToChar(
                Convert.ToInt32(
                Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            return builder.ToString().ToLower();
        }
        private string RandomSpace(){
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char c;
            for (int i = 0; i <= random.Next(10); i++){
                c = ' ';
                builder.Append(c);
            }
            return builder.ToString();
        }
        private string RandomAlphaNeweric(){
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            for (int i = 0; i < Convert.ToInt32(Math.Floor(10 * random.NextDouble())); i++) {
                string output;
                if ((i % 2) == 0){
                    output = RandomStringForOwn() + RandumIntegerForOwn();
                }
                else{
                    output = RandumIntegerForOwn() + RandomStringForOwn();
                } 
                builder.Append(output);
            }
            return RandomSpace() + builder.ToString().ToLower() + RandomSpace() + ",";
        }
        public string StringOutPut(){
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            int select;
            for (int i = 0; i < Convert.ToInt32(Math.Floor(1000000 * random.NextDouble())); i++){
                select = random.Next(1, 4);
                if (select == 1)
                {
                    builder.Append(RandomString());
                }
                else if (select == 2){
                    builder.Append(RandumInteger());
                }
                else if (select == 3){
                    builder.Append(RandomRealNumber());
                }
                else{
                    builder.Append(RandomAlphaNeweric());
                }
            }
            return builder.ToString();
        }
    }
```

#### Step 4: 
Make a class named : OutPutManager : The main responsibility of the class is to save the string in the file until the file size is as like as given size.

#### Step 5 : 
Copy the following code:

```
using System.IO;
public class OutPutManager{
    private string filePath = "c:\\output.txt";
    private long fileSize = 20971520;
    private long GetFileSizeString(){
        FileInfo info = new FileInfo(filePath);
        long size = info.Length;
        return size;
    }
    public void WriteToFile(String lines){ 
        TextWriter tw = new StreamWriter(filePath);
        while (GetFileSizeString() <= fileSize){
            tw.WriteLine(lines);
        }
        tw.Close();
    } 
}
```

#### Step 6: 
In the main program copy the following code under main :

```
RandomStringGenerator rd = new RandomStringGenerator();
OutPutManager output = new OutPutManager();
output.WriteToFile(rd.StringOutPut()); 
```

#### Step 7: 
Compile the code and run , you will find a file in C:\output.txt who’s size is 20Mb

### Solve of problem 2 : 

#### Step 1: 
Start a c# console application in dot net.

#### Step 2: 
Make a class named Reader : The main respectability is to read string from a text file and it makes strings part by part to check the type of string as it is told.

#### Step 3 : 
Copy the following code there

```
using System.IO;
public class Reader{ 
    public string ReadFromFile(string filePath){
        string s;
        TextReader tr = new StreamReader(filePath);
        s = tr.ReadToEnd();
        tr.Close();
        return s;
    }
    public void ExecutorOfStringCking(string input){
        char[] inputString = input.ToCharArray();
        string getSt;
        Checker ckString = new Checker();
        int start = 0,i = 0; 
        for (i = 0; i < input.Length; i++){
            if (input[i] == ','){
                getSt = input.Substring(start, i-start );
                start = i + 1;
                System.Console.WriteLine(getSt + ckString.CatagoryOf(getSt));
            }
        }
    }
}
```

#### Step 4:
Make a class Checker : The main responsibility of the class is to check the category of a string if it is like as asked in the problem. 

#### Step 5: 
Copy the following code in the class

```
public class Checker{
    public string CatagoryOf(string input){
        if(input.IndexOf(' ')==0){ 
            return " - alphanumeric";
        } 
        else if(input.IndexOf('.')>=0){
            return " - real numbers";
        }
        else {
            if (IsInteger(input)){
                return " - integer";
            }
            else{
                return " - alphabetical strings";
            }
        }
    }
    private bool IsInteger(string input){
        int counter =0;
        for (int i = 0; i < input.Length; i++){
            if (input[i] == '0' ||input[i] == '1' ||input[i] == '2' ||input[i] == '3' ||input[i] == '4' ||input[i] == '5' ||input[i] == '6' ||input[i] == '7' ||input[i] == '8' ||input[i] == '9'){
                counter++;
                }
            }
        if (counter < input.Length){
            return false;
            }
        else
            return true;
    }
}
```

#### Step 6:
Copy the following step in the main
```
string filePath = "c:\\output.txt";
string getString ;
Reader rd = new Reader();
getString=rd.ReadFromFile(filePath);
rd.ExecutorOfStringCking(getString); 
Console.ReadLine();
```

#### Step 7:
Compile the code and run .

Note: you need a file in **C:\output.txt** .(will be generates if the first program is run).


We are done...:)
