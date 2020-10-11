[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/on-my-own/default%2Fkvs?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWY4MmZmMWQzM2NjYzAxYmE1MGE5MzYz.yXr-QXh-2a-XAIVDqhoZnd-kFLD1xrbgRBsNluwASsg)]( https://g.codefresh.io/pipelines/edit/new/builds?id=5f83010aad3d8200720b36a8&pipeline=kvs&projects=default&projectId=5f82ff4e2afa6586303429bc)

# Build docker tag
docker build --tag kvs .

# Run image in detached mode
docker run --detach --publish 8080:8080 kvs

