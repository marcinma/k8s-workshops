# Manual expose

```sh
kubectl expose pod myapp-pod --type=NodePort --port=80
```

this works also on rc/deployment/ etc.

# Expose using declarative approach

```sh
kubectl create -f service.yaml
```
