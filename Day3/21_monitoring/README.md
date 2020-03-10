# Kube Prometheus

```sh
git clone https://github.com/coreos/kube-prometheus/
kubectl create -f manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl create -f manifests/
```

# Metrics server
```sh
git clone https://github.com/kubernetes-sigs/metrics-server
kubectl apply -f metrics-server/deploy/kubernetes/
```