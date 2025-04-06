🚀 FastAPI Dockerized Application with CI/CD using GitHub Actions
📌 Project Overview
This project demonstrates Continuous Delivery by automating the creation and deployment of a Dockerized FastAPI application using GitHub Actions. The application is containerized using Docker, and on every push to the repository, the GitHub Actions workflow builds and pushes the image to Docker Hub.

🎯 Objective
Automate the deployment of a FastAPI application using Docker and GitHub Actions to showcase CI/CD best practices.

📂 Project Structure
bash
Copy
Edit
.
├── main.py                        # FastAPI server
├── requirements.txt              # Project dependencies
├── Dockerfile                    # Docker image configuration
├── .github/
│   └── workflows/
│       └── DockerBuild.yml       # GitHub Actions CI/CD workflow
└── README.md                     # Project documentation
🛠️ Local Setup & Installation
1. Clone the repository
bash
Copy
Edit
git clone https://github.com/yourusername/yourrepository.git
cd yourrepository
2. Install dependencies (for local testing)
bash
Copy
Edit
pip install -r requirements.txt
🐳 Docker Instructions
🔧 Build the Docker image
bash
Copy
Edit
docker build -t fastapi-app .
▶️ Run the Docker container
bash
Copy
Edit
docker run -p 80:80 fastapi-app
Now your FastAPI application is accessible at: http://localhost/

🔄 GitHub Actions Workflow (CI/CD)
🚀 Trigger:
On every push to the repository

🔐 Authentication:
Uses a Docker Hub Access Token stored as DOCKERTOKEN in GitHub Secrets

🧱 Workflow Steps:
Checkout the repository

Authenticate to Docker Hub

Build Docker image

Push Docker image to Docker Hub

📁 .github/workflows/DockerBuild.yml
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
🔧 Setting Up Docker Hub & GitHub Secrets
1. 🛡️ Generate Docker Access Token:
Go to Docker Hub

Click on Account Settings → Security → Access Tokens

Click Generate Token, copy it

2. 🔐 Add the Token to GitHub:
Go to your GitHub repository:
Settings → Secrets and variables → Actions → New repository secret

Name: DOCKERTOKEN

Value: Paste the copied token

🚀 Deployment Steps
Push your code to GitHub

GitHub Actions will:

Build the Docker image

Push it to your Docker Hub repository

You can deploy the pushed image on any cloud provider like AWS, GCP, Azure, or DigitalOcean

📥 Submission Checklist
✅ GitHub Repository with:

main.py

requirements.txt

Dockerfile

.github/workflows/DockerBuild.yml

README.md

✅ Docker Hub Image URL:
https://hub.docker.com/r/<your-dockerhub-username>/<image-name>

📌 Hints & Notes
You can use Podman as an alternative to Docker:

bash
Copy
Edit
podman machine init
podman machine start
alias docker=podman
docker --version
Dockerfile should:

Use ubuntu as base image

Install Python

Copy app files

Install FastAPI and Uvicorn

Expose port 80

Run the app using Uvicorn

📧 Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change.
