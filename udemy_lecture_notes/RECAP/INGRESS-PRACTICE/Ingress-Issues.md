
1) If you see below, what might be the issue?
- Missing `ingressClassName: nginx`
```yaml
controlplane $ curl http://world.universe.mine:30080/
<html>
<head><title>404 Not Found</title></head>
<body>
<center><h1>404 Not Found</h1></center>
<hr><center>nginx</center>
</body>
</html>
```

2) How can you determine whether an ingress is tls-encrypted?
- `curl -kv URL` - CN should be...
  - Unencrypted - "Kubernetes Ingress Controller Fake Certificate"
  - Encrypted - "URL"


