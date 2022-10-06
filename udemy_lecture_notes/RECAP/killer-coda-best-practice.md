# Introduction/Overview

1)
2)
3)
4)
5)

a
## Hardest Practice Problems


#### 5 | Containers Under the Hood | Docker Container Namespaces
1) https://killercoda.com/killer-shell-cks/scenario/container-namespaces-docker

#### 6 | Network Policies
1) https://killercoda.com/killer-shell-cks/scenario/networkpolicy-create-default-deny
2) 

#### 14 | Cluster-Hardening | Restrict API-Server Access
1) https://killercoda.com/killer-shell-cks/scenario/apiserver-misconfigured
```yaml
controlplane $ cat /var/log/containers/kube-apiserver-controlplane_kube-system_kube-apiserver-e89b6254729106f47242f0cb2d8a5d8261d6aa576a4725e607c7e7c8a4247f8d.log
2022-09-27T18:18:08.537975569Z stderr F Error: unknown flag: --this-is-very-wrong
```
2) https://killercoda.com/killer-shell-cks/scenario/apiserver-node-restriction
3) https://killercoda.com/killer-shell-cks/scenario/networkpolicy-create-default-deny


#### 16 - MicroService-Vulnerabilities-EtcD
- https://killercoda.com/killer-shell-cks/scenario/secret-etcd-encryption
- https://killercoda.com/killer-shell-cks/scenario/sandbox-gvisor
- https://killercoda.com/killer-shell-cks/scenario/privileged-containers
- https://killercoda.com/killer-shell-cks/scenario/privilege-escalation-containers



#### 24 SupplyChainSecurity | SecureSupplyChain
- https://killercoda.com/killer-shell-cks/scenario/image-policy-webhook-setup
- 

#### 25 RuntimeSecurity | Behavorial Analytics
- https://killercoda.com/killer-shell-cks/scenario/syscall-activity-strace
- https://killercoda.com/killer-shell-cks/scenario/falco-change-rule

## 26 RuntimeSecurity | Container Immutability
- https://killercoda.com/killer-shell-cks/scenario/immutability-readonly-fs


## Tough Questions
1) Container Sandboxes
  - RuntimeClasses
  - PodSecurityPolicies - Creating Roles/Rolebindings
  -

2) BehavioralAnalytics
  - Falco

3) Upgrade etcD
- How can you retrieve secrets directly from etcD?
- es get /registry/secrets/default/SECRETNAME

4) Secret Encryption - EtcD
-



# SERVICEACCOUNTS NOTE - No More Auto-Created Secrets
https://itnext.io/big-change-in-k8s-1-24-about-serviceaccounts-and-their-secrets-4b909a4af4e0
- How can you create a secret that corresponds to the service account?
  - 

```yaml
apiVersion: v1
kind: Secret
type: kubernetes.io/service-account-token
metadata:
  name: policy
  annotations:
    kubernetes.io/service-account.name: "policy"
```

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: world
  namespace: world
spec:
  rules:
  - host: "world.universe.mine"
    http:
      paths:
      - pathType: Prefix
        path: "/europe"
        backend:
          service:
            name: europe
            port:
              number: 80
      - pathType: Prefix
        path: "/asia"
        backend:
          service:
            name: asia
            port:
              number: 80
      - pathType: Prefix
        path: "/"
        backend:
          service:
            name: asia
            port:
              number: 80
```
