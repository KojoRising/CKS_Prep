# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

There is Deployment container-host-hacker in Namespace team-red which mounts /run/containerd as a hostPath volume on the Node where its running. This means that the Pod can access various data about other containers running on the same Node.

You're asked to forbid this behavior by:

Enabling Admission Plugin PodSecurityPolicy in the apiserver
- Creating a PodSecurityPolicy named `psp-mount` which allows hostPath volumes only for directory /tmp
- Creating a ClusterRole named `psp-mount` which allows to use the new PSP
- Creating a RoleBinding named `psp-mount` in Namespace team-red which binds the new ClusterRole to all ServiceAccounts in the Namespace team-red
- Restart the Pod of Deployment `container-host-hacker` afterwards to verify new creation is prevented.

NOTE: PSPs can affect the whole cluster. Should you encounter issues you can always disable the Admission Plugin again.

     

#### 0) Setup
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: container-host-hacker
  name: container-host-hacker
spec:
  replicas: 1
  selector:
    matchLabels:
      app: container-host-hacker
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: container-host-hacker
    spec:
      volumes:
        - name: host-vol
          hostPath:
            path: /run/containerd
      containers:
      - image: nginx
        name: nginx
        resources: {}
        volumeMounts:
          - mountPath: /tmp
            name: host-vol
status: {}
```

#### 1) Create PSP
```yaml
apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: psp-mount
spec:
  allowedHostPaths:
  - pathPrefix: /tmp
    readOnly: false
  privileged: false  # Don't allow privileged pods!
  # The rest fills in some required fields.
  seLinux:
    rule: RunAsAny
  supplementalGroups:
    rule: RunAsAny
  runAsUser:
    rule: RunAsAny
  fsGroup:
    rule: RunAsAny
  volumes:
  - '*'
```

#### 2) Create ClusterRole + Rolebindings
```yaml
controlplane $ kc clusterrole psp-mount --verb=use --resource=podsecuritypolicy $d
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  creationTimestamp: null
  name: psp-mount
rules:
- apiGroups:
  - policy
  resources:
  - podsecuritypolicies
  verbs:
  - use
  
controlplane $ kc rolebinding psp-mount --clusterrole=psp-mount --group=system:serviceaccount $d
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  creationTimestamp: null
  name: psp-mount
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: psp-mount
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: Group
  name: system:serviceaccount

controlplane $ kc rolebinding psp-mount --clusterrole=psp-mount --group=system:serviceaccounts --serviceaccount=default:default --group=system:serviceaccounts:default $d
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  creationTimestamp: null
  name: psp-mount
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: psp-mount
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: Group
  name: system:serviceaccounts
- apiGroup: rbac.authorization.k8s.io
  kind: Group
  name: system:serviceaccounts:default
#- kind: ServiceAccount
#  name: default
#  namespace: default
```

#### 3) 
```yaml

```

#### 4) TMP Testing
```yaml
# kc clusterrole deploy-role --verb="create,delete" --resource=deploy $d
# kc rolebinding deploy-binding --clusterrole=deploy-role --group=system:serviceaccounts $d
# k auth can-i --as system:serviceaccount:default:default --list -n=default | grep "Name\|deployment"
controlplane $ kc clusterrole deploy-role --verb="create,delete" --resource=deploy $d
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  creationTimestamp: null
  name: deploy-role
rules:
- apiGroups:
  - apps
  resources:
  - deployments
  verbs:
  - create
  - delete
controlplane $ kc rolebinding deploy-binding --clusterrole=deploy-role --group=system:serviceaccounts $d
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  creationTimestamp: null
  name: deploy-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: deploy-role
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: Group
  name: system:serviceaccounts
  
## Testing
controlplane $ k auth can-i --as system:serviceaccount:default:default --list -n=default | grep "Name\|deployment"
Resources                                       Non-Resource URLs                     Resource Names   Verbs
deployments.apps                                []                                    []               [create delete]
```

#### 5)
```yaml
controlplane $ kg ev | grep "MESSAGE\|new-deploy"
LAST SEEN   TYPE      REASON                    OBJECT                                      MESSAGE
35s         Warning   FailedCreate              replicaset/new-deploy-64d7658d74            Error creating: pods "new-deploy-64d7658d74-" is forbidden: PodSecurityPolicy: unable to admit pod: [spec.volumes[0].hostPath.pathPrefix: Invalid value: "/run/containerd": is not allowed to be used]
76s         Normal    ScalingReplicaSet         deployment/new-deploy                       Scaled up replica set new-deploy-64d7658d74 to 1
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

