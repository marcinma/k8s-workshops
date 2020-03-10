Make sure nfs can be mounted (DNS resolution)

```sh
sudo apt install nfs-kernel-server
sudo mkdir /var/nfs/general -p
sudo mkdir /var/nfs/general/00
sudo mkdir /var/nfs/general/01
sudo chown -R nobody:nogroup /var/nfs/general

sudo vim /etc/exports
```

```exports
/var/nfs/general     127.0.0.1(rw,sync,root_squash,subtree_check)
```


```sh
sudo exportfs -ra
sudo systemctl restart nfs-kernel-server
```

## On each worker that will mount volume

```sh
sudo apt install nfs-common
sudo apt install cifs-utils
```

1. create index.html on /var/nfs/general/01
2. Expose NodePort
3. Verify your index