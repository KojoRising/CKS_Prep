# PRACTICE/OVERVIEW
```yaml
curl https://raw.githubusercontent.com/KojoRising/CKA_Prep/main/abbreviated_alias.sh > alias.sh && source alias.sh
```

#### 1)
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$1
    nginx.ingress.kubernetes.io/ssl-redirect: "false"
    nginx.ingress.kubernetes.io/use-regex: "true"
  name: world
  namespace: world
spec:
  ingressClassName: nginx
  tls:
    - hosts: 
      - "world.universe.mine"
      secretName: world-secret
  rules:
  - host: world.universe.mine
    http:
      paths:
      - backend:
          service:
            name: europe
            port:
              number: 80
        path: /europe
        pathType: Prefix
      - backend:
          service:
            name: asia
            port:
              number: 80
        path: /asia
        pathType: Prefix
status:
  loadBalancer:
    ingress:
    - ip: 172.30.1.2
```

#### 2)
```yaml
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: world
spec:
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ3FEQ0NBWkFDQVFBd1l6RUxNQWtHQTFVRUJoTUNRVlV4RXpBUkJnTlZCQWdNQ2xOdmJXVXRVM1JoZEdVeApJVEFmQmdOVkJBb01HRWx1ZEdWeWJtVjBJRmRwWkdkcGRITWdVSFI1SUV4MFpERWNNQm9HQTFVRUF3d1RkMjl5CmJHUXVkVzVwZG1WeWMyVXViV2x1WlRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUIKQUpsakpDNjBuVFRBcnpGUFYrSGVtMjIxemF1Z21CT1FXT1hZMzd0ZEg0RHdpOGNHckx5YnMzSnZ0RnNQUmVUcQpvdEF6UmdTQjl0VUtENDR6Njdrb2dqcW1IYnM0aFJ0R2lKZnltV01DSldnYjBndmtLNGZqVXU1b1gxMkQ0a04yCnNJZ3B4dEYxZkwxa2dCcDNjSU0xR2lPQy9qVmhSVWlRTDlKTXkxb3VNdXJJODNQYVRjTCtzSzRVSDlNSjdIeGoKeTNXUUFnbGFzY0w3M2tIUS9MNXEyOU5EYU9saDZEc2V1bklhNWxLMzAveHI4d3UxcnZxOGZ6KzlJQzl3Q1FtaQp5ZlU1SWdNQnlvQjVBOEY0VXB4UHBnVVdCQWxpQzlWS0hsWUZ4N1prdytjQTVrTDJ0NEEvSHV6Y0czZHlwQ3JTCjR0a2c1dWZsM2tQVmpZeFNwTmJCb3I4Q0F3RUFBYUFBTUEwR0NTcUdTSWIzRFFFQkN3VUFBNElCQVFBR3BpMkUKM0MxZUxDVUZ3R2Ntc1JlejFiU0FMUW9QcS9USnhCYTZzRjQzcUk1eDY1MUdpT0RQaVcxaWZjYU1Td3kwU09uVwpTd1dSUDl4ait4ZHdwRmFpdlZERU1VdTBVamQ0aDdmdFN4b1dxR1VNRjIvR2ROS1hlREE1b2hpYVdjbUh4K2c0CmNZTWtFL3Iva0d0NWNtTzZTQUM2cXBNUnRkQitHVDU1aVpIeEZtOXNzZmg5NjN2ejNWMFB0SWpia2UzVTBWd2MKZHZxM0EyTTFLTTEwOWh0SWUrZWNhY00reVRvd0ZEUWIvVXdUckEyQUVISngvL1pHdXVQMDE1NXJVZDh5b0JEKwpMM0NFME5IblphcjNsaW9YeDMyTVNyaitaZkNIYllWWUgxekZCUEpIRCtaUCtyNDJCbXUwUXI0YkdWV3dtemkxClB3WGFmdCtJOExzU0Z4T2wKLS0tLS1FTkQgQ0VSVElGSUNBVEUgUkVRVUVTVC0tLS0tCg==
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 864000  # one day
  usages:
  - client auth
```

#### 3)
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$1
    nginx.ingress.kubernetes.io/ssl-redirect: "false"
    nginx.ingress.kubernetes.io/use-regex: "true"
  name: world
  namespace: world
spec:
  ingressClassName: nginx
  rules:
  - host: world.universe.mine
    http:
      paths:
      - backend:
          service:
            name: europe
            port:
              number: 80
        path: /europe
        pathType: Prefix
      - backend:
          service:
            name: asia
            port:
              number: 80
        path: /asia
        pathType: Prefix
status:
  loadBalancer:
    ingress:
    - ip: 172.30.1.2
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

