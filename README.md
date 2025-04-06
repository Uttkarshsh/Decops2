# 🚀 FastAPI Dockerized Application with GitHub Actions CI/CD

This repository demonstrates **Continuous Delivery (CD)** by automating the creation and deployment of a **Dockerized FastAPI application** using **GitHub Actions**.

---

## 📘 Table of Contents

- [🎯 Objective](#-objective)
- [📁 Project Structure](#-project-structure)
- [🛠️ Prerequisites](#️-prerequisites)
- [📦 Local Setup & Installation](#-local-setup--installation)
- [🐳 Docker Instructions](#-docker-instructions)
- [🔄 GitHub Actions Workflow](#-github-actions-workflow)
- [🔐 Docker Token & GitHub Secrets](#-docker-token--github-secrets)
- [🚀 Deployment Steps](#-deployment-steps)
- [✅ Submission Checklist](#-submission-checklist)
- [💡 Additional Tips](#-additional-tips)
- [🤝 Contributing](#-contributing)
- [📃 License](#-license)

---

## 🎯 Objective

Automate the deployment pipeline for a FastAPI application by:

- Creating a RESTful FastAPI server
- Containerizing the application using Docker
- Automating Docker image build & push using GitHub Actions

---

## 📁 Project Structure

. 
├── main.py # FastAPI server file 
├── requirements.txt # Project dependencies 
├── Dockerfile # Docker build instructions 
├── .github/ 
│ └── workflows/ 
│ └── DockerBuild.yml # CI/CD workflow file 
| └── README.md # Project documentation

yaml
Copy
Edit

---

## 🛠️ Prerequisites

Make sure you have the following installed:

- Python 3.7+
- Docker or Podman
- Git
- GitHub account
- Docker Hub account

---

## 📦 Local Setup & Installation

### 🔹 Clone the Repository

```bash
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>
🔹 Install Dependencies
bash
Copy
Edit
pip install -r requirements.txt
🔹 Run the FastAPI Server Locally
bash
Copy
Edit
uvicorn main:app --reload
Visit: http://127.0.0.1:8000

🐳 Docker Instructions
🔹 Build the Docker Image
bash
Copy
Edit
docker build -t fastapi-app .
🔹 Run the Docker Container
bash
Copy
Edit
docker run -p 80:80 fastapi-app
Visit: http://localhost

🔄 GitHub Actions Workflow
📍 Trigger
The workflow is triggered on every push to the repository.

⚙️ Workflow Logic
yaml
Copy
Edit
name: Docker image build

on: push

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1

      - name: Build & Push Docker Image
        run: |
          echo ${{ secrets.DOCKERTOKEN }} | docker login -u "<your-dockerhub-username>" --password-stdin
          docker build -t <your-dockerhub-username>/<image-name>:latest .
          docker push <your-dockerhub-username>/<image-name>:latest
🔐 Docker Token & GitHub Secrets
🔹 Generate Docker Hub Token
Go to hub.docker.com

Navigate to:
Account Settings → Security → Access Tokens

Click on Generate Token, then copy the token

🔹 Add Token to GitHub Secrets
Go to your GitHub repository:
Settings → Secrets and variables → Actions → New repository secret

Name: DOCKERTOKEN

Value: Paste the copied token

🚀 Deployment Steps
Push code changes to GitHub

GitHub Actions builds and pushes Docker image to Docker Hub

Pull and deploy the Docker image to your preferred cloud provider:

AWS EC2 / ECS

GCP Cloud Run

Azure App Service

DigitalOcean Droplets

✅ Submission Checklist
 main.py — FastAPI server

 requirements.txt — Dependency file

 Dockerfile — Docker configuration

 .github/workflows/DockerBuild.yml — GitHub Actions CI/CD file

 README.md — Project documentation

 Docker Hub URL — Image hosted online

💡 Additional Tips
✅ You may use Podman as an alternative to Docker:

bash
Copy
Edit
podman machine init
podman machine start
alias docker=podman
docker --version
✅ Ensure port 80 is exposed in Dockerfile and container

✅ To run the server inside the container:

bash
Copy
Edit
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
🤝 Contributing
Pull requests are welcome. Please open an issue first to discuss any changes you'd like to make.
