docker build -t neocycf/multi-client:latest -t neocycf/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t neocycf/multi-server:latest -t neocycf/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t neocycf/multi-worker:latest -t neocycf/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push neocycf/multi-client:latest
docker push neocycf/multi-server:latest
docker push neocycf/multi-worker:latest

docker push neocycf/multi-client:$SHA
docker push neocycf/multi-server:$SHA
docker push neocycf/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=neocycf/multi-server:$SHA
kubectl set image deployments/client-deployment client=neocycf/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=neocycf/multi-worker:$SHA
