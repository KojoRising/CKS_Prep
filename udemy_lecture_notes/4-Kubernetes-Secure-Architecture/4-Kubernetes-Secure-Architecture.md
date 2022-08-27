# Introduction

## Overview
1) Architecture
2) Components
3) Secure Component Communication


## 1) Architecture

Recall k8s Controlplane components:
1) API-Server - `kubectl` communicates commands to API-Server 
2) Scheduler - Schedules Pods onto Specific Nodes
3) Controller-Manager - Ensures deploys, ds's, sts's, etc. have up-to-count instances.
4) EtcD - Memory Storage. KV pairs.
5) Cloud-Controller-Manager -

k8s Node Components
1) Kubelet - Runs per node. Communicates w/ API-Server
2) Kube-Proxy - Bunch of IPVS Table Rules. For Resolving DNS names to IP's.

## 2) PKI/CA
1) PKI (Public Key Infrastructure):  
2) CA (Certificate Authority): 
  - Trusted root of all certs `intra-cluster`
  - All Cluster certs - Signed by CA
  - Used by components to validate each other
  

## 2b) PKI/CA 
1) API-Server - Has server-certificate
2) Controller-Manager/Scheduler/EtcD/Kubelet - All have corresponding **client** certificates


**NOTE** For Kind Clusters 
1) `docker ps -a | grep kind`
2) `docker exec -it kind-control-plane sh`
3) `docker exec -it kind-worker sh`


## QUESTIONS
Where are the following certificates stored?
1) API-Server - `/etc/kubernetes/pki`
2) ETCD-Server  - `/etc/kubernetes/pki/etcd`
3) Scheduler->API - `/etc/kubernetes/scheduler.conf` (Hardcoded in)
4) Controller-Manager->API - `/etc/kubernetes/controller-manager.conf` (Hardcoded in)
5) Kubelet->API -  - `/etc/kubernetes/kubelet.conf` (Referenced in)
   - `/var/lib/kubelet/pki`
6) 


