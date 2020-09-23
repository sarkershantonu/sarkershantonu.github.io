In this article we are going to see how we can install Calibre Server in Ubuntu. 

### What is Calibre?
- Its a e-book manager with cli utilities for file type conversion. 
- It is used as personal library in own hosting. 

### Why Calibre Server? 
- I can access my library any where in internet
- I can share opensource & no-copyright books with friends. 

### Steps: 
- Get a Ubuntu PC/VM or in my case a container in my proxmox (PVE)host. 

update & upgrade 

apt install -y git curl wget build-essential python3-pip xvfb imagemagick calibre

git clone https://github.com/janeczku/calibre-web.git

python3 -m pip install --system --target vendor -r requirements.txt

blank metadata.db 

https://drive.google.com/file/d/189tv5i5SNT6rivLLLvCmC2JeLtODmSS1/view

adding your files 

xvfb-run calibredb add ~/calibre-upload/* --library-path ~/calibre-library


https://kenfavors.com/code/how-to-install-calibre-server-on-ubuntu-14-04-16-04-18-04/

https://github.com/janeczku/calibre-web/wiki/How-To:Install-Calibre-web-(-Python3-)-in-Linux-Mint-20---Linux-Mint-19

blank DB : https://drive.google.com/file/d/189tv5i5SNT6rivLLLvCmC2JeLtODmSS1/view