# 编译amd64镜像

```shell
docker buildx build \
    --platform linux/amd64 \
    --tag persiliao/echo-service:latest \
    --output type=docker,dest=./echo-service.tar .
```