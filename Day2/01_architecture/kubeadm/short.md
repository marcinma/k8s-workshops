sudo apt install   apt-transport-https   ca-certificates  curl  gnupg-agent  software-properties-common  openssh-server  docker.io -y

sudo apt install docker.io -y
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 
sudo systemctl enable docker.service

sudo vim /etc/netplan/01-netcfg.yaml

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
	   
	   
sudo netplan apply
sudo swapoff -a
sudo vim /etc/fstab # remove swap



cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system



curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt install -y kubelet=1.15.1-00 kubeadm=1.15.1-00 kubectl=1.15.1-00 kubernetes-cni=0.7.5-00 --allow-downgrades
sudo apt-mark hold kubelet=1.15.1-00 kubeadm=1.15.1-00 kubectl=1.15.1-00 kubernetes-cni=0.7.5-00


sudo kubeadm init --pod-network-cidr=192.168.0.0/16 
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml

kubectl taint nodes --all node-role.kubernetes.io/master-
