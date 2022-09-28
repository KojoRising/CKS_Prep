# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

#### 1) Create Service Accounts
```yaml
# Create Service Accounts
kc sa pipeline -n=ns1
kc sa pipeline -n=ns2
# Create Rolebindings
kc clusterrolebinding view-pipeline-ns2 --clusterrole=view --serviceaccount=ns2:pipeline
kc clusterrolebinding view-pipeline-ns1 --clusterrole=view --serviceaccount=ns1:pipeline
```

#### 2) Create Clusterrole + Rolebindings for deployment creation/deletion
```yaml
kc clusterrole create-deploy --resource=deployment --verb="create,delete"

kc rolebinding create-deploy-pipeline -n=ns1 --serviceaccount=ns1:pipeline --clusterrole=create-deploy
kc rolebinding create-deploy-pipeline -n=ns2 --serviceaccount=ns2:pipeline --clusterrole=create-deploy
```

#### 3) Check Result
```yaml
k auth can-i --as system:serviceaccount:ns1:pipeline --list -n=ns1
k auth can-i --as system:serviceaccount:ns2:pipeline --list -n=ns2
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
