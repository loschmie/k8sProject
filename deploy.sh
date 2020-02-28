docker build -t loschmie/k8s-client:latest -t loschmie/k8s-client:$SHA client/
docker build -t loschmie/k8s-server:latest -t loschmie/k8s-server:$SHA server/ 
docker build -t loschmie/k8s-worker:latest -t loschmie/k8s-worker:$SHA worker/
docker push loschmie/k8s-client:latest 
docker push loschmie/k8s-server:latest 
docker push loschmie/k8s-worker:latest 
docker push loschmie/k8s-client:$SHA 
docker push loschmie/k8s-server:$SHA 
docker push loschmie/k8s-worker:$SHA 
kubectl set image deployments/client-deployment client=loschmie/k8s-client:$SHA 
kubectl set image deployments/server-deployment server=loschmie/k8s-server:$SHA 
kubectl set image deployments/worker-deployment worker=loschmie/k8s-worker:$SHA