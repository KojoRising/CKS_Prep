# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

#### 1) Comprehensions
```yaml
https://www.openpolicyagent.org/docs/latest/policy-language/#comprehensions
So from this example: https://www.openpolicyagent.org/docs/latest/policy-language/#comprehensions

violation[{"msg": msg, "details": {"missing_labels": missing}}] {
   provided := {label | input.request.object.metadata.labels[label]} ## Return label
   required := {label | label := input.parameters.labels[_]} ## return label
   missing := required - provided
   count(missing) > 0
   msg := helpers.make_message(missing)
}



```

#### 2)
```yaml

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

