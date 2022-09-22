# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

#### 1) ConstraintTemplate
```yaml
apiVersion: templates.gatekeeper.sh/v1beta1
kind: ConstraintTemplate
metadata:
  name: latestimage
spec:
  crd:
    spec:
      names:
        kind: LatestImage
  targets:
    - target: admission.k8s.gatekeeper.sh
      rego: |
        package latestimage

        violation[{"msg": msg}] {
          container := input.review.object.spec.containers[_]
          endsWith(container.image, ":latest")
          msg := sprintf("container <%v> uses an image tagged with latest <%v>", [container.name, container.image])
        }       
```

#### 2) Constraint
```yaml
kind: K8sAlwaysDeny
apiVersion: constraints.gatekeeper.sh/v1beta1
metadata:
  name: denyall
spec:
  enforcementAction: warn
  match:
    excludedNamespaces: ["kube-system", "argocd", "gatekeeper-system"]
    kinds:
      - apiGroups: [""]
        kinds: ["Pod"]
  parameters:
    message: "ACCESS DENIED!"
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

