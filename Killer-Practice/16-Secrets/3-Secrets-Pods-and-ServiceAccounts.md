# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

## Problem #1
Create new Namespace ns-secure and perform everything following in there
Create ServiceAccount secret-manager
Create Secret sec-a1 with any literal content of your choice
Create Secret sec-a2 with any file content of your choice (like /etc/hosts )

#### 1)
```yaml
kc ns ns-secure
kubens ns-secure
kc secret generic sec-a1 --from-literal hello=world
kc secret generic sec-a2 --from-file=/etc/hosts $d
```

## Problem #2 
1. Create Pod secret-manager image httpd:alpine which uses the new ServiceAccount
2. Make Secret sec-a1 available as environment variable SEC_A1
3. Mount Secret sec-a2 into the Pod read-only under /etc/sec-a2
4. Verify your solution worked

#### 2) 
```yaml
k run secret-manager --image=httpd:alpine $d | k set sa secret-manager --local --dry-run=client -oyaml -f - | ka - 
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: secret-manager
  name: secret-manager
spec:
  volumes:
    - name: secret-vol
      secret:
        secretName: sec-a2
  containers:   
  - image: httpd:alpine
    name: pod
    resources: {}
    volumeMounts:
      - mountPath: /etc/sec-a2
        name: secret-vol
        readOnly: true
    env:
    - name: SEC_A1
      valueFrom:
        secretKeyRef:  
          key: hello
          name: sec-a1
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  serviceAccountName: secret-manager
```

#### 3) Check the value
```yaml
controlplane $ kx pod/secret-manager -- env | grep SEC_A1
SEC_A1=world

controlplane $ kx pod/secret-manager -- cat /etc/sec-a2/hosts
127.0.0.1 localhost

# The following lines are desirable for IPv6 capable hosts
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
127.0.0.1 ubuntu
127.0.0.1 host01
127.0.0.1 controlplane
```

#### 4)
```yaml

```

#### 5)
```yaml

```

#### 6)
```yaml

```

#### 7)
```yaml

```

#### 8)
```yaml

```

#### 9)
```yaml

```

#### 10)
```yaml

```
