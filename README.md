# Cloud Native Implementation

This project is a cloud-native implementation of a simple to-do application, consisting of frontend, API, and database services deployed on Kubernetes using Minikube. Continuous integration (CI) is set up using GitHub Actions, and infrastructure provisioning is done using Terraform.

## Deployment Instructions

To deploy the application using the provided scripts, follow these steps:

1. **Clone Repository**: Clone this repository to your local machine:
   
   ```bash
   git clone https://github.com/imshahmeer/cloudnative-implementation.git

**Start Minikube: Set up Minikube locally:**

 ```bash
minikube start

**Set Up CI/CD:**
Fork this repository to your GitHub account.
Set up Docker Hub credentials as secrets in your repository settings.
Create CI workflows for frontend and API services.
**Create Kubernetes Manifests:**
Refer to the docker-compose.yaml file and Helm charts for guidance.
Ensure communication between the database and frontend pods is restricted.
Apply the Kubernetes manifests to your Minikube cluster

 ```bash
kubectl apply -f manifests/

**Set Up Infrastructure with Terraform:**
Apply Terraform scripts to provision a local Minikube cluster and deploy ArgoCD:

 ```bash
cd terraform/
terraform init
terraform apply




