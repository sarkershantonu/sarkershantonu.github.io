
Are you trying to use chromebox as windows/Linux PC, this is good place for you to try. 

!!!WARNING!!! - If you follow the process, it voids the device's warranty, so follow at your own risk . 

Name : Aus Chromebox 3 , i7 8550u
Device specification : https://www.asus.com/us/displays-desktops/mini-pcs/chrome-os-devices/asus-chromebox-3/
i7 8550u
4GB(2x2GB) DDR 4 (My Opinion, upgrade to 16gb to have better use)
32gb Sata m.2 SSD (I have upgraded to 512GB nvme)

Unscrew specific flat head screw : 

Step 1 : Start Recovery Mode
insert Pin and press power button.
![recovery1](/images/hw/asus-chromebox/Developer_mode.JPG)


![recovery](/images/hw/asus-chromebox/recovery_mode.JPG)

Step 2 : Goto Developer Mode


As soon it turns on , press CTRL+D

Step 3 : Go into Developer mode with OS verification of 

Insert pin & it will be rebooted to recovery mode with OS verification off.
![recovery2](/images/hw/asus-chromebox/os_verification_off.JPG)


CAUTION : Do not press SPACE to re-enable OS verification

![recovery3](/images/hw/asus-chromebox/tr_dev_mode.JPG)

Now you have to wait for the transitioning to developer mode
![recovery3](/images/hw/asus-chromebox/tr_dev_mode_wait.JPG)

Connect to Wifi or Lan cable (preferred)
![recovery5](/images/hw/asus-chromebox/wifi_connection_init.JPG)

Connect with Prompt 
![recovery4](/images/hw/asus-chromebox/wifi_prompt.JPG)

If you see prompt to set up Hangout Meet, Press NO

![recovery6](/images/hw/asus-chromebox/meet_default.JPG)

Command Prompt : 
From welcome message Press CTRL+ALT F2 
Note : This is just linux terminal, if you don't see F2 working try F3/F4 
Sign-in as "chronos" no password necessary  

download script : 
```curl -LO mrchromebox.tech/firmware-util.sh```
![recovery8](/images/hw/asus-chromebox/downloading_uefi.JPG)

Run Script with permission : 

```sudo install -Dt /usr/local/bin -m 755 firmware-util.sh```

```sudo firmware-util.sh```

You may have to run twice as first time there will be warning message.

![recovery9](/images/hw/asus-chromebox/warning.JPG)

Or, you may use following command directly 

```sudo bash firmware-util.sh``` 

you should see firmware selection page

![recoveryy7](/images/hw/asus-chromebox/firmware_select_page.JPG)

Select option 2 to install and follow warning messages al long for different prompted confirmation .


Note : As this firmware is maintained by mrchromebox, you might see little different prompt option. Select install/update UEFI Full Rom Firmware. This will wipe chrome box BIOS and install mrchromebox UEFI bios. 


CAUTION : It is a good idea keep back up of you chromebox firmware in case you need to get back to chromebox. 

To install OS, in chromebox ssd(usually 16gb-64gb), you need OS installer. I prefer to use linux installer (ubuntu or popOs) to boot and remove all partitions from existing SSD and then install any OS. 
I have tested : Windows 10/ 11/ Ubuntu, PopOs. 

Common Problems : 
1. Sound won't work via port or HDMI , you need external sound card. I got this both windows & linux. For windows drivers , please see https://coolstar.org/chromebook/windows.html. They also sell audio drivers. 
2. In windows ACPI's may not work(you can see from Device manager) but I was able to download some drivers online (HP/DELL/Lenovo) to make it work by looking their Hardware ID. 


Upgrade Tips : 
- For i7/i5/i3 , m2. ports are connected with CPU to support NVME. So, try bigger nvme SSDs
- At least 16gb RAM is preferred for smooth running. 
- If you are not willing to pay for sound driver , coolstar is kind of ok. I am not much happy with that. I prefer to have usb sound card or bluetooth speaker connected(you don't need to buy any). 

### Firmware credit goes to :
Website : https://mrchromebox.tech/#home
Github : https://github.com/MrChromebox

### For Windows driver supports : 
- Please check compatibility here https://coolstar.org/chromebook/windows.html (see box tab) 


