# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

Some containers need to run more secure and restricted. There is an existing AppArmor profile located at /opt/course/9/profile for this.

1 Install the AppArmor profile on Node cluster1-worker1. Connect using ssh cluster1-worker1.
2 Add label security=apparmor to the Node
3 Create a Deployment named apparmor in Namespace default with:
- One replica of image nginx:1.19.2
- NodeSelector for security=apparmor
- Single container named c1 with the AppArmor profile enabled
- The Pod might not run properly with the profile enabled. Write the logs of the Pod into /opt/course/9/logs so another team can work on getting the application running.


#### 1) Sample Profile
```yaml
# /opt/course/9/profile 

#include <tunables/global>
  
profile very-secure flags=(attach_disconnected) {
  #include <abstractions/base>

  file,

  # Deny all file writes.
  deny /** w,
}
```

#### 2) 
```yaml
controlplane $ kc deploy apparmor --image=nginx:1.19.2 $d
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: apparmor
  name: apparmor
spec:
  replicas: 1
  selector:
    matchLabels:
      app: apparmor
  strategy: {}
  template:
    metadata:
      labels:
        app: apparmor
      annotations:
        container.apparmor.security.beta.kubernetes.io/c1: localhost/very-secure
    spec:
      nodeSelector:
        security: apparmor
      containers:
      - image: nginx:1.19.2
        name: c1
        resources: {}
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

