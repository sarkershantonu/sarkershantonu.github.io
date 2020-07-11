---
layout: post
title: Video Conferencing in Mobile
date: "2009-04-26 17:05"
tags: [concepts]
permalink: /2009/04/26/video-conferencing-mobile/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Video Conferencing in Mobile"
gh-badge: [star,follow]
comments: true
---
In the following article, we are going to learn a concept about video conferencing in mobile.

### Topics: 
Developing a program for I- phone which would require using cell phone’s camera, GPS/GPRS and internet connectivity to transmit data back and forth.

### Preferred Language: 
C++ (Preferred) / JAVA (Depends on which frame work I have to use)

### Solution: 
I am simply writing my steps.
1. Finding the main goal (making a target): Here the story is (my idea) ”We will transfer live/stored video (captured by camera) from my i-phone to send (sending) to another i-phone (receiving) by using cell phone’s GPRS internet”.
2. Search and taking help in the google whether there is any same type of solution is present or not. May be there are some good concepts of solution. If we get a successful solutions (may not meet our target) with proper Object Orientation then we can work on existing design( modification) and fulfill our target.
3. Finding the acting modules of our problems (by OOP approach).

From the problem we get
- Camera device Controller (who will record the video)
- File maker (will convert the recorded video as file (should be in quick time movie format))
- Sender (who will send the file to internet by using GPRS protocol)
- Receiver (who will receive from internet by using GPRS)
- Media player(will take the file and show)(not in our problem domain)

**Note**: If we have the I-phone internet browser (or any popular browser supported by I phone) then by plug-ins (like adobe plug-ins for firefox), we can easily send and receive the video images as live. The plug-ins may be based on JAVA as java is supported by all browsers. In that case we have to know the patterns and format to communicate with the browsers.

**Sender** : First it will take the a file or stream (in here video file). Divide the file into small file stream block(depends on which protocol we using for transmission, different protocol use different techniques to send files as well as frequencies are different also). Then make the session for transmitting. Then transfer the file block using GPRS.

**Receiver**: First receive the block or stream or file, Decode it and make it in to video segment, play it by media player.

**Note**: In case of browser, the plug in will request for camera device to capture image, after capturing it will send to internet. And receiver will take and play, block wise. That means each block will come and will be played received part.

#### Programming Camera Controller: Steps : 
1. Start a project in IDE
2. Import the camera accessing class library
3. Wait for the request of capturing.
4. Capture the picture on recording button click.
5. If press stop, prompting for saving the data stream.
6. If yes, stores and close
7. If no, ask: back to recording or close (User will select).

#### Programming Sender: Steps: 
1. Start a project in IDE  
2. Import the camera accessing class library & GPRS protocol class library 
3. Request for camera to capture/stored place (if we want to send video file) 
4. Store the video footage in a part by part (size depends on protocol/GPRS type) 
5. Establish a connection to the internet (and it will ck where it is available of not) 
6. Read the block data from memory (stored recorded block) and request for sending 
7. After sending it will wait for confirmation of successful sending. 
8. It will take next data/ stream prepare for sending. 
9. After confirmation of successful data sending it will do step 7, 8 unstill the end of file/data/stream comes.  
10. When the end if file/data/stream comes it will close the transmission and ask user to do again transformation or not. 
11. If yes, then it will again start from capturing 
12. If no, then it will stop using camera and back to main menu. (if requires , it may close the connection)

#### Programming Receiver: Steps: 
1: Start a project in IDE 
2. Import the GPRS protocol class library and system library (for calling media player).
3. Check the network connection status
4. Accept request for receiving data, confirmed by USER. 
5. A method for checking coming data and convert it as video file stream.
6. It will call media player to show on the display.
7. If the connection is ok and data stream is coming it will run step 5. 
8. If not then it will prompt for storing the viewed stream. 
9. After that it will prompt to take next stream or not. 
10. If yes, again it starts the receiving process from selected source. 
11. If not, it will close the program.

When a mobile application development IDE starts a project, by default a project structures (set of class with class library to run in mobile) is provided to work with. In that structure we have specific areas to modify or add our codes. When make the build of our code, it will be run in the cell phone’s environment.

A mobile application used to be kept under MENU (organized like as tree). 

My application can be run under video transmitter in cell phone’s applications menu from Main menu. It will work both for sending and receiving video.

### The development flow 
1. Code 
2. compilation and error correction 
3. Build making from code 
4. Build will be added with cell phone using cell phone control applications or stored in cell phones memory. 
5. The application can be run from cell phone either directly or we have to install it.

Here I have tried to solve the problem as conceptual point of view, where followings are concerned 
1. We have an IDE for development (Example: XCODE, for Mac). 
2. We have a application builder (Example: XCODE for Mac) 
3. We have simulator to see results in PC (iphone simulator). 
4. The PC suite of I-Phone provides a suitable environment to access cell phone. 
5. We may have GUI for development( Interface builder) 
6. We may have application optimizer(Instruments)

Thanks :) 