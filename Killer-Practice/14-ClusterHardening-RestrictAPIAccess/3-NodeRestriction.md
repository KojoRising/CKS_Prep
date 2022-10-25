# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```
## Verify the issue
The Kubelet on node01 shouldn't be able to set Node labels starting with `node-restriction.kubernetes.io/*` on other Nodes than itself
Verify this is not restricted atm by performing the following actions as the Kubelet from node01 :
- add label killercoda/one=123 to Node controlplane
- add label node-restriction.kubernetes.io/one=123 to Node node01

#### 1) 
```yaml
controlplane $ ssh node01
Last login: Fri Oct  8 17:04:36 2021 from 10.32.0.22
node01 $ export KUBECONFIG=/etc/kubernetes/kubelet.conf 
node01 $ k get nodes
NAME           STATUS   ROLES           AGE   VERSION
controlplane   Ready    control-plane   25d   v1.24.0
node01         Ready    <none>          25d   v1.24.0
node01 $ k label node/controlplane killercoda/one=123
node/controlplane labeled
node01 $ k label node/node01 node-restriction.kubernetes.io/one=123 
node/node01 labeled
```

## Enable the NodeRestriction Admission Controller
Enable the NodeRestriction Admission Controller and verify the issue is gone by trying to
- add label killercoda/two=123 to Node controlplane
- add label node-restriction.kubernetes.io/two=123 to Node node01

#### 1) Add the following flag
```yaml
    - --enable-admissions-plugin=NodeRestriction
```

#### 2) Check to see if you can labels
```yaml
node01 $ k label node/controlplane killercoda/two=123
Error from server (Forbidden): nodes "controlplane" is forbidden: node "node01" is not allowed to modify node "controlplane"
node01 $ k label node/node01 node-restriction.kubernetes.io/two=123
Error from server (Forbidden): nodes "node01" is forbidden: is not allowed to modify labels: node-restriction.kubernetes.io/two
node01 $ 
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

