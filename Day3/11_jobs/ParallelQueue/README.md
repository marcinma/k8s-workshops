sudo docker container run -e IS_CONSUMER=FALSE  -e REDIS_HOST=172.18.126.1 marcinmakowski/kubernetes:python-redis-consumer-producer python redis-consumer-producer.py
kubectl logs -f -l project=workshop


