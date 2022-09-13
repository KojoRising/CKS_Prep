# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

#### 1) 
```yaml
kc -f https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/course-content/opa/gatekeeper.yaml
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
```

#### 2) Create Constraint
```yaml
apiVersion: templates.gatekeeper.sh/v1beta1
kind: ConstraintTemplate
metadata:
  name: argoappsets 
spec:
  crd:
    spec:
      names:
        kind: ArgoAppSets
      validation:
        # Schema for the `parameters` field
        openAPIV3Schema:
          properties:
            labels:
              type: array
              items: string
  targets:
    - target: admission.k8s.gatekeeper.sh
      rego: |
        package argoappsets

        violation[{"msg": msg}] {
          generator := input.review.object.spec.generators[_]
          endswith(generator, "matrix")
          msg := sprintf("generator <%v> uses non-matrix generator", [generator])
        }       
```

#### 3)
```yaml
apiVersion: constraints.gatekeeper.sh/v1beta1
kind: ArgoAppSets
metadata:
  name: test-argo-appset
spec:
  enforcementAction: deny
  match:
    kinds:
      - apiGroups: ["argoproj.io/v1alpha1"]
        kinds: ["ApplicationSet"]
  parameters:
    labels: ["finance"]
```

#### 4) MATRIX GENERATOR
```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: cluster-secretjobs-appset
  namespace: argocd
spec:
  generators:
    - matrix:
        generators:
          - git:
              repoURL: https://github.com/argoproj/argo-cd.git
              revision: HEAD
              directories:
              - path: /applicationset/examples/list-generator/guestbook/engineering-dev
          - clusters:
              selector:
                matchLabels:
                  kubernetes.cnp.io/environment: admin
                  kubernetes.cnp.io/cluster.jurisdiction: tkgi
                  argocd.argoproj.io/secret-type: cluster
                matchExpressions:
                  - key: kubernetes.cnp.io/cluster.region
                    operator: In
                    values: ["hal", "ewd"]
  template:
    metadata:
      name: 'cluster-secretjobs-{{path.basename}}-{{name}}'
      labels:
        kubernetes.cnp.io/app-type: cluster-secretjobs
        kubernetes.cnp.io/environment: '{{metadata.labels.kubernetes.cnp.io/environment}}'
        kubernetes.cnp.io/cluster.name: '{{path.basename}}'
        kubernetes.cnp.io/cluster.region: '{{metadata.labels.kubernetes.cnp.io/cluster.region}}'
        kubernetes.cnp.io/cluster.jurisdiction: '{{metadata.labels.kubernetes.cnp.io/cluster.jurisdiction}}'
    spec:
      project: default
      source:
        path: '{{path}}'
        repoURL: https://github.com/argoproj/argo-cd.git
        targetRevision: HEAD
      destination:
          namespace: argocd
          server: '{{server}}'
      syncPolicy:
        automated:
          prune: true
```

#### 5) GIT GENERATOR ONLY
```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: cluster-secretjobs-appset
  namespace: argocd
spec:
  generators:
    - git:
        repoURL: https://github.com/argoproj/argo-cd.git
        revision: HEAD
        directories:
        - path: /applicationset/examples/list-generator/guestbook/engineering-dev
  template:
    metadata:
      name: 'cluster-secretjobs-{{path.basename}}-{{name}}'
      labels:
        kubernetes.cnp.io/app-type: cluster-secretjobs
        kubernetes.cnp.io/environment: '{{metadata.labels.kubernetes.cnp.io/environment}}'
        kubernetes.cnp.io/cluster.name: '{{path.basename}}'
        kubernetes.cnp.io/cluster.region: '{{metadata.labels.kubernetes.cnp.io/cluster.region}}'
        kubernetes.cnp.io/cluster.jurisdiction: '{{metadata.labels.kubernetes.cnp.io/cluster.jurisdiction}}'
    spec:
      project: default
      source:
        path: '{{path}}'
        repoURL: https://github.com/argoproj/argo-cd.git
        targetRevision: HEAD
      destination:
          namespace: argocd
          server: '{{server}}'
      syncPolicy:
        automated:
          prune: true
```

#### 6)
```yaml



# from https://www.conftest.dev
package main

deny[msg] {
  input.kind = "ApplicationSet"
  generator := input.spec.generators[_]
  not generator.matrix
  msg = "AppSets must have Matrix Generator as 1st Generator"
}
  
deny[msg] {
  input.kind = "ApplicationSet"
  generator := input.spec.generators[_]
  matrixnestedgenerator := generator.matrix.generators[_]
  print(matrixnestedgenerator.clusters)
  not matrixnestedgenerator.clusters
  msg = "AppSets w/ Matrix Generator should have nested Clusters-Generator"
}

deny[msg] {
  input.kind = "ApplicationSet"
  not input.metadata.namespace = "argocd"
  msg = "AppSets must have ArgoCD as Namespace"
}

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

