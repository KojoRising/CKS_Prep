# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

#### 1)
```yaml

```

#### 2) 
```yaml
kubectl get ns -oname | sed -e "s;namespace/;;" > namespace-list
for NS in $(cat namespace-list); do kc rolebinding view-smoke --clusterrole=view --user=smoke -n="$NS"; done
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

