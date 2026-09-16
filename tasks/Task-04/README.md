# 🚀 Task 4 — Automated Deployment of Dockerized Application on Cloud VM with Nginx

> **MainCrafts Cloud & DevOps Internship — Task 4**

This project demonstrates an end-to-end CI/CD pipeline for deploying a Dockerized web application on an Ubuntu-based AWS EC2 virtual machine using **GitHub Actions, Docker Hub, Docker, SSH, and Nginx as a reverse proxy**.

The task focuses on automating the deployment process from source code changes to application deployment on a cloud virtual machine.

### 🔄 Complete Deployment Flow

**Developer → GitHub → GitHub Actions → Docker Hub → AWS EC2 → Docker → Nginx → Public Internet**

---

## 📌 Project Overview

The objective of this task is to automate the deployment of a containerized web application on a cloud virtual machine.

The Dockerized application is built and pushed to Docker Hub through GitHub Actions. After the Docker image is successfully built and pushed, the deployment job connects securely to the Ubuntu EC2 instance using SSH.

The deployment process then:

1. Pulls the latest Docker image.
2. Stops the existing application container.
3. Removes the existing container.
4. Starts a new container using the latest image.
5. Uses Nginx as a reverse proxy to expose the application through HTTP port `80`.

This creates an automated CI/CD workflow for deploying the application to a cloud VM.

---

## 📌 Deployment Status

### ✅ Deployment Successfully Completed and Tested

The application was successfully deployed on an **AWS EC2 Ubuntu instance** through the automated GitHub Actions CI/CD pipeline.

The deployment was verified using:

- Docker container
- Nginx reverse proxy
- SSH-based deployment
- Docker Hub image
- Public web access

After completing and documenting the deployment, the EC2 instance was **terminated** to prevent unnecessary cloud resource usage and charges.

Therefore, the GitHub Actions deployment check may currently display a failed status because the original EC2 instance used for the demonstration is no longer available.

The successful deployment is documented through the project screenshots, demo video, and documentation.

---

## 🔗 Application Source

Task 4 uses the Dockerized web application developed in **Task 3**.

The existing Dockerized application and Docker image are reused in this task to demonstrate automated deployment on an AWS EC2 Ubuntu instance with Nginx reverse proxy.

### 🐳 Docker Image Used

```text
basant222006/cloud-deployment-hub:latest
```

This allows Task 4 to focus on the **automated cloud deployment and reverse proxy configuration** while reusing the Dockerized application created during Task 3.

---

## 🏗️ Architecture

```text
                    ┌──────────────────┐
                    │    Developer     │
                    │   Code Changes   │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │     GitHub       │
                    │   Repository     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ GitHub Actions   │
                    │   CI/CD Pipeline │
                    └────────┬─────────┘
                             │
                    Build & Push Image
                             │
                             ▼
                    ┌──────────────────┐
                    │    Docker Hub    │
                    │   Docker Image   │
                    └────────┬─────────┘
                             │
                         docker pull
                             │
                             ▼
              ┌────────────────────────────┐
              │        AWS EC2 VM          │
              │        Ubuntu Linux        │
              │                            │
              │   ┌────────────────────┐   │
              │   │      Nginx         │   │
              │   │ Reverse Proxy :80  │   │
              │   └─────────┬──────────┘   │
              │             │              │
              │             ▼              │
              │   ┌────────────────────┐   │
              │   │ Docker Container   │   │
              │   │      :8080         │   │
              │   └────────────────────┘   │
              └──────────────┬─────────────┘
                             │
                             ▼
                     🌐 Public Internet
```

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| **AWS EC2** | Cloud virtual machine |
| **Ubuntu** | Server operating system |
| **Docker** | Application containerization |
| **Docker Hub** | Docker image registry |
| **GitHub** | Source code management |
| **GitHub Actions** | CI/CD automation |
| **Nginx** | Reverse proxy |
| **SSH** | Secure remote deployment |
| **HTML / CSS** | Web application |

---

## 📂 Project Structure

```text
maincrafts-cloud-devops-internship/
│
├── .github/
│   └── workflows/
│       └── docker-ci.yml
│
└── tasks/
    ├── Task-03/
    │   └── cloud-deployment-hub/
    │
    └── Task-04/
        │
        ├── cloud-deployment-hub/
        │
        ├── screenshots/
        │
        ├── video/
        │
        └── README.md
```

