Add the following line to /etc/apt/sources.list:

deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main

### installation
```shell
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
$ sudo apt update
$ sudo apt install ansible
```