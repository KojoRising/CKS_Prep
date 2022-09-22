## Linux Directories | By Chapter

1) `/proc` - Info on per/process
#### How can you check if a pod is running with privilegeEscalation?
- `cat /proc/1/status | grep "NoNewPrivs"`. 1 means privilegeEscalation, 0 means not. 

#### What are some important files in the `/proc/PID` directory?
- environ - Has all environment variables (say for a pod)
- fd - File Descriptor

2)

## Linux Commands | By Chapter

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




