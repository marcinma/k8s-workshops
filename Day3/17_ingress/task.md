1. Create ingress for python 

you should be able to access python at

kubernetes.docker.internal:<node-prt>/python/healthz

2. Create config map with redishost: <redis-service-name> 
3. Use config map in python deployment to set REDIS_HOST
4. Use volumes in redis deployment to attach volume to `/data` folder