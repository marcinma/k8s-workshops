CRI-O or Docker

```sh
apt-get update
apt-get install -y docker.io
sudo swapoff -a  
```

*Kube stuff*

```sh
sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
```

*Init*

```
kubeadm init
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

*Join*

```
kubeadm join 172.18.126.9:6443 --token <token> --discovery-token-ca-cert-hash <cer-hash>
```
Find lost token

```sh
kubeadm token create --print-join-command 
```


*Cert issues*

```
mkdir ~/mycerts; cd ~/mycerts
cp /etc/kubernetes/pki/ca.crt ca.pem
cp /etc/kubernetes/pki/ca.key ca-key.pem
```

```
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem \
  --config=ca-config.json -profile=kubernetes \
  kubelet-csr.json | cfssljson -bare kubelet
```

```
scp kubelet.pem maque@knode2:~/kubelet.crt
scp kubelet-key.pem maque@knode2:~/kubelet.key
```
ssh

cp kubelet.crt /var/lib/kubelet/pki/kubelet.crt
cp kubelet.key /var/lib/kubelet/pki/kubelet.key

systemctl restart kubelet