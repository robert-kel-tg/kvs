# Build docker tag
docker build --tag kvs .

# Run image in detached mode
docker run --detach --publish 8080:8080 kvs

