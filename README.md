FastAPI Docker CI/CD with GitHub Actions
This project shows how to automate the build and deployment of a Dockerized FastAPI app using GitHub Actions. Every push to the repository triggers a workflow that builds the Docker image and pushes it to Docker Hub.

Project Overview
The app is a simple FastAPI server that returns a JSON response. It's containerized using Docker and automatically deployed using a GitHub Actions workflow.

Folder Structure
main.py – FastAPI application

requirements.txt – Python dependencies

Dockerfile – Contains Docker build instructions

.github/workflows/DockerBuild.yml – GitHub Actions CI/CD workflow

README.md – Project documentation

Running the App Locally
Prerequisites:

Python 3.8+

pip

Docker or Podman

Steps:

Clone the repo:

bash
Copy
Edit
git clone https://github.com/Uttkarshsh/<your-repo>.git
cd <your-repo>
Set up a virtual environment:

bash
Copy
Edit
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
Install dependencies:

nginx
Copy
Edit
pip install -r requirements.txt
Run the FastAPI server:

css
Copy
Edit
uvicorn main:app --reload
Server will be available at: http://localhost:8000

Building and Running with Docker
To build and run the app using Docker:

bash
Copy
Edit
docker build -t uttkarshsh/fastapi-cicd:latest .
docker run -d -p 8000:8000 uttkarshsh/fastapi-cicd:latest
GitHub Actions Workflow
The GitHub Actions workflow is triggered on every push.

It does the following:

Logs into Docker Hub using a secret token

Builds the Docker image

Pushes the image to Docker Hub

Workflow file: .github/workflows/DockerBuild.yml

Here’s the key part of the workflow:

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
Setting up Docker Token & GitHub Secrets
Go to Docker Hub, open Account Settings > Security and create a new Access Token

In your GitHub repo, go to Settings > Secrets and variables > Actions

Create a new secret:

Name: DOCKERTOKEN

Value: (paste the Docker token)

The workflow will use this token to push the image securely

Docker Hub Image
You can find the built image here:
https://hub.docker.com/r/uttkarshsh/fastapi-cicd

Author
Uttkarsh Sharma
GitHub: @uttkarshsh
