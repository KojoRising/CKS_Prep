## 1 Linux Directories | By Chapter

curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh


1) `/proc` - Info on per/process
#### How can you check if a pod is running with privilegeEscalation?
- `cat /proc/1/status | grep "NoNewPrivs"`. 1 means privilegeEscalation, 0 means not. 

2) `/etc`
  - `/etc/apparmor.d` - AppArmor Profiles
  - `/etc/falco/falco_rules.yaml`
  - `/etc/falco/falco_rules.local.yaml`

#### What are some important files in the `/proc/PID` directory?
- environ - Has all environment variables (say for a pod)
- fd - File Descriptor

### Ch 29
- `/etc/passwd` - Where all users are stored

## 2 Linux Commands | By Chapter

`crictl ps` - For checking if container/image is spun back up


### Ch 13 Cluster Hardening - Service Accounts
`mount` - For checking where serviceaccount is mounted intra-pod.
- Usually /run/secrets/


### Ch 17 Container Runtime Sandboxes
`uname -r` - For checking kernel group (host vs container)
- See if kernel group name is different
`id` - For checking id/group running in a pod
  
### Ch. 18 OS-Level-Security-Domain
- Check if container/pod is running privileged (direct mapping between container-root & host-root)
  - `sysctl kernel.hostname=myfakehost` - See if command runs successfully. 
- Check if container/pod is running with privilege escalation
  - `cat /proc/1/status/ | grep "NoNewPrivs` - 1 = Yes, 0 = No


### Ch 25 Behavioral Analytics
`strace ls` - Intercepts & Logs syscalls

### Ch 28 Kernel Hardening Tools
- apt install apparmor-utils
- aa-status
- aa-logprof
- aa-genprof
- aa-complain
- aa-enforce
- apparmor-parser
- docker run --security-opt apparmor=docker-nginx nginx
- a) Get containerID - `crictl ps | grep IMAGE`
- b) `crictl inspect CONT_ID | grep apparmor`

### Ch 29 Reduce Attack Surface
- Check Ports
  - `netstat -plnt | grep PORT`
  - `lsof -i :PORT`
- `whoami` - Check current user
- `su USER` - Switch to User
- `sudo -i` - Return to root from current user
- `adduser USER` - Add User

