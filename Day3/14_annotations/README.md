Are used for *non-identifying* information

```json
"metadata": {
  "annotations": {
    "key1" : "value1",
    "key2" : "value2"
  }
}
```

```sh
kubectl annotate pod es-cluster-0 workshop.test=verified
kubectl get pods es-cluster-0 -o jsonpath='{.metadata.annotations}'
```