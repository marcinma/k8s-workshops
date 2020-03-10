kubectl create configmap configuration --from-file=./

kubectl get configmap/configuration -o yaml

# From env file

kubectl create configmap fromenv --from-env-file=env-file-example
kubectl get configmap/fromenv -o json

# Data as file

kubectl create configmap game-config-3 --from-file=<my-key-name>=<path-to-file>

# Autoupdates for mounted configmaps

kubectl edit configmap configuratio
kubectl logs -f configmap-volume-pod