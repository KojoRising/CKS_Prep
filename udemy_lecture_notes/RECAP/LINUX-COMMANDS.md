## Linux Directories | By Chapter

1) `/proc` - Info on per/process
#### How can you check if a pod is running with privilegeEscalation?
- `cat /proc/1/status | grep "NoNewPrivs"`. 1 means privilegeEscalation, 0 means not. 

#### What are some important files in the `/proc/PID` directory?
- environ - Has all environment variables (say for a pod)
- fd - File Descriptor

2)

## Linux Commands | By Chapter


`mount` - For checking where serviceaccount is mounted intrapod
`uname -r` - For checking kernel group (host vs container)
`id` - For checking id/group running in a pod
`crictl ps` - For checking if container/image is spun back up

## 25 -Behavioral Analytics
`strace ls` - Intercepts & Logs syscalls
