Task 4 — Automated Deployment of Dockerized Application on Cloud VM

# 🚀 Task 4 — Automated Deployment of Dockerized Application on Cloud VM with Nginx

> **MainCrafts Cloud & DevOps Internship — Task 4**

This project demonstrates an automated CI/CD pipeline for deploying a Dockerized web application to an Ubuntu-based AWS EC2 virtual machine using GitHub Actions, Docker Hub, Docker, and Nginx as a reverse proxy.

The complete deployment flow is:

**Developer → GitHub → GitHub Actions → Docker Hub → AWS EC2 → Docker → Nginx → Public Internet**

---

## 📌 Project Overview

The objective of this task is to automate the deployment of a containerized web application on a cloud virtual machine.

The application is packaged into a Docker image and pushed to Docker Hub through GitHub Actions. After a successful build, the workflow connects securely to the Ubuntu EC2 instance through SSH, pulls the latest Docker image, replaces the existing container, and starts the updated application.

Nginx is configured as a reverse proxy so that users can access the application through the EC2 instance's public IP on HTTP port 80.

## 📌 Deployment Status

**Deployment:** Successfully completed and tested ✅

The application was successfully deployed on an AWS EC2 Ubuntu instance through the automated CI/CD pipeline. The deployment was verified with Docker, Nginx reverse proxy, and public web access.

After completing and documenting the deployment, the EC2 instance was terminated to prevent unnecessary cloud resource usage and charges.

Therefore, the GitHub Actions deployment check may currently display a failed status because the original EC2 instance used for the demonstration is no longer available.

The successful deployment is documented through the provided screenshots, demo video, and project documentation.

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
                   Build & Push Docker Image
                             │
                             ▼
                    ┌──────────────────┐
                    │    Docker Hub    │
                    │ Docker Image     │
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


---

🛠️ Technologies Used

Technology	Purpose

AWS EC2	Cloud virtual machine
Ubuntu	Operating system
Docker	Application containerization
Docker Hub	Docker image registry
GitHub	Source code management
GitHub Actions	CI/CD automation
Nginx	Reverse proxy
SSH	Secure remote deployment
HTML / CSS	Web application



---

📂 Project Structure

maincrafts-cloud-devops-internship/
│
├── .github/
│   └── workflows/
│       └── docker-ci.yml
│
└── tasks/
    └── Task-04/
        │
        ├── cloud-deployment-hub/
        │   ├── Dockerfile
        │   ├── index.html
        │   ├── style.css
        │   └── README.md
        │
        ├── screenshots/
        │   ├── github-actions-build.png
        │   ├── github-actions-deploy.png
        │   ├── docker-hub.png
        │   ├── nginx-config.png
        │   └── live-website.png
        │
        ├── video/
        │   └── task-04-demo.mp4
        │
        └── README.md


---

⚙️ Deployment Workflow

1. Code Repository

The application source code is maintained in GitHub.

GitHub Repository:
[ADD GITHUB REPOSITORY LINK HERE]


---

2. Docker Image

The web application is containerized using Docker.

Docker Hub Image:
[ADD DOCKER HUB LINK HERE]

Docker image:

basant222006/cloud-deployment-hub:latest


---

3. Continuous Integration

Whenever changes are pushed to the main branch, GitHub Actions automatically:

1. Checks out the repository.


2. Sets up Docker Buildx.


3. Logs into Docker Hub using GitHub Secrets.


4. Builds the Docker image.


5. Pushes the image to Docker Hub.




---

4. Automated Deployment

After the Docker image is successfully pushed, the deployment job runs automatically.

The deployment process:

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

The deployment uses GitHub Secrets for sensitive configuration.

GitHub Secrets Used

DOCKER_USERNAME
VM_HOST
VM_USER
VM_SSH_KEY

> Sensitive values are stored securely in GitHub Secrets and are not included in the repository.




---

🌐 Nginx Reverse Proxy

Nginx is configured on the EC2 instance to receive HTTP requests on port 80 and forward them to the Docker container running on port 8080.

Nginx Configuration

server {
    listen 80;

    location / {
        proxy_pass http://localhost:8080;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

Therefore:

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


---

🐳 Docker Configuration

The application is packaged into a Docker image using the project's Dockerfile.

The container exposes port 80, while the EC2 host maps port 8080 to the container:

docker run -d \
  --name app \
  -p 8080:80 \
  basant222006/cloud-deployment-hub:latest


---

🔄 CI/CD Pipeline

The complete automated pipeline is:

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
6. GitHub Actions connects to EC2
          ↓
7. Latest image pulled
          ↓
8. Existing container replaced
          ↓
9. New container started
          ↓
10. Nginx forwards requests
          ↓
11. Application becomes available publicly


---

🔐 Security

The project follows basic deployment security practices:

SSH authentication is used for EC2 deployment.

Private SSH key is stored in GitHub Secrets.

Docker Hub credentials are stored using GitHub Secrets.

Sensitive credentials are not committed to the repository.

Nginx is used as the public-facing reverse proxy.

The application container runs separately from the host Nginx service.



---

📸 Screenshots

GitHub Actions — Build



GitHub Actions — Deployment



Docker Hub



Nginx Reverse Proxy



Live Application




---

🎥 Project Demo

A complete demonstration of the deployment process is available here:

▶️ Demo Video:
[ADD VIDEO LINK HERE]


---

---

💼 LinkedIn

Project implementation and internship progress have also been shared on LinkedIn.

🔗 LinkedIn Post:
[ADD LINKEDIN POST HERE]


---

📚 Task Documentation

🔗 Task 4 Documentation:
[ADD DOCUMENTATION LINK HERE]

🔗 GitHub Repository:
[ADD GITHUB LINK HERE]

🔗 Demo Video:
[ADD VIDEO LINK HERE]

🔗 LinkedIn Post:
[ADD LINKEDIN POST HERE]


---

✅ Task Completion Checklist

[x] Ubuntu EC2 VM configured

[x] Docker installed and configured

[x] Application containerized

[x] Docker image pushed to Docker Hub

[x] GitHub Actions CI/CD configured

[x] SSH-based automated deployment configured

[x] GitHub Secrets configured

[x] Nginx installed

[x] Nginx reverse proxy configured

[x] Docker container deployed on EC2

[x] Application accessible through public IP

[x] Automated deployment successfully tested

[x] Deployment job completed successfully



---

🎯 Key Learning Outcomes

Through this task, I gained practical experience in:

Docker containerization

AWS EC2 deployment

Linux/Ubuntu server management

GitHub Actions CI/CD

Docker Hub image management

SSH-based automated deployment

Nginx reverse proxy configuration

GitHub Secrets management

Cloud-based application deployment

End-to-end DevOps workflow



---

👨‍💻 Author

Basant Kumar

Cloud & DevOps Intern
MCA Student

Connect With Me

🔗 LinkedIn: [ADD YOUR LINKEDIN PROFILE]

🔗 GitHub: [ADD YOUR GITHUB PROFILE]


---

⭐ Project Status

Status: Completed ✅

This project successfully demonstrates an end-to-end automated deployment pipeline for a Dockerized web application on an AWS EC2 virtual machine with Nginx reverse proxy.
