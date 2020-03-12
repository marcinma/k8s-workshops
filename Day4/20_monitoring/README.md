# Kube Prometheus

```sh
git clone https://github.com/coreos/kube-prometheus/
kubectl create -f manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl create -f manifests/
```

# Minikube

```sh
minikube addons list
minikube addons enable metrics-server
```

# Metrics server
```sh
git clone https://github.com/kubernetes-sigs/metrics-server
kubectl apply -f metrics-server/deploy/kubernetes/
```
kubectl edit deployment metrics-server -n kube-system

```yml
    args:
    - --cert-dir=/tmp
    - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
    - --kubelet-insecure-tls
    - --metric-resolution=30s

dnsPolicy: ClusterFirst
hostNetwork: true
```
