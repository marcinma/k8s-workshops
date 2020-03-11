## Limit by default

https://kubernetes.io/docs/concepts/policy/limit-range/

```sh
kubectl create -f limitrange.yaml
kubectl describe limitrange mem-limit-range
```

## Resource quotas

https://kubernetes.io/docs/concepts/policy/resource-quotas/