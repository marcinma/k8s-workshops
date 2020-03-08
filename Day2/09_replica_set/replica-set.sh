kubectl get pod
kubectl apply -f replica-set.yaml
kubectl get pod -o wide
# change pod name
kubectl apply -f pod.yaml
kubectl get pod -o wide
# delete pod
kubectl delete pod myapp-pod
kubectl get pod -o wide

kubectl delete rs replicate-my-app
kubectl delete rs replicate-my-app --cascade=false