# What is MiniKube 
Minikube is lightweight version of kubernetes. Its design for developers and devops people who can deploy test apps locally and can perform POC as if its full Kubernetes. 

# Why Minikube
- Setting up Local Mini version of Kubernetes to perform development task
- 
# My Usages : Examples
- Local App deployment
- Chaos Mesh experiments with UI & API
- Litmus Chaos Experiment with UI & API
- Performance Testing system => JMeter, Dashboard with Grafana/InfluxDB 
- Automation testing system => Junit/TestNG test , Jenkins, Allure, Report Portal 

# MiniKube vs Kubernetes 

# Use Kubernetes Eco system 

### Kubernetes IDE

### Kubernetes Tools 

- install all togather 
- 

### Install : Ubuntu 
- Using Deb Package 
```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

```

### Install : Windows 
- Form windows command line (as admin)
```shell
winget install Kubernetes.minikube
```
### Starting A cluster 


### Basic Commands[From Manual]
##### Administrative
- ```start```, Starts a local Kubernetes cluster
- ```status```, Gets the status of a local Kubernetes cluster
- ```stop```, Stops a running local Kubernetes cluster
- ```delete```, Deletes a local Kubernetes cluster
- ```dashboard```, Access the Kubernetes dashboard running within the minikube

##### cluster Related 
- ```pause```pause Kubernetes
- ```unpause```   unpause Kubernetes

##### Images Commands:
- ```docker-env```Provides instructions to point your terminal's docker-cli to the Docker Engine inside minikube. (Useful for building docker images directly inside minikube)
- ```podman-env```Configure environment to use minikube's Podman service
- ```cache```Manage cache for images
- ```image```Manage images

##### Configuration and Management Commands:
- ```addons```    Enable or disable a minikube addon
- ```config```    Modify persistent configuration values
- ```profile```   Get or list the current profiles (clusters)
- ```update-context```   Update kubeconfig in case of an IP or port change

##### Networking and Connectivity Commands:
- ```service```   Returns a URL to connect to a service
- ```tunnel```    Connect to LoadBalancer services

##### Advanced Administrative:
- ```mount```Mounts the specified directory into minikube
- ```ssh```Log into the minikube environment (for debugging)
- ```kubectl```   Run a kubectl binary matching the cluster version
- ```node``` Add, remove, or list additional nodes
- ```cp``` Copy the specified file into minikube

##### Basic Troubleshooting :
- ```ssh-key```   Retrieve the ssh identity key path of the specified node
- ```ssh-host```  Retrieve the ssh host key of the specified node
- ```ip``` Retrieves the IP address of the specified node
- ```logs``` Returns logs to debug a local Kubernetes cluster
- ```update-check```Print current and latest version number
- ```version```   Print the version of minikube
- ```options```   Show a list of global command-line options (applies to all commands).

##### Other Commands:
- ```completion```Generate command completion for a shell
- ```license```   Outputs the licenses of dependencies to a directory


### Deploy APP Example

### Installing Chaos Tools 

### Install JMeter 

### Install JMeter Continuous Testing System

### Install Jenkins

### Security Basics

### Validating Configurations 