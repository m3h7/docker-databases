# CouchDB Minikube Deployment

## Deployment
```
kubectl apply -f namespace.yml
kubectl apply -f persitent-volume.yml
kubectl apply -f couchdb-secret.yml
kubectl apply -f couchdb-statefulset.yml
kubectl apply -f couchdb-service.yml
```

## Configuration

### Get Node IP and Port
```
minikube service couchdb-nodeport-service -n database
```

### Cluster Configuration
- ssh into first pod. It will be the master.
```
kubectl exec -ti couchdb-0 -n=database -- /bin/bash
```

- join other two nodes to the cluster
```
curl -X POST -H "Content-Type: application/json" http://admin:password@127.0.0.1:5984/_cluster_setup -d '{"action": "enable_cluster", "bind_address":"0.0.0.0", "username": "admin", "password":"password", "port": 5984, "node_count": "3", "remote_node": "couchdb-1.couchdb-service>", "remote_current_user": "admin", "remote_current_password": "password" }'

curl -X POST -H "Content-Type: application/json" http://admin:password@127.0.0.1:5984/_cluster_setup -d '{"action": "add_node", "host":"couchdb-1.couchdb-service", "port": 5984, "username": "admin", "password":"password"}'
```
```
curl -X POST -H "Content-Type: application/json" http://admin:password@127.0.0.1:5984/_cluster_setup -d '{"action": "enable_cluster", "bind_address":"0.0.0.0", "username": "admin", "password":"password", "port": 5984, "node_count": "3", "remote_node": "couchdb-2.couchdb-service>", "remote_current_user": "admin", "remote_current_password": "password" }'

curl -X POST -H "Content-Type: application/json" http://admin:password@127.0.0.1:5984/_cluster_setup -d '{"action": "add_node", "host":"couchdb-2.couchdb-service", "port": 5984, "username": "admin", "password":"password"}'
```

- finish the cluster setup
```
curl -X POST -H "Content-Type: application/json" http://admin:password@127.0.0.1:5984/_cluster_setup -d '{"action": "finish_cluster"}'
```
