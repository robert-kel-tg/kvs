.PHONY: test build pack deploy ship

TAG?=$(shell git rev-list HEAD --max-count=1 --abbrev-commit)
export TAG

test:
	go test ./...

build:
	go build -ldflags "-X main.version=$(TAG)" -a -o kvs .

pack:
	CGO_ENABLED=0 GOOS=linux make build
	docker build -t robkel/kvs:$(TAG) .

upload:
	docker push robkel/kvs:$(TAG)

deploy:
	envsubst < k8s/deployment.yml | kubectl apply -f -

ship: pack upload


#ship: test pack upload deploy clean
