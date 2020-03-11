Fetching metrics from Heapster is deprecated as of Kubernetes 1.11.

https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

```sh
kubectl create -f hpa
kubectl get hpa
kubectl exec -ti nginx-ds-ml2vh curl sqrt-generator.default
```