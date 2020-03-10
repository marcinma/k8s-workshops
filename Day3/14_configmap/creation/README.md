kubectl create configmap configuration --from-file=./

kubectl get configmap/configuration -o yaml

# From env file

kubectl create configmap fromenv --from-env-file=env-file-example
kubectl get configmap/fromenv -o json
kubectl get configmap/fromenv -o yaml

# Data as file

kubectl create configmap test-config --from-file=<my-key-name>=<path-to-file>
kubectl create configmap test-config --from-file=s.json=service.json
kubectl get configmap/test-config -o yaml

# Create pods

```sh
kubectl create -f pod-config.yaml
kubectl logs configmap-pod
```

```sh
kubectl create -f pod-config-volume.yaml
kubectl logs configmap-volume-pod
```

# Autoupdates for mounted configmaps

kubectl edit configmap configuration
kubectl logs -f configmap-volume-pod