Setup multinode simple:

1. 
``sh
sudo apt install openssh-server -y
sudo vim /etc/netplan/01-netcfg.yaml

```

```yml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
     dhcp4: no
     addresses: [172.31.61.9/24]
     gateway4: 172.31.61.1
     nameservers:
       addresses: [8.8.8.8,8.8.4.4]
```

```sh
sudo netplan apply
sudo swapoff -a
sudo vim /etc/fstab # remove swap
```

# new ubuntu version
```sh

sudo apt-get install -y iptables arptables ebtables

# switch to legacy versions
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo update-alternatives --set arptables /usr/sbin/arptables-legacy
sudo update-alternatives --set ebtables /usr/sbin/ebtables-legacy

sudo apt install docker.io -y
```

```sh
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

edit /etc/docker/daemon.json
```json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
```

```sh
sudo systemctl enable docker.service
sudo systemctl restart docker.service
````

```sh
kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml
```

# One second node:
```sh
sudo kubeadm join 172.18.111.70:6443 --token
```

# On first node

```sh
kubectl get pods --all-namespaces
```

# allow shedule on control plane

```sh
kubectl taint nodes --all node-role.kubernetes.io/master-
```

```sh
scp ubuntu@172.18.111.70:~/.kube/config .
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
./kubectl --kubeconfig config get pods -A
```

# Reset

```sh
kubeadm reset
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X
```