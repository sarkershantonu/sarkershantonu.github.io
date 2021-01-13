# Basic Linux Commands

# copy

# Cut

# Delete

# see directory items

# zipping & unzipping

# System info 
- hmesg
- To Know PCI device information 

```
lspci
```

- To know CPU information 

```
lscpu
```  
- To know how many disk/drives present in system 

```
lsblk
```

- To know how much disk space used
```
df -H
```
- How much RAM present /used/free 
```
free -m
```

 This will show in megabyte. -g can be used for gigabyte & -k can be used for killobyte.  


# Network Tools
- To know which services using which ports

```shell
cat /etc/services
```


- How to check if a port is in use on Linux

``` 
sudo lsof -i -P -n | grep LISTEN
sudo netstat -tulpn | grep LISTEN
sudo ss -tulpn | grep ':22'
```
- How can you find out which process is listening on a port on Linux

```

sudo netstat -tulpn | grep :443
sudo ss -tulpn | grep ':22'
```

### Options 

- -t : Display TCP sockets/port
- -u : Show UDP sockets/port
- -l : See only listening sockets i.e. open port
- -p : Also display process name that opened port/socket
- -n : View addresses and port numbers in a numerical format. Do not use DNS to resolve names.


# How to use Grep 
# Process Monitoring 
- PS
- kill
- top
- stop


# Spatial commands
- cat
- clear
- less 
- head
- tail
- wc
- chown
- chmod

# Manage users 