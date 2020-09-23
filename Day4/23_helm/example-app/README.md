https://helm.sh/docs/intro/install/

```sh
curl https://get.helm.sh/helm-v3.1.1-linux-amd64.tar.gz -o helm-v3.1.1-linux-amd64.tar.gz
tar -zxvf helm-v3.1.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
```

```sh
helm template --output-dir=./output .
helm template --output-dir=./output --values ./production.values.yaml .

```

```sh
kubectl create ns mynamespace
helm install . --generate-name
helm ls

kubectl config set-context --current=true --namespace=mynamespace
kubectl get all

kubectl config set-context --current=true --namespace=default
helm uninstall <>
helm upgrade --install --atomic my-release .

kubectl get all -n mynamespace
kubectl get secrets -n mynamespace

```
