# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```
## Problem #1
1. Create a Secret named holy with content creditcard=1111222233334444
2. Create Secret from file /opt/ks/secret-diver.yaml

#### 1) 
```yaml
kc secret generic holy --from-literal creditcard=1111222233334444
ka /opt/ks/secret-diver.yaml
```

## Problem #2
1. Create a Pod named pod1 of image nginx
2. Make Secret holy available as environment variable HOLY
3. Mount Secret diver as volume. The file should be available under /etc/diver/hosts .
4. Test env+volume access in the running Pod

#### 2) 
```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: pod1
  name: pod1
spec:
  volumes:
    - name: secret-vol
      secret:
        secretName: diver
  containers:
  - image: nginx
    name: pod1
    resources: {}
    env:
    - name: HOLY
      valueFrom: 
        secretKeyRef: 
          name: holy
          key: creditcard
    volumeMounts:
      - mountPath: /etc/diver
        name: secret-vol
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```

#### 3) 
```yaml

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
