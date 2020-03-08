# Labels

```yml
tier: frontend
release: stable
tenant: tenantA
```

kubectl

```sh
kubectl get pods -A --show-labels
kubectl get pods -l environment=production,tier=frontend
kubectl get pods -A -l 'tier in(control-plane)'
kubectl get pods -A -l 'tier in(control-plane),component notin(kube-scheduler)'

kubectl label pod/nginx-d8whw test-label=my-label
kubectl get pods -l test-label=my-label
```

# Resources for set based selectors
- Job
- Deployment
- ReplicaSet
- DaemonSet

```yml
selector:
  matchLabels:
    component: redis
  matchExpressions:
    - {key: tier, operator: In, values: [cache]}
    - {key: environment, operator: NotIn, values: [dev]}
```