https://dl.k8s.io/v1.14.0/kubernetes-server-linux-amd64.tar.gz
tar -xzvf kubernetes-server-linux-amd64.tar.gz
sudo mkdir -p /etc/kubernetes/manifests
sudo swapoff -a  

kubelet –pod-manifest-path /etc/kubernetes/manifests &> /etc/kubernetes/kubelet.log &

/etc/kubernetes/manifests
pod.yaml
```yaml 
kind: Pod
apiVersion: v1
metadata:
   name: test
   labels:
      app: ngnx
spec:
   containers:
      - name: ngnx
        image: nginx
        ports:
           - name: http
             containerPort: 80
             protocol: TCP
```

svc.yaml
```yaml 
kind: Service
apiVersion: v1
metadata:
   name: svc   
spec:
   selector:
      app: ngnx
   ports:
      - port: 80
        protocol: TCP
```



https://github.com/etcd-io/etcd/releases/download/v3.3.13/etcd-v3.3.13-linux-amd64.tar.gz
tar -xzvf etcd-v3.3.13-linux-amd64.tar.gz
# cp etcd etcdctl /usr/bin
etcd --listen-client-urls http://0.0.0.0:2379 --advertise-client-urls http://localhost:2379 &> /etc/kubernetes/etcd.log  &

# CONSIDER CLUSTERING!

```sh
# kube-apiserver --etcd-servers=http://localhost:2379 --service-cluster-ip-range=10.0.0.0/16 --bind-address=0.0.0.0 --insecure-bind-address=0.0.0.0 &> /etc/kubernetes/api-server.log  &


kube-apiserver --etcd-servers=http://localhost:2379 --service-cluster-ip-range=10.0.0.0/16 --bind-address=0.0.0.0 --insecure-bind-address=0.0.0.0 --disable-admission-plugins=NamespaceLifecycle,LimitRanger,SecurityContextDeny,ServiceAccount,ResourceQuota &> /etc/kubernetes/api-server.log  &
```


curl http://localhost:8080/api/v1/nodes

# Set kubectl to curent cluster
kubectl cluster-info
kubectl config set-cluster kubebinary --server=http://localhost:8080
kubectl config set-context kubebinary --cluster=kubebinary
kubectl config use-context kubebinary
kubectl config view

- mv .kube/config ..
-  pkill -f kubelet

kubelet --register-node --kubeconfig=.kube/config &> /etc/kubernetes/kubelet.log &

kubectl get nodes
curl http://localhost:8080/api/v1/nodes

ps -au | grep kube

# Scheduler

kube-scheduler --master=http://localhost:8080 &> /etc/kubernetes/kube-scheduler.log &

# remove taint

kubectl taint nodes playground node.kubernetes.io/not-ready:NoSchedule-

apply pod/svc

# Add kube-controller
kubectl get endpoints

kube-controller-manager --master=http://localhost:8080 &> /etc/kubernetes/kube-controller-manager.log &

kubectl get endpoints

curl http://localhost:8080/metrics

# Add kube-proxy

curl 10.0.68.223:80 -> fail

kube-proxy --master=http://localhost:8080 &> /etc/kubernetes/kube-proxy.log &

curl 10.0.68.223:80 -> works

iptables -t nat -L KUBE-SERVICES
iptables-save > ipt
cat ipt | grep KUBE-SVC-ZSJW7XMLYKSJNCVW
cat ipt | grep KUBE-SEP-KZDSU24BGAJIKWS7