> **Note:** Task 4 reuses the Dockerized application developed in Task 3. The CI/CD workflow is maintained at the repository-level `.github/workflows/docker-ci.yml`.

---

# ⚙️ Deployment Workflow

## 1. Code Repository

The application source code is maintained in GitHub.

### 🔗 GitHub Repository

[GitHub Repository](https://github.com/basant536/maincrafts-cloud-devops-internship/blob/main/tasks/Task-04/README.md)

---

## 2. Docker Image

The web application is containerized using Docker.

### Docker Image

```text
basant222006/cloud-deployment-hub:latest
```

The image is stored on Docker Hub and is used by the EC2 deployment process.

---

## 3. Continuous Integration

Whenever changes are pushed to the `main` branch, GitHub Actions automatically performs the following steps:

1. Checks out the repository.
2. Sets up Docker Buildx.
3. Logs into Docker Hub using GitHub Secrets.
4. Builds the Docker image.
5. Pushes the Docker image to Docker Hub.

### CI Flow

```text
GitHub Repository
       ↓
GitHub Actions
       ↓
Docker Build
       ↓
Docker Hub
```

---

## 4. Automated Deployment

After the Docker image is successfully pushed to Docker Hub, the deployment job runs automatically.

The deployment process is:

```text
GitHub Actions
       ↓
SSH into EC2
       ↓
docker pull
       ↓
Stop existing container
       ↓
Remove existing container
       ↓
Start latest container
       ↓
Application updated
```

This removes the need to manually connect to the server and deploy every time the application is updated.

---

# 🔐 GitHub Secrets

The deployment uses GitHub Secrets for sensitive configuration.

### Secrets Used

```text
DOCKER_USERNAME
VM_HOST
VM_USER
VM_SSH_KEY
```

> Sensitive values are stored securely in GitHub Secrets and are not included in the repository.

### Purpose of Secrets

| Secret | Purpose |
|---|---|
| `DOCKER_USERNAME` | Docker Hub username |
| `VM_HOST` | EC2 public IP address |
| `VM_USER` | EC2 SSH username |
| `VM_SSH_KEY` | Private SSH key for secure deployment |

---

# 🌐 Nginx Reverse Proxy

Nginx is configured on the EC2 instance to receive HTTP requests on port `80` and forward them to the Docker container running on port `8080`.

### Nginx Configuration

```nginx
server {
    listen 80;

    location / {
        proxy_pass http://localhost:8080;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### Request Flow

```text
Internet
   ↓
EC2 Public IP :80
   ↓
Nginx
   ↓
localhost:8080
   ↓
Docker Container
   ↓
Web Application
```

Nginx therefore acts as the public-facing reverse proxy while the Docker application runs separately inside its container.

---

# 🐳 Docker Configuration

The application is packaged into a Docker image using the project's Dockerfile.

The Docker container listens on port `80`.

The EC2 host maps port `8080` to the container's port `80`.

### Docker Run Command

```bash
docker run -d \
  --name app \
  -p 8080:80 \
  basant222006/cloud-deployment-hub:latest
```

This creates the following mapping:

```text
EC2 Host Port 8080
        ↓
Docker Container Port 80
```

Nginx then forwards public HTTP requests from port `80` to the application on port `8080`.

---

# 🔄 Complete CI/CD Pipeline

The complete automated pipeline is:

```text
1. Developer pushes code
              ↓
2. GitHub Repository
              ↓
3. GitHub Actions triggered
              ↓
4. Docker image built
              ↓
5. Image pushed to Docker Hub
              ↓
6. GitHub Actions connects to EC2 using SSH
              ↓
7. Latest Docker image pulled
              ↓
8. Existing container stopped
              ↓
9. Existing container removed
              ↓
10. New container started
              ↓
11. Nginx forwards HTTP requests
              ↓
12. Application becomes publicly accessible
```

---

# 🔒 Security

The project follows basic deployment security practices:

- SSH authentication is used for EC2 deployment.
- The private SSH key is stored securely in GitHub Secrets.
- Docker Hub credentials are stored using GitHub Secrets.
- Sensitive credentials are not committed to the repository.
- Nginx is used as the public-facing reverse proxy.
- The application runs inside a Docker container.
- The Docker container is separated from the host Nginx service.

---

# 📸 Screenshots

The project includes screenshots demonstrating the major stages of the deployment process.

### GitHub Actions — Build

The successful Docker build and push workflow.

### GitHub Actions — Deployment

The automated deployment process through SSH to the EC2 instance.

### Docker Hub

The Docker image repository containing the application image.

### Nginx Reverse Proxy

The Nginx configuration used to forward requests to the Docker container.

### Live Application

The application successfully accessed through the EC2 public IP during testing.

---

# 🎥 Project Demo

A complete demonstration of the deployment process is available here:

▶️ **[Demo Video](https://github.com/basant536/maincrafts-cloud-devops-internship/blob/main/tasks/Task-04/video/task-4%20live%20demo.mp4)**

---

# 💼 LinkedIn

Project implementation and internship progress have also been shared on LinkedIn.

🔗 **[LinkedIn Post](https://www.linkedin.com/posts/basant-k-27062b255_maincrafts-cloudcomputing-devops-ugcPost-7505852083258990592-M6Px/?utm_source=share&utm_medium=member_android&rcm=ACoAAD7rRbQBW7ZBR8RNmAMzU9Krj07AzvDB6LI)**

---

# 📚 Task Documentation

### 🔗 Task 4 Documentation

[Task 4 Documentation](https://github.com/basant536/maincrafts-cloud-devops-internship/tree/main/tasks/Task-04)

### 🔗 GitHub Repository

[GitHub Repository](https://github.com/basant536/maincrafts-cloud-devops-internship/blob/main/tasks/Task-04/README.md)

### 🎥 Demo Video

[Demo Video](https://github.com/basant536/maincrafts-cloud-devops-internship/blob/main/tasks/Task-04/video/task-4%20live%20demo.mp4)

### 💼 LinkedIn Post

[LinkedIn Post](https://www.linkedin.com/posts/basant-k-27062b255_maincrafts-cloudcomputing-devops-ugcPost-7505852083258990592-M6Px/?utm_source=share&utm_medium=member_android&rcm=ACoAAD7rRbQBW7ZBR8RNmAMzU9Krj07AzvDB6LI)

---

# ✅ Task Completion Checklist

- [x] Ubuntu EC2 VM configured
- [x] Docker installed and configured
- [x] Application containerized
- [x] Docker image pushed to Docker Hub
- [x] GitHub Actions CI/CD configured
- [x] SSH-based automated deployment configured
- [x] GitHub Secrets configured
- [x] Nginx installed
- [x] Nginx reverse proxy configured
- [x] Docker container deployed on EC2
- [x] Application accessible through public IP
- [x] Automated deployment successfully tested
- [x] Deployment job completed successfully

---

# 🎯 Key Learning Outcomes

Through this task, I gained practical experience in:

- Docker containerization
- AWS EC2 deployment
- Linux / Ubuntu server management
- GitHub Actions CI/CD
- Docker Hub image management
- SSH-based automated deployment
- Nginx reverse proxy configuration
- GitHub Secrets management
- Cloud-based application deployment
- End-to-end DevOps workflow

---

# 👨‍💻 Author

## Basant Kumar

**Cloud & DevOps Intern**  
**MCA Student**

### Connect With Me

🔗 **LinkedIn:**  
[https://www.linkedin.com/in/basant-k-27062b255?utm_source=share_via&utm_content=profile&utm_medium=member_android](https://www.linkedin.com/in/basant-k-27062b255?utm_source=share_via&utm_content=profile&utm_medium=member_android)

🔗 **GitHub:**  
[https://github.com/basant536/maincrafts-cloud-devops-internship/](https://github.com/basant536/maincrafts-cloud-devops-internship/)

---

# ⭐ Project Status

**Status: Completed ✅**

This project successfully demonstrates an end-to-end automated deployment pipeline for a Dockerized web application on an AWS EC2 virtual machine with Nginx reverse proxy.

The implementation covers:

**Containerization → CI/CD → Docker Hub → SSH Deployment → AWS EC2 → Nginx Reverse Proxy → Public Web Access**

The deployment was successfully tested and documented as part of the **MainCrafts Cloud & DevOps Internship — Task 4**.