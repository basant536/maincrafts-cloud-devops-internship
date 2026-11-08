# Enterprise Kubernetes Platform

Cloud-native e-commerce platform (**ShopEasy**) on Kubernetes, built as **Task 6** of the Maincrafts Cloud Computing & DevOps internship.

It covers the journey from Docker Compose to Kubernetes: Pods, Deployments, Services, configuration, persistent storage, Helm, Ingress, autoscaling, security and high availability, running locally on Minikube.

## Tech Stack

Kubernetes (Minikube) | kubectl | Helm | NGINX Ingress | PostgreSQL | Redis | Metrics Server + HPA | RBAC + NetworkPolicy | GitHub Actions | Docker

## Architecture

```
User
  |
NGINX Ingress (host and path routing, TLS)
  |
Services (ClusterIP / NodePort / LoadBalancer / Headless)
  |
Pods: ShopEasy Frontend (Helm chart, 2 replicas)
  |
PostgreSQL + Redis  ->  Persistent Volume Claims

Cross-cutting: HPA + Metrics Server | RBAC + NetworkPolicy + Pod Security | Probes + PDB + Anti-affinity
```

## Implementation Status

| Phase | Topic | Status |
|---|---|---|
| 1-2 | Kubernetes fundamentals, Minikube cluster | Done |
| 3 | Pods (nginx, alpine, busybox) | Done |
| 4 | Deployments, rolling update, rollback | Done |
| 5 | Services (ClusterIP, NodePort, LoadBalancer, Headless) | Done |
| 6 | ConfigMaps and Secrets | Done |
| 7 | Persistent storage (PostgreSQL, Redis, PVC) | Done |
| 8 | Helm chart (ShopEasy frontend) | Done |
| 9 | NGINX Ingress (host and path routing) | Done |
| 10 | Metrics Server and HPA | Done |
| 11 | Prometheus and Grafana | Config included; dashboards were demonstrated in Task 5 and not re-captured here due to laptop RAM limits |
| 12 | Loki and Fluent Bit | Planned (future work) |
| 13 | ArgoCD GitOps | Planned (future work) |
| 14 | Security (RBAC, NetworkPolicy, Pod Security) | Done |
| 15 | CI/CD (GitHub Actions) | Workflow included in docs |
| 16 | High availability (probes, anti-affinity, PDB) | Done |
| 17 | Disaster recovery | Documented |
| 18 | Optimization | Resource requests and limits set on workloads |

## Repository Structure

```
Task-06/
  k8s-task6/
    pods/ deployments/ services/ config/ storage/
    hpa/ ha/ ingress/ security/ monitoring/
    helm/ecommerce/        Helm chart (ShopEasy frontend)
  Screenshot/              Proof of each phase
  Video/                   Demo video (link below)
  README.md
```

## Quick Start

Requirements: Docker Desktop, Minikube, kubectl, Helm.

```bash
minikube start --driver=docker --cpus=2 --memory=3000

kubectl apply -f k8s-task6/config/configmap.yaml
kubectl apply -f k8s-task6/config/secret.example.yaml
kubectl apply -f k8s-task6/storage/

helm install ecommerce k8s-task6/helm/ecommerce -n ecommerce --create-namespace --set useConfigMapHtml=true
kubectl port-forward -n ecommerce svc/ecommerce-frontend 8082:80
```

Open http://localhost:8082 to see the ShopEasy store.

Verify:

```bash
kubectl get nodes
kubectl get pods -A
kubectl get svc
kubectl get pvc
helm list -A
```

## Highlights

- **Rolling updates and rollbacks** on a 3-replica Deployment with zero downtime
- **Persistent PostgreSQL and Redis**: data survives pod deletion (verified)
- **Helm chart** with parameterized values; one-command deploy, upgrade and rollback
- **Ingress** with host-based and path-based routing
- **HPA** on CPU and memory, with Metrics Server
- **Security**: RBAC (read-only developer vs admin), default-deny NetworkPolicy, Pod Security baseline
- **High availability**: readiness and liveness probes, pod anti-affinity, PodDisruptionBudget

## Demo and Screenshots

- Screenshots: see the `Screenshot/` folder
- Demo video: `<add your Google Drive / YouTube link here>`

## Challenges and Learnings

- **API server TLS timeouts** on a low-RAM laptop; fixed by stopping other containers and tuning Docker/WSL memory.
- **Metrics API unavailable** until metrics-server became ready.
- **Helm monitoring install failed** because of a slow admission webhook; fixed for local use.
- **WSL hang** required resetting Docker Desktop and recreating the cluster.
- **Secrets** are never committed; `secret.example.yaml` is provided instead.

## Limitations and Future Work

- Run Prometheus, Grafana, Loki and ArgoCD on a machine with more RAM or a cloud cluster (EKS/GKE).
- Use cert-manager and Let's Encrypt for real TLS certificates.
- Move databases to StatefulSets and automate backups.
- Complete the CI/CD flow: build and push image, update Helm tag, ArgoCD sync.

## Author

**Basant Kumar**  
GitHub: [basant536](https://github.com/basant536)