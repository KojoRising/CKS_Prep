# Introduction/Overview

1)
2)
3)
4)
5)

curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh

## Hardest Practice Problems


#### 5 | Containers Under the Hood | Docker Container Namespaces
1) https://killercoda.com/killer-shell-cks/scenario/container-namespaces-docker

#### 6 | Network Policies
1) https://killercoda.com/killer-shell-cks/scenario/networkpolicy-create-default-deny
2) 

#### 14 | Cluster-Hardening | Restrict API-Server Access
1) https://killercoda.com/killer-shell-cks/scenario/apiserver-misconfigured
2) https://killercoda.com/killer-shell-cks/scenario/apiserver-node-restriction
3) https://killercoda.com/killer-shell-cks/scenario/networkpolicy-create-default-deny


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
