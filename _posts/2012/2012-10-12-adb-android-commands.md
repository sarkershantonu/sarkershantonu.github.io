---
layout: post
title: Basic ADB commands
date: "2012-10-12 16:14"
tags: [android]
permalink: /2012/10/12/adb-commands/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Basic ADB commands"
gh-badge: [star,follow]
comments: true
---
In this article , we are going to see basic ADB commands. These are some command I use with ADB when connecting android mobile to PC.

## Installations
### Step 1: 
You should have installed Android SDK and Android driver for your android phone
### Step 2: 
Turn on ADB in the mobile . To do that, Go to Menu > Settings > Applications > Development > USB Debugging

**update** : Android 4+ , you need to enable developer options and then enable USB debugging. 

### Step 3 : 
Run ADB. From PC, run command prompt(better run as admin) and go to SDK directory in PC.(\Android\android-sdk\platform-tools)

## Basic ADB commands
- Sends files to your phone

        adb push c:\example.apk /sdcard/example.apk
- Receives files from your phone
        
        adb pull /system/app/example.apk c:\example.apk
- installs application
        
        adb install c:\example.apk
- Begins shell connection with phone

        adb shell
- reboots phone 
        
        adb reboot
- reboots phone into recovery

        adb reboot recovery
- reboots the phone into bootloader/the white screen
        
        adb reboot bootloader
- remounts the system

        adb remount
- to see active devices

        adb devices
- to direct communicate with specific device, this is the syntax

        adb -s _serialNumber_ command
- Forwarding Ports

        adb forward tcp:6100 tcp:7100
- Enabling logcat Logging        
        
        adb logcat [<option>] ... [<filter-spec>] ()

## ADB Shell Commands (inherit from linux cli)
- changes directories

        cd
- lists all files in the directory

        ls
- removes files

        rm
- copies files

        cp
- Shows contents of files

        cat
- exits shell

        exit
- UI/Application Exerciser Monkey
        
        adb shell monkey -v -p <your.package.name> 500()
- Dumps system data to the screen
        
        dumpsys
- Dumps state to a file
        
        dumpstate
- Prints kernel debugging messages to the screen
    
        dmesg 
- Starts (restarts) an emulator/device instance

        start
- Stops execution of an emulator/device instance

        stop

thanks :) 