Make sure nfs can be mounted (DNS resolution)

```sh
sudo apt install nfs-kernel-server
sudo mkdir /var/nfs/general -p
sudo chown nobody:nogroup /var/nfs/general

vim /etc/exports
```

```
/var/nfs/general     172.18.126.14(rw,sync,root_squash,subtree_check)
/var/nfs/general     172.18.126.13(rw,sync,root_squash,subtree_check)
```


```sh
sudo exportfs -ra
sudo systemctl restart nfs-kernel-server
```


```sh
sudo apt install nfs-common
sudo apt install cifs-utils
```

* create index.html on /var/nfs/general

* Expose NodePort
* Trafic from service
kubectl get svc -o wide
kubectl describe service my-app-service
kubectl exec -ti nginx-deployment-5b4f6cf8b4-kxt8l curl my-app-service

* service routes trafic on nodes