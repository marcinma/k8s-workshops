Fetching metrics from Heapster is deprecated as of Kubernetes 1.11.
*metric server required*


https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

```sh
kubectl create -f hpa/sqrt.deployment.yml
kubectl create -f hpa/sqrt.service.yml
kubectl create -f hpa/hpa.yml
kubectl get hpa

kubectl exec -ti nginx-ds-ml2vh curl sqrt-generator.default

kubectl get --raw "/apis/metrics.k8s.io/v1beta1/namespaces/default/pods"

for i in {1..10}; do kubectl exec -ti nginx-ds-ml2vh curl sqrt-generator.default & done
watch kubectl get hpa
watch kubectl get pods
```