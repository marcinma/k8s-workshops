```sh
kubectl create secret generic my-secret --from-file=./my-secrets --from-literal=user=marcin
kubectl get secret my-secret -o yaml
```
