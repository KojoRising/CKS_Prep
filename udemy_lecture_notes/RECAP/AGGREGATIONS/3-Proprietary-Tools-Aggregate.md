# Proprietary Tools Aggregate

curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh

## 1 Cluster Setup - 10%
`kube-bench` -
- Overview - Runs CIS Benchmark checks on your cluster, and sees if there are any issues
- General Syntax:
  - `kube-bench run --check [CHECK-STRING]`

## 2 Cluster-Hardening - 15%

## 3 System Hardening - 15%

## 4 Minimize Microservice Vulnerabilities - 20%
1) Encryption Configuration - https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/#encrypting-your-data
- For etcD Secret encryption
- Has providers - (ie. identity, aesgcm)
- FLAGS
  `--encryption-provider-config=/etc/kubernetes/etcd/ec.yaml`
  - Volume Mounts
2) Runtime Class - https://kubernetes.io/docs/concepts/containers/runtime-class/
- Pod-Level - `pod.spec.runtimeClassName`
- `spec.handler` - Should be `runsc` for gvisor
- `metadata.name` - Should match `pod.spec.runtimeClassName`

3) 
## 5 Supply Chain Security - 20%
1) ImagePolicyWebhook
- `--enable-admission-plugins=NodeRestriction,ImagePolicyWebhook`
- `--admission-control-config-file=/etc/kubernetes/admission-control/config.yaml`
## 6 Monitoring, Logging and Runtime Security - 20%
1) Audit Policy
- `--audit-policy-file=/etc/kubernetes/audit-policy.yaml` 
- `--audit-log-path=/var/log/kubernetes/audit/audit.log`



## 1 Cluster Setup - 10%

## 2 Cluster-Hardening - 15%

## 3 System Hardening - 15%

## 4 Minimize Microservice Vulnerabilities - 20%

## 5 Supply Chain Security - 20%

## 6 Monitoring, Logging and Runtime Security - 20%
