Create replica set with python flask application
Create registry replica set using `registry:2` image
Attach service to this registry

Tag previous builded image and push it

```sh
docker image tag my-pathon 127.0.0.1:3200/my-python
docker image push 127.0.0.1:3200/my-python
```