# Production-Grade Multi-Container Deployment with Docker Compose

A Cloud Computing and DevOps internship project focused on building a containerized e-commerce application with service networking, persistent storage, reverse proxying, monitoring, logging, backup automation, and CI/CD.

## Project Overview

This project demonstrates how multiple application services can be configured and operated together using Docker Compose. It follows a production-oriented architecture with separate frontend and backend services, PostgreSQL for persistent data, Redis for caching, and Nginx as a reverse proxy.

The extended architecture includes Prometheus and Grafana for monitoring, centralized log collection, automated database backups, and a GitHub Actions pipeline for build and deployment automation.

After completing and documenting the deployment, the EC2 instance was terminated to prevent unnecessary cloud resource usage and charges.

Therefore, the GitHub Actions deployment check may currently display a failed status because the original EC2 instance used for the demonstration is no longer available.

The successful deployment is documented through the project screenshots, demo video, and documentation.

## Architecture

```text
Users / Browser
      |
    Nginx
      |
  +---+---------+
  |             |
Frontend     Backend API
                |
          +-----+-----+
          |           |
      PostgreSQL     Redis

Monitoring: Prometheus + Grafana
Automation: GitHub Actions
Orchestration: Docker Compose
Storage: Docker volumes
```

## Technology Stack

- Docker and Docker Compose
- Nginx reverse proxy
- Node.js and Express backend
- PostgreSQL database
- Redis cache
- Prometheus and Grafana monitoring
- Git and GitHub Actions
- PowerShell for local setup on Windows

## Project Structure

```text
Task-05/
├── frontend/
│   ├── index.html
│   └── Dockerfile
├── backend/
│   ├── package.json
│   ├── server.js
│   └── Dockerfile
├── nginx/
│   └── default.conf
├── prometheus/
├── grafana/
├── backups/
├── scripts/
├── docker-compose.yml
├── .env
├── .gitignore
└── README.md
```

## Prerequisites

- Docker Desktop with Docker Compose support
- Git
- A code editor

## Local Setup

1. Clone the repository and navigate to the Task-05 directory.
2. Create a local `.env` file containing the required database settings.
3. Validate the Compose configuration:

```bash
docker compose config
```

4. Build and start the configured services:

```bash
docker compose up -d --build
```

5. Check running containers and service logs:

```bash
docker compose ps
docker compose logs --tail=100
```

6. Open `http://localhost:8080` if the Nginx service is configured to publish port 8080.
7. Test the backend health endpoint at `http://localhost:8080/api/health`.

## Core Components

### Container Orchestration
Docker Compose defines application services, dependencies, networks, environment variables, and persistent volumes in a central configuration file.

### Reverse Proxy
Nginx receives incoming HTTP requests and routes website traffic to the frontend and API requests to the backend.

### Persistent Storage
Named Docker volumes are used to retain database and cache data beyond the lifetime of an individual container. Database backups should be stored separately from the database volume.

### Monitoring and Logging
The planned monitoring stack uses Prometheus to collect metrics and Grafana to visualize them. Application and proxy logs support troubleshooting and operational visibility.

### Backup and Recovery
Backup automation should create database backups, report failures, and document restoration procedures. A backup is not considered verified until a restore test succeeds.

### CI/CD
GitHub Actions can automate build, validation, image publishing, and deployment. Deployment credentials must be stored as repository secrets rather than committed to source control.

## Security Practices

- Keep `.env` and all credentials out of version control.
- Use non-root users inside containers where supported.
- Avoid publishing database and Redis ports publicly.
- Restrict access to monitoring dashboards.
- Use SSH keys and GitHub Actions secrets for deployment authentication.
- Scan container images and update dependencies regularly.

## Verification Checklist

- [ ] Docker Compose configuration validates successfully.
- [ ] Frontend and backend are accessible through Nginx.
- [ ] PostgreSQL and Redis health checks pass.
- [ ] Database data persists after container recreation.
- [ ] Monitoring dashboards display actual metrics.
- [ ] Application and proxy logs are accessible.
- [ ] Backup and restore have been tested.
- [ ] CI/CD workflow completes successfully.
- [ ] Deployment recovery procedure has been tested.

## Deliverables

- Dockerfiles and Docker Compose configuration
- Nginx reverse proxy configuration
- Monitoring and logging configuration
- Backup and recovery scripts
- CI/CD workflow
- Architecture diagram and screenshots
- Setup, security, and troubleshooting documentation

## Cost Considerations

Local development with Docker Desktop helps reduce cloud costs. If a cloud VM is used for deployment, monitor its billing and remove resources that are no longer needed.

## Learning Outcomes

This project provides hands-on practice with container orchestration, service discovery, networking, persistent storage, reverse proxies, monitoring, logging, backups, security hardening, and automated deployment.

---

**Project:** Cloud Computing & DevOps — Task 5  
**Focus:** Production-oriented multi-container deployment and automation