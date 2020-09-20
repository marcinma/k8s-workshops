# Create deployment

```sh
kubectl create -f deployment.yaml
kubectl get rs
kubectl get pods
kubectl scale deployment/nginx-deployment --replicas=0
kubectl get pods

```

# Use env variable
uncomment  `env` list

```sh
kubectl rollout history deployments/nginx-deployment
kubectl apply -f deployment.yaml --record

kubectl rollout status deployment/nginx-deployment
kubectl rollout history deployment/nginx-deployment --revision=1
kubectl rollout history deployment/nginx-deployment --revision=2
kubectl annotate deployment/nginx-deployment kubernetes.io/change-cause="env updated"
kubectl rollout history deployments/nginx-deployment
```

# Exec container and check env exists:

```sh
kubectl exec -ti $(kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}') /bin/bash
env|grep TEST_ENV
```

# Rollback to previous version

```sh
kubectl rollout undo deployment/nginx-deployment
kubectl annotate deployment/nginx-deployment kubernetes.io/change-cause="env removed"
kubectl rollout history deployments/nginx-deployment

kubectl exec -ti $(kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}') /bin/bash
env|grep TEST_ENV

kubectl rollout undo deployment/nginx-deployment --to-revision=2
kubectl exec -ti <container_name>  /bin/bash
env|grep TEST_ENV
```

# Scale deployment 
```sh
kubectl scale deployment nginx-deployment --replicas=3
kubectl describe svc my-app-service
```
 - check endpoints


# Debug information:
```sh
kubectl logs -f -l app=myapp
kubectl describe rs <replica_set_name>
```

```sh
kubectl replace
kubectl replace --force  # deletes & creates
```
