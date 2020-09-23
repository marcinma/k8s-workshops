Fetching metrics from Heapster is deprecated as of Kubernetes 1.11.
*metric server required*



https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

```sh
kubectl create -f hpa/sqrt.deployment.yaml
kubectl create -f hpa/sqrt.service.yaml
kubectl create -f hpa/hpa.yaml
kubectl get hpa

kubectl exec -ti nginx-stsf-0 -- curl  sqrt-generator.default

kubectl get --raw "/apis/metrics.k8s.io/v1beta1/namespaces/default/pods"

for i in {1..10}; do kubectl exec -ti nginx-stsf-0 curl sqrt-generator & done
watch kubectl get hpa
watch kubectl get pods
```