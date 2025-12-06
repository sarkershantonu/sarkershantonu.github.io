### Installation 

### Ubuntu Installation 
- Update ubuntu ```apt update && apt upgrade -y```
- install gpg ```apt install gpg```
- config keyring server ```gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69```
- setting keyring ```echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | tee /etc/apt/sources.list.d/k6.list```
- Update & install ```apt-get update && apt-get install k6```

- Script 

```shell
apt update &&  apt upgrade -y
apt install -y gpg
gpg -k
gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" |  tee /etc/apt/sources.list.d/k6.list
apt-get update
apt-get install k6
```

if you need these commands with , please check this single [bash script](/files/k6/ubuntu-k6-install.sh)

### Docker Installation 
- docker install ```docker pull grafana/k6:master-with-browser```

![docker-install-windows](/images/k6/docker/docker-install.jpg)

# Distributed k6