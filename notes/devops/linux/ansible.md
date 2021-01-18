Add the following line to /etc/apt/sources.list:

deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main

### installation in debian 
```shell
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
$ sudo apt update
$ sudo apt install ansible
```

### Ubuntu
```shell

$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```