# Remember!

Remember to use your names for images, containers, labels etc.

# Convention

```
<command> - represents command
<command|command2> - represent possible commands
<?> - represents placeholder to be filled by task resolution
<??> - represents one or many placeholders to be filled 
# - represents comment, example
``` 

# Configuration

1. 2 VMs with docker
2. SSH Connection
3. Mounted folder
4. MobaXTerm
5. Visual Studio Code

```sh
sudo su - 
apt-get update
apt-get install -y docker.io curl openssh-server cifs-utils git
docker version # should return version
git version # should return version
curl google.com # should return 301
mkdir /mnt/docker-workshops
mount.cifs -o username=<hostuser>,domain=<hostdomain> //<host_switch_ip>/docker-workshops /mnt/docker-workshops
```

connect to docker
with

```sh
docker -h <docker_host_ip> <command>
# eg. docker -h 192.168.0.1 container ls
```

Edit  */lib/systemd/system/docker.service*
```vim /lib/systemd/system/docker.service
/usr/bin/dockerd -H tcp://0.0.0.0:2375
```

```sh
systemctl daemon-reload
systemctl restart docker 
```
