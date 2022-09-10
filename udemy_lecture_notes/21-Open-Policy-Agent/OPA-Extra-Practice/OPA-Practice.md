# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

#### 1) Latest Image Violation - https://dustinspecker.com/posts/open-policy-agent-introduction-gatekeeper/
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
          endswith(container.image, ":latest")
          msg := sprintf("container <%v> uses an image tagged with latest <%v>", [container.name, container.image])
        }        
```

#### 2) Create Constraint
```yaml
apiVersion: constraints.gatekeeper.sh/v1beta1
kind: LatestImage
metadata:
  name: not-allowed
spec:
  enforcementAction: deny
  match:
    kinds:
      - apiGroups: [""]
        kinds: ["Pod"]
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

