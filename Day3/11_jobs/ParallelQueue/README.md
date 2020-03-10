```sh
kubectl create -f producer.job.yaml
kubectl create -f parallel.job.yaml
kubectl get job
kubectl logs -f -l project=workshop
```

