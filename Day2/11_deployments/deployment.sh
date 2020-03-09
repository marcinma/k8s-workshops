 kubectl apply -f deployment.yaml
 kubectl get rs
 kubectl scale deployment/nginx-deployment --replicas=0

 * kubectl rollout history deployments/nginx-deployment

kubectl annotate deployment/nginx-deployment kubernetes.io/change-cause="env updated"

 * kubectl replace
 * kubectl replace --force