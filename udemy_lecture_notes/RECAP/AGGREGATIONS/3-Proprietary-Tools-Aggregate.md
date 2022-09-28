# Proprietary Tools Aggregate

## 1 Cluster Setup - 10%
`kube-bench` -
- Overview - Runs CIS Benchmark checks on your cluster, and sees if there are any issues
- General Syntax:
  - `kube-bench run --check [CHECK-STRING]`

## 2 Cluster-Hardening - 15%

## 3 System Hardening - 15%

## 4 Minimize Microservice Vulnerabilities - 20%
1) Encryption Configuration - https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/#encrypting-your-data
2) Runtime Class - https://kubernetes.io/docs/concepts/containers/runtime-class/

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: sec
  name: sec
spec:
  runtimeClassName: gvisor
  containers:
  - image: nginx:1.21.5-alpine
    name: sec
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}


## 5 Supply Chain Security - 20%

## 6 Monitoring, Logging and Runtime Security - 20%




## 1 Cluster Setup - 10%

## 2 Cluster-Hardening - 15%

## 3 System Hardening - 15%

## 4 Minimize Microservice Vulnerabilities - 20%

## 5 Supply Chain Security - 20%

## 6 Monitoring, Logging and Runtime Security - 20%
