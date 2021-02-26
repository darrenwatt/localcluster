## Test deployment on a local Kubernetes cluster with load balancing

Results for this are available at http://localcluster.darrenwatt.com but running in a cloud provider as a demo.

Docker container for this is available in [DockerHub](https://hub.docker.com/repository/docker/darrenwatt/localcluster) and Dockerfile is supplied if the image needs to be modified.

The container runs nginx with PHP, and some test content to show the IP for the pod serving each request.

### Prerequisites

A local kubernetes cluster. Tested in [MiniKube](https://minikube.sigs.k8s.io/docs/) but any K8's environment should work.
`minikube start` to start the local cluster, check here if you run into trouble https://minikube.sigs.k8s.io/docs/start/

### Deploying

First of all, clone the repo.
```
git clone https://github.com/darrenwatt/localcluster
cd localcluster
```

Apply the deployment and basic load balancer.
```
kubectl apply -f deployment.yml
kubectl apply -f service.yml
```

In another window, start the tunnel to create a routable IP if required.
```
minikube tunnel
``` 

You should now be able to see the pods and service running, with the EXTERNAL-IP for testing which should be possible to view in a browser.


Clean up when finished
```
kubectl delete -f deployment.yml
kubectl delete -f service.yml
```
