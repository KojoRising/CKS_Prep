#!/bin/bash


install_argo() {
  kubectl create namespace argocd && kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
}

install_opa() {
  kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml
}

init_setup() {
  curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
}

init_policy_directory() {
  rm -rf ./policy
  mkdir policy
  cat <<EOF > policy/appset-policy.rego
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
EOF
}

createMatrixAppset() {
  rm -rf matrix-appset.yaml
  rm -rf git-appset.yaml
  git clone git@github.com:KojoRising/CKS_Prep.git
  cp CKS_Prep/OPA-RUN/ .
}

#createGitAppset() {
#  rm -r git-appset.yaml
#  cat <<EOF > git-appset.yaml
#apiVersion: argoproj.io/v1alpha1
#kind: ApplicationSet
#metadata:
#  name: cluster-secretjobs-appset
#  namespace: argocd
#spec:
#  generators:
#    - git:
#        repoURL: https://github.com/argoproj/argo-cd.git
#        revision: HEAD
#        directories:
#        - path: /applicationset/examples/list-generator/guestbook/engineering-dev
#  template:
#    metadata:
#      name: 'cluster-secretjobs-{{path.basename}}-{{name}}'
#      labels:
#        kubernetes.cnp.io/app-type: cluster-secretjobs
#        kubernetes.cnp.io/environment: '{{metadata.labels.kubernetes.cnp.io/environment}}'
#        kubernetes.cnp.io/cluster.name: '{{path.basename}}'
#        kubernetes.cnp.io/cluster.region: '{{metadata.labels.kubernetes.cnp.io/cluster.region}}'
#        kubernetes.cnp.io/cluster.jurisdiction: '{{metadata.labels.kubernetes.cnp.io/cluster.jurisdiction}}'
#    spec:
#      project: default
#      source:
#        path: '{{path}}'
#        repoURL: https://github.com/argoproj/argo-cd.git
#        targetRevision: HEAD
#      destination:
#          namespace: argocd
#          server: '{{server}}'
#      syncPolicy:
#        automated:
#          prune: true
#  EOF
#}

init_setup
install_opa
install_argo
init_policy_directory
createMatrixAppset
