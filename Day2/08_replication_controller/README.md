# Legacy - deployment + replicaset is the recommended way to set up replication

```sh
kubectl create -f replication-controller.yml
kubectl get rc
kubectl describe rc/nginx
kubectl get pods -l app=nginx

kubectl scale rc/nginx --replicas=2
kubectl expose rc/nginx --type=NodePort --port 80

kubectl get svc -l app=nginx
kubectl describe svc nginx
curl 172.18.111.71:32551
kubectl logs -l app=nginx


kubectl delete -f replication-controller.yml
```
