# 1 Unfamiliar Topics

## 1 Cluster Setup - 10%
- Network Policies
- Ingress w/ TLS
- Node Metadata Protection
- Minimize Access to GUI Elements
- Verify Platform Binaries (SHA256)

## 2 Cluster-Hardening - 15%
- RBAC
- Restrict k8s API-Access
- Service account security
- Update k8s

## 3 System Hardening - 15%
- AppArmor, Seccomp

## 4 Minimize Microservice Vulnerabilities - 20%
• PSP, OPA, security contexts
• Sandboxes (gvisor, kata)
• mTLS - Pod2Pod Encryption

## 5 Supply Chain Security - 20% 
- Minimize Base Image Footprint - (ie. - RUN,ADD,COPY add layers)
- ImagePolicyWebhook
- whitelist image registries
- Sign/Validate images
- Use static analysis of user workloads (e.g. kubernetes resources, docker files)
  - Kubesec
  - Conftest (By OPA)
- Image Vulnerability Scanning
  - trivy
  - clair
  
## 6 Monitoring, Logging and Runtime Security - 20%
- Container Immutability
- Audit Logs
- Host/Container Level behavioral analytics- Syscall processes/file activities

# 2 Course Breakdown/Overview

## 1 Cluster Setup - 10%
- Network Policies
- CIS Benchmarks (review k8s components)
- Ingress w/ TLS
- Node Metadata Protection
- Minimize Access to GUI Elements
- Verify Platform Binaries (SHA256)

## 2 Cluster-Hardening - 15%
- RBAC
- Restrict k8s API-Access
- Service account security
- Update k8s

## 3 System Hardening - 15%
- Reduce Attack Surface 
- Minimize IAM roles
- Minimize external network access
- AppArmor, Seccomp
## 4 Minimize Microservice Vulnerabilities - 20%
• PSP, OPA, security contexts
• k8s Secrets - etcD encryption
• Sandboxes (gvisor, kata)
• mTLS - Pod2Pod Encryption
## 5 Supply Chain Security - 20%
- Minimize Base Image Footprint - (ie. - RUN,ADD,COPY add layers)
- ImagePolicyWebhook
- whitelist image registries
- Sign/Validate images
- Use static analysis of user workloads (e.g. kubernetes resources, docker files)
  - Kubesec
  - Conftest (By OPA)
- Image Vulnerability Scanning
  - trivy
  - clair

## 6 Monitoring, Logging and Runtime Security - 20%
- Container Immutability
- Audit Logs
- Host/Container Level behavioral analytics- Syscall processes/file activities  

# 3 Curriculum Overview

## 1 Cluster Setup - 10%
• Use Network security policies to restrict cluster level access
• Use CIS benchmark to review the security configuration of Kubernetes components
(etcd, kubelet, kubedns, kubeapi)
• Properly set up Ingress objects with security control
• Protect node metadata and endpoints
• Minimize use of, and access to, GUI elements
• Verify platform binaries before deploying

## 2 Cluster-Hardening - 15%
• Restrict access to Kubernetes API
• Use Role Based Access Controls to minimize exposure
• Exercise caution in using service accounts e.g. disable defaults, minimize permissions on
newly created ones
• Update Kubernetes frequently

## 3 System Hardening - 15%
• Minimize host OS footprint (reduce attack surface)
• Minimize IAM roles
• Minimize external access to the network
• Appropriately use kernel hardening tools such as AppArmor, seccomp

## 4 Minimize Microservice Vulnerabilities - 20%
• Setup appropriate OS level security domains e.g. using PSP, OPA, security contexts
• Manage kubernetes secrets
• Use container runtime sandboxes in multi-tenant environments (e.g. gvisor, kata containers)
• Implement pod to pod encryption by use of mTLS

## 5 Supply Chain Security - 20%
• Minimize base image footprint
• Secure your supply chain: whitelist allowed image registries, sign and validate images
• Use static analysis of user workloads (e.g. kubernetes resources, docker files)
• Scan images for known vulnerabilities


## 6 Monitoring, Logging and Runtime Security - 20%
• Perform behavioral analytics of syscall process and file activities at the host and container
level to detect malicious activities
• Detect threats within physical infrastructure, apps, networks, data, users and workloads
• Detect all phases of attack regardless where it occurs and how it spreads
• Perform deep analytical investigation and identification of bad actors within environment
• Ensure immutability of containers at runtime
• Use Audit Logs to monitor access
