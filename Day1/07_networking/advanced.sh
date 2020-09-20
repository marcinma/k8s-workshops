docker container run --network none -d --name nonet ewoutp/docker-nginx-curl
docker container exec -ti nonet curl google.com

docker container run --network bridge -d --name bridgenet ewoutp/docker-nginx-curl
docker container exec -ti bridgenet curl google.com


docker network create network-a

docker container run --network network-a -d --name a1 --net-alias n1 ewoutp/docker-nginx-curl
docker container run --network network-a -d --name a2 --net-alias n2 ewoutp/docker-nginx-curl
docker container exec -ti a1  /bin/bash
    ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1
docker container exec -ti a2  /bin/bash

docker network create network-b

docker container run --network network-b -d --name b1 --net-alias n1 ewoutp/docker-nginx-curl
docker container exec -ti b1  /bin/bash

docker container run --network network-b -d --name b2 --net-alias n2 ewoutp/docker-nginx-curl