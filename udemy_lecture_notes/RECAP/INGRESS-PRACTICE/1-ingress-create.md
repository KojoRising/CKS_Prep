# https://killercoda.com/killer-shell-cks/scenario/ingress-create


ls
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
kubens world
k expose deploy/asia --port=80 --type=ClusterIP $d  |  tee asia-svc.yaml | ka -
k expose deploy/europe --port=80 --type=ClusterIP $d  |  tee europe-svc.yaml | ka -

ADDR="$(kd node/controlplane | grep InternalIP | sed "s;InternalIP:;;" | xargs)" 
echo "$ADDR"
curl "${$ADDR}"





## INGRESS REVIEW | Preliminary Ingress

Below. can curl successfully
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: world
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  defaultBackend:
    service:
      name: asia
      port:
        number: 80
  rules: 
    - host: world.universe.mine
      http:
        paths:
          - backend:
              

curl http://172.30.1.2:30080
hello, you reached ASIA
```



## INGRESS REVIEW | NEW Ingress

Below. can curl successfully
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: world
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  defaultBackend:
    service:
      name: asia
      port:
        number: 80
  rules: []
```

