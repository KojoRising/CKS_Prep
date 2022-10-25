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

createMatrixAppset() {
  cp -r CKS_Prep/OPA-RUN/. .
}

testAppsets() {
  for file in ArgoCD-Sample-Appsets/; do
    docker run --rm -v $(pwd):/project openpolicyagent/conftest test $file
  done
#  docker run --rm -v $(pwd):/project openpolicyagent/conftest test ArgoCD-Sample-Appsets/git-appset.yaml
}

useKonstraint() {
  docker run -v $PWD:/konstraint ghcr.io/plexsystems/konstraint create /konstraint/policy
}

initAllSteps() {
  init_setup
  install_opa
  install_argo
  git clone git@github.com:KojoRising/CKS_Prep.git
#  createMatrixAppset
  docker pull openpolicyagent/conftest
  docker pull ghcr.io/plexsystems/konstraint
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

case "$1" in
  "") initAllSteps; exit;;
  *) "$@"; exit;;
esac
