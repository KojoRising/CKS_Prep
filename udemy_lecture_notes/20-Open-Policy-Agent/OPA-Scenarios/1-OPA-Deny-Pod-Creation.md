# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

### Create a Policy that denies all pod creation 

#### 1) ConstraintTemplate
```yaml
apiVersion: templates.gatekeeper.sh/v1beta1
kind: ConstraintTemplate
metadata:
  name: k8salwaysdeny
spec:
  crd:
    spec:
      names:
        kind: K8sAlwaysDeny
      validation:
        # Schema for the `parameters` field
        openAPIV3Schema:
          properties:
            message:
              type: string
  targets:
    - target: admission.k8s.gatekeeper.sh
      rego: |
        package k8salwaysdeny

        violation[{"msg": msg}] {
          1 > 0
          msg := input.parameters.message
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

