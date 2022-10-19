# Build

```shell
docker build -t nginx_playground .
```

# Start

```shell
docker run --rm --name nginx_playground -d -p '8443:8443' -it nginx_playground
```

# Use

Visit http://localhost:8443/?workspace=/config/default.workspace

# Stop

```shell
docker stop nginx_playground
```


