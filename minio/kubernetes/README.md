# MinIO Minikube Deployment

## Deployment
```
kubectl apply -f namespace.yml
kubectl apply -f persitent-volume.yml
kubectl apply -f minio-secret.yml
kubectl apply -f minio-statefulset.yml
kubectl apply -f minio-service.yml
```

## Configuration

### Get Node IP and Port
```
minikube service minio-nodeport-service -n database
```
