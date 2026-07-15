
# CI/CD Pipeline for a Dockerized Django Todo Application

Whenever code is pushed to GitHub, Jenkins automatically pulls the latest changes, builds a new Docker image, replaces the existing container with the updated version, and deploys the application on an AWS EC2 instance.

![Todo App](https://raw.githubusercontent.com/shreys7/django-todo/develop/staticfiles/todoApp.png)

## 📌 Project Overview

This project demonstrates how Continuous Integration and Continuous Deployment (CI/CD) can automate application delivery while ensuring consistency through containerization.

The pipeline eliminates manual deployment by automatically:

- Detecting new commits from GitHub
- Building a Docker image
- Stopping the previous container
- Deploying the updated application
- Serving the latest version on AWS EC2

---

## 🛠️ Tech Stack

- **Backend:** Django
- **Language:** Python
- **Containerization:** Docker
- **CI/CD:** Jenkins
- **Version Control:** Git & GitHub
- **Cloud:** AWS EC2
- **Operating System:** Ubuntu

---

## ⚙️ CI/CD Workflow

```text
Developer
     │
     ▼
Push Code to GitHub
     │
     ▼
Jenkins Polls/Webhook
     │
     ▼
Clone Latest Repository
     │
     ▼
Build Docker Image
     │
     ▼
Stop Existing Container
     │
     ▼
Remove Old Container
     │
     ▼
Run New Docker Container
     │
     ▼
Application Live on AWS EC2
```

---

## 🐳 Docker

The application is containerized using Docker to ensure consistent deployment across environments.

### Build Image

```bash
docker build -t django-todo .
```

### Run Container

```bash
docker run -d \
-p 8000:8000 \
--name django-todo \
django-todo
```

---

## 🔄 Jenkins Pipeline

The Jenkins pipeline automates deployment by:

- Cloning the GitHub repository
- Building a Docker image
- Stopping the running container (if present)
- Removing the old container
- Starting a new container
- Deploying the latest version

### Typical Pipeline Stages

- Checkout
- Build Docker Image
- Stop Existing Container
- Remove Old Container
- Deploy New Container
- Verify Deployment

---

## ☁️ AWS Deployment

The Jenkins server runs on an AWS EC2 Ubuntu instance.

Deployment steps:

- Launch EC2 instance
- Install Docker
- Install Jenkins
- Configure Jenkins permissions
- Connect GitHub repository
- Run Jenkins pipeline

Access the application via:

```text
http://<EC2-Public-IP>:8000
```

---

## 🚀 Getting Started

### Clone the repository

```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
```

### Build the Docker image

```bash
docker build -t django-todo .
```

### Run the Docker container

```bash
docker run -d -p 8000:8000 --name django-todo django-todo
```

### Access the application

```
http://localhost:8000
```

For production deployment, Jenkins automatically builds and deploys the application to AWS EC2 whenever changes are pushed to GitHub.
