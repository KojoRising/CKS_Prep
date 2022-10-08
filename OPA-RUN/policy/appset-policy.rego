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
