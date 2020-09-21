# kubernetes Basics

### What is a Pod? 
A pod a group of logically isolated unit containing 
- At least one container
- An IP
- Resources to run a container 
- Storage Unit 

This is the lowest building block of kubernetes. A pod may have multiple containers , those are called Sidecar Containers. 

Following separation of concern, a pod used to have single container that serves the main work. Sidecars are used for monitoring or side purposes. 

Supported Container types :
- Docker 
- rkt(centOS)
- containerd
- LXD ( better version of LXC)

With Help of CRI, kubernetes can access different containers run-time. 

### What is a Node? 
A node is a server/VM that runs/hosts the pods. A Node has multiple runtime utilities for managing Pods. 

There are two type of nodes, Master & Slave. A master node manages slave nodes. 

Some popular pod management tools are 
- kubelet: 
    
- kube-proxy:


# What is a Cluster?
Cluster is organization of Nodes for Kubernetes. A cluster gets the commands from us and apply in suitable nodes. Typically a cluster have 
1. At least one Master node (best practice : a prod should have three)
2. At least one Slave node. But, in dev mode, your master node can also be a slave. 
3. When there are multiple masters, which is highly recommended for production scenarios, one of the Master nodes is the leader and the only one active. The others are the followers and ready to take over the work in case the leader Master Node isn’t responding anymore


# Concepts 
- kubelet: 
    
- kube-proxy:

- ReplicaSet: 

# Architecture 

![kub-arc](/images/kubernetes/kub-arc.JPG)

[Credit](https://www.learnitguide.net/2018/08/what-is-kubernetes-learn-kubernetes.html)

# Kubernetes Service 
A service is a logical set of pods and a policy by which to access them. Based on a selector, which determines the pods within the set, they are assigned a service name. The most common use case is that we assign a service for a certain deployment

# Commands
-To get list of all Pods in a node 

```
kubectl get pods
```

- To get list of all Nods in a cluster 

```   
kubectl get nodes
```

important links : 
https://info.payara.fish/hubfs/Kubernetes/How%20to%20Use%20Payara%20Micro%20with%20Kubernetes%20Guide.pdf