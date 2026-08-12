# Task 02 – Containerization Using Docker & AWS EC2

## 📌 Objective

To containerize a web application using Docker and deploy the Docker container on an AWS EC2 cloud virtual machine.

---

## 📝 Project Overview

In this task, I created a web application and containerized it using Docker.

The Docker image was tested locally, pushed to Docker Hub, and then deployed on an AWS EC2 Ubuntu Server instance.

The application was successfully accessed through the EC2 public IPv4 address.

---

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

---

## 🔄 Deployment Workflow

```text
Web Application
      ↓
Dockerfile
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


---

📂 Project Structure

Task-02/
│
├── README.md
│
├── cloud-deployment-hub/
│   ├── Dockerfile
│   ├── index.html
│   └── style.css
│
├── screenshot/
│
└── videos/


---

🐳 Docker Implementation

1. Build Docker Image

docker build -t cloud-deployment-hub .

2. Run Container Locally

docker run -d -p 8080:80 --name cloud-deployment-container cloud-deployment-hub

The application was tested locally through the browser.


---

☁️ Docker Hub

The Docker image was tagged and pushed to Docker Hub.

Tag the Image

docker tag cloud-deployment-hub basant222006/cloud-deployment-hub:latest

Push the Image

docker push basant222006/cloud-deployment-hub:latest

Docker Hub Image

basant222006/cloud-deployment-hub:latest


---

🚀 AWS EC2 Deployment

An Ubuntu Server EC2 instance was launched on AWS.

Docker was configured on the EC2 instance and the application image was pulled from Docker Hub.

Pull Docker Image

sudo docker pull basant222006/cloud-deployment-hub:latest

Run Docker Container

sudo docker run -d --name cloud-deployment-container -p 80:80 basant222006/cloud-deployment-hub:latest


---

🔐 Security Configuration

The EC2 Security Group was configured with the following inbound rules:

Protocol	Port	Source	Purpose

SSH	22	My IP	Server administration
HTTP	80	0.0.0.0/0	Web application access



---

✅ Verification

The running Docker container was verified using:

sudo docker ps

The application was successfully accessed through the EC2 public IPv4 address using HTTP.


---

📸 Proof of Work

Screenshots demonstrating the deployment process are available in the screenshot/ directory.

The proof includes:

Docker image creation

Docker Hub image

AWS EC2 instance

Running Docker container

Live web application

## 🔗 LinkedIn Post

[https://lnkd.in/p/gpHj8tzk]


---

🎥 Deployment Video

The deployment demonstration video is available in the videos/ directory.

The video demonstrates accessing the successfully deployed web application through the EC2 public IPv4 address.


---

🎯 Key Learnings

Docker image creation and containerization

Running Docker containers locally

Docker Hub image management

AWS EC2 deployment

SSH-based server access

Docker deployment on a cloud virtual machine

EC2 Security Group configuration

Public access to a containerized web application



---

🏁 Conclusion

The web application was successfully containerized using Docker, published to Docker Hub, and deployed on an AWS EC2 Ubuntu Server instance.

The deployed application was successfully verified through the EC2 public IPv4 address..