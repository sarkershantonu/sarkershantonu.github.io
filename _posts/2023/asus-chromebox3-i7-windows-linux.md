Are you trying to use chromebox as windows/Linux PC, this is good place for you to try. 

!!!WARNING!!! - voids the device warranty, so use at your own risk . 

Unscrew specific flat head screw : 


Step 1 : Start Recovery Mode
insert Pin and press power button. 

Step 2 : Goto Developer Mode
As soon it turns on , press CTRL+D 

Step 3 : Go into Developer mode with OS verification of 
insert pin & it will be rebooted to recovery mode with OS verification off. 
CAUTION : Do not press SPACE to re-enable OS verification 

Now you have to wait for the transitioning to developer mode 


Connect to Wifi or Lan cable (preferred) 
Signin as "chronos" no password necessary  

download script : 
```curl -LO mrchromebox.tech/firmware-util.sh``` 

Allow permission : 
```sudo install -Dt /usr/local/bin -m 755 firmware-util.sh``` 
You may have to run twice as first time there will be warning message. 

```sudo bash firmware-util.sh```

Firmware credit goes to :
Website : https://mrchromebox.tech/#home
Github : https://github.com/MrChromebox
For Windows driver supports : Please check compatibility here https://coolstar.org/chromebook/windows.html (see box tab) 
