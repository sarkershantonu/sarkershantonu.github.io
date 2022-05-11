# Draft

### This is initial review of LinieageOS for OnePlus3T

Original Project Link : 

Steps : 
a. Unlock Device bootloader 
- Install Drivers 
- install ADB & fastboot drivers 
  - This part is tricky. When you connect device in fastboot mode, android drives is not selected by windows, you have explicitly choose select which driver to install from windows.  
  - So select carefully 
b. Install Recovery
- Boot to fastboot 
- from CLI check device is connected 
- from clI , flash recovery 
- Reboot to Recovery 
c. Install LineageOS
- Wipe Device with data & cache partition 
- mount volumes 
- Copy zipped LineagesOS 
- Copy your favorite google apps, i like nano version 
- from recovery, goto folder where you have copied and install both zips
- reboot and done 
4. (optional) : Install Google Apps 
