# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

## K8s Dashboard Problem 

The Kubernetes Dashboard is installed in Namespace kubernetes-dashboard and is configured to:

Allow users to "skip login"
Allow insecure access (HTTP without authentication)
Allow basic authentication
Allow access from outside the cluster
You are asked to make it more secure by:
- Deny users to "skip login"
- Deny insecure access, enforce HTTPS (self signed certificates are ok for now)
- Add the --auto-generate-certificates argument
- Enforce authentication using a token (with possibility to use RBAC)
- Allow only cluster internal access

#### 1) Create Dashboard
```yaml
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/alternative.yaml
```

#### 2) 
```yaml
controlplane $ kg deploy/kubernetes-dashboard -oyaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
spec:
  progressDeadlineSeconds: 600
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      k8s-app: kubernetes-dashboard
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        k8s-app: kubernetes-dashboard
    spec:
      containers:
      - args:
        - --namespace=kubernetes-dashboard
        - --enable-insecure-login=false
        - --enable-skip-login=false
        - --auto-generate-certificates
        - --authentication-mode=token
        image: kubernetesui/dashboard:v2.7.0
        imagePullPolicy: IfNotPresent
        livenessProbe:
          failureThreshold: 3
          httpGet:
            path: /
            port: 9090
            scheme: HTTP
          initialDelaySeconds: 30
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 30
        name: kubernetes-dashboard
        ports:
        - containerPort: 9090
          protocol: TCP
        resources: {}
        securityContext:
          allowPrivilegeEscalation: false
          readOnlyRootFilesystem: true
          runAsGroup: 2001
          runAsUser: 1001
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:
        - mountPath: /tmp
          name: tmp-volume
      dnsPolicy: ClusterFirst
      nodeSelector:
        kubernetes.io/os: linux
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext:
        seccompProfile:
          type: RuntimeDefault
      serviceAccount: kubernetes-dashboard
      serviceAccountName: kubernetes-dashboard
      terminationGracePeriodSeconds: 30
      tolerations:
      - effect: NoSchedule
        key: node-role.kubernetes.io/master
      volumes:
      - emptyDir: {}
        name: tmp-volume
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

