https://helm.sh/docs/intro/install/

```sh
wget https://get.helm.sh/helm-v3.1.1-linux-amd64.tar.gz
tar -zxvf helm-v3.1.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
```

```sh
helm template --output-dir=./output .
helm template --output-dir=./output --values ./production.values.yaml .

```

```sh
helm install . --generate-name
helm ls

kubectl config set-context --current=true --namespace=mynamespace
kubectl get all

helm uninstall <>
helm upgrade --install --atomic my-release .

kubectl config set-context --current=true --namespace=default
kubectl get all -n mynamespace
kubectl get secrets -n mynamespace

```
