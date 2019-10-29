docker build -t uday1005/multi-client:latest -t uday1005/multi-client:123456uday -f ./client/Dockerfile ./client
docker build -t uday1005/multi-server:latest -t uday1005/multi-server:123456uday -f ./server/Dockerfile ./server
docker build -t uday1005/multi-worker:latest -t uday1005/multi-worker:123456uday -f ./worker/Dockerfile ./worker
docker push uday1005/multi-client
docker push uday1005/multi-server
docker push uday1005/multi-worker
docker push uday1005/multi-client:123456uday
docker push uday1005/multi-server:123456uday
docker push uday1005/multi-worker:123456uday
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=uday1005/multi-server:123456uday
kubectl set image deployments/client-deployment client=uday1005/multi-client:123456uday
kubectl set image deployment/worker-deployment worker=uday1005/multi-client:123456uday

