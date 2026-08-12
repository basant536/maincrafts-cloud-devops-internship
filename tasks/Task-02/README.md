# Task 02 – Containerization Using Docker & AWS EC2

## 📌 Objective

To containerize a web application using Docker and deploy the Docker container on an AWS EC2 cloud virtual machine.

## 📝 Project Overview

In this task, I created a simple web application and containerized it using Docker.
The Docker image was tested locally, pushed to Docker Hub, and then deployed on an AWS EC2 Ubuntu instance.

The application was successfully accessed through the EC2 public IPv4 address.

## 🛠️ Technologies Used

- HTML
- CSS
- Docker
- Docker Desktop
- Docker Hub
- AWS EC2
- Ubuntu Server
- Git & GitHub
- PowerShell / Terminal

## 🔄 Deployment Workflow

Local Web Application
        ↓
Docker Image
        ↓
Docker Container (Local)
        ↓
Docker Hub
        ↓
AWS EC2
        ↓
Docker Container
        ↓
Public IPv4 Address
        ↓
Live Web Application

## 📂 Project Structure

```text
Task-02/
├── README.md
├── index.html
├── style.css
├── Dockerfile
└── screenshots/

🐳 Docker Implementation
Build Docker Image
docker build -t cloud-deployment-hub .
Run Container Locally
docker run -d -p 8080:80 --name cloud-deployment-container cloud-deployment-hub
The application was tested locally through the browser.

☁️ Docker Hub
The Docker image was tagged and pushed to Docker Hub:
docker tag cloud-deployment-hub basant222006/cloud-deployment-hub:latest
docker push basant222006/cloud-deployment-hub:latest

🚀 AWS EC2 Deployment
An Ubuntu Server EC2 instance was launched on AWS.
Docker was installed on the EC2 instance and the Docker image was pulled from Docker Hub:
sudo docker pull basant222006/cloud-deployment-hub:latest
The container was then started using:
sudo docker run -d --name cloud-deployment-container -p 80:80 basant222006/cloud-deployment-hub:latest

🔐 Security Configuration
The EC2 Security Group was configured to allow:
SSH – Port 22 – My IP
HTTP – Port 80 – Anywhere IPv4
This allowed SSH access for administration and HTTP access to the deployed web application.

✅ Verification
The running container was verified using:
sudo docker ps
The application was successfully accessed through the EC2 public IPv4 address using HTTP.

📸 Proof of Work
Screenshots and deployment video have been captured as proof of successful deployment.

🎯 Key Learnings
Docker image creation and containerization
Running containers locally
Docker Hub image management
AWS EC2 instance deployment
SSH-based server access
Docker deployment on a cloud VM
Security Group configuration
Public access to a containerized web application