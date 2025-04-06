# 🚀 FastAPI Docker CI/CD with GitHub Actions

[![Docker Build](https://img.shields.io/badge/Docker-Build-blue?logo=docker)](https://hub.docker.com/r/uttkarshsh/fastapi-cicd)
[![GitHub Actions](https://img.shields.io/github/actions/workflow/status/Uttkarshsh/<your-repo>/DockerBuild.yml?label=CI%2FCD&logo=github)](https://github.com/Uttkarshsh/<your-repo>/actions)

This project shows how to automate the build and deployment of a **Dockerized FastAPI** app using **GitHub Actions**.  
Every push to the repository triggers a workflow that builds the Docker image and pushes it to **Docker Hub**.

---

## 📌 Project Overview

- 🔧 FastAPI server that returns a simple JSON response
- 🐳 Dockerized using a custom `Dockerfile` (Ubuntu base)
- 🤖 CI/CD pipeline using GitHub Actions

---

## 📂 Folder Structure

| File/Folder                    | Description                          |
|-------------------------------|--------------------------------------|
| `main.py`                     | FastAPI application                  |
| `requirements.txt`            | Python dependencies                  |
| `Dockerfile`                  | Docker build instructions            |
| `.github/workflows/DockerBuild.yml` | GitHub Actions CI/CD workflow |
| `README.md`                   | Project documentation                |

---

## 💻 Running the App Locally

### ✅ Prerequisites

- Python 3.8+
- pip
- Docker or Podman

### 🔨 Steps

```bash
# Clone the repo
git clone https://github.com/Uttkarshsh/<your-repo>.git
cd <your-repo>

# Set up virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run FastAPI app
uvicorn main:app --reload
🔗 Visit: http://localhost:8000

🐳 Build & Run with Docker
bash
Copy
Edit
docker build -t uttkarshsh/fastapi-cicd:latest .
docker run -d -p 8000:8000 uttkarshsh/fastapi-cicd:latest
⚙️ GitHub Actions Workflow
The workflow is triggered on every push.

🔁 Steps:
Logs into Docker Hub using DOCKERTOKEN

Builds the Docker image

Pushes it to Docker Hub

🧾 Workflow File: .github/workflows/DockerBuild.yml
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
      - name: Build & Push Image
        run: |
          echo ${{ secrets.DOCKERTOKEN }} | docker login -u "uttkarshsh" --password-stdin
          docker build -t uttkarshsh/fastapi-cicd:latest .
          docker push uttkarshsh/fastapi-cicd:latest
🔐 Setting up Secrets
Go to Docker Hub → Account Settings > Security

Create a new Access Token

In your GitHub repo:
Settings > Secrets and variables > Actions > New repository secret

Name: DOCKERTOKEN

Value: (paste the access token)

✅ The workflow will now securely authenticate and push the image.

🐋 Docker Hub Image
👉 https://hub.docker.com/r/uttkarshsh/fastapi-cicd

👨‍💻 Author
Uttkarsh Sharma
🔗 GitHub: @uttkarshsh

