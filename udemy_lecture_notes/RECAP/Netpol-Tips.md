# Introduction/Overview

1)
2)
3)
4)
5)

curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh

### Netpol Tips

1) What ways/commands can you use for testing from an nginx pod? What does each of them offer?
- curl/nslookup. nslookup - Does NameResolution (For DNS Lookups). Curl - No Name Resolution.

2) When you run an nginx pod, what network tool should you install?
- dnsutils

3) What's the DNS name format for services?
SVC.NS.svc.CLUSTER-DOMAIN. Usually "svc.default.svc.cluster.local"

NOTE:

WHEN WE DON't HAVE k8s-app label!!

controlplane $ kx app1-0 -- curl microservice1.space2.svc.cluster.local
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>

WHEN WE HAVE the "k8s-app: kube-dns" label:

controlplane $ kx app1-0 -- curl microservice1.space2.svc.cluster.local
curl: (6) Could not resolve host: microservice1.space2.svc.cluster.local
command terminated with exit code 6
