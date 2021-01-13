# Basic Linux Commands

# copy

# Cut

# Delete

# see directory items

# zipping & unzipping

# System info 
- hmesg
- lspci
- lscpu
  
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
- To know what is running in ports

``` 
sudo lsof -i -P -n | grep LISTEN
sudo netstat -tulpn | grep LISTEN
```
- if you 

# How to use Grep 
# Process Monitoring 
- PS
- kill


# Spatial commands
- cat
- clear
- less 
- head
- tail
- wc

# Manage users 