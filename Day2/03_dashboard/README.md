kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml

create admin-user/rbac

find admin user:
```
kubectl -n kubernetes-dashboard get secret
kubectl -n kubernetes-dashboard describe secret admin-user-token-w6hln
```

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default