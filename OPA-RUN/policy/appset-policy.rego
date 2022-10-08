# from https://www.conftest.dev
package main

violation[{"msg": msg}] {
  input.kind = "ApplicationSet"
  generator := input.spec.generators[_]
  not generator.matrix
  msg = "AppSets must have Matrix Generator as 1st Generator"
}

violation[{"msg": msg}] {
  input.kind = "ApplicationSet"
  generator := input.spec.generators[_]
  matrixnestedgenerator := generator.matrix.generators[_]
  not matrixnestedgenerator.clusters
  msg = "AppSets w/ Matrix Generator should have nested Clusters-Generator"
}

violation[{"msg": msg}] {
  not input.metadata.namespace = "argocd"
  msg = "AppSets must have ArgoCD as Namespace"
}

violation[{"msg": msg}] {
  not endswith(input.metadata.name, "-appset")
  msg = sprintf("Name should end with '-appset'. Name: <%v>", [input.metadata.name])
}
