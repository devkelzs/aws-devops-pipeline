# E-Commerce DevOps Project

A real-world DevOps pipeline that automates deploying a scalable e-commerce application on AWS using:

- Terraform (IaC) for AWS infrastructure provisioning  
- Ansible for configuration management  
- Jenkins for CI/CD pipeline automation  
- Docker for containerization  
- Kubernetes (EKS) for container orchestration  
- Argo CD for GitOps deployment  
- Prometheus & Grafana for monitoring  

---

## Project Overview

This project provisions AWS resources, builds and tests application code, deploys containers to Kubernetes, and monitors application health — fully automated and production-ready.

---

## Step 1: Infrastructure Provisioning with Terraform

Terraform scripts create:

- VPC with public subnets in multiple availability zones  
- Security groups for Jenkins and application servers  
- EC2 instances for Jenkins and optional web servers  
- Amazon EKS cluster with managed node groups and necessary IAM roles  

### Key Terraform Files

| File              | Description                                              |
|-------------------|----------------------------------------------------------|
| `provider.tf`     | AWS provider configuration                               |
| `variables.tf`    | Input variable declarations                              |
| `terraform.tfvars`| Variable values (sensitive info stored securely here)   |
| `vpc.tf`          | VPC, subnets, Internet Gateway, routing tables          |
| `ec2.tf`          | EC2 instances and security groups                        |
| `eks.tf`          | EKS cluster, node groups, IAM roles                      |
| `outputs.tf`      | Outputs such as public IP addresses and cluster details |

### Terraform Commands

```bash
terraform fmt       # Format code  
terraform init      # Initialize Terraform  
terraform validate  # Validate config  
terraform plan      # Preview changes  
terraform apply     # Provision infrastructure  
terraform destroy   # Clean up resources (optional)  
````

---

## Step 2: Configuration Management with Ansible

Ansible provisions and configures Jenkins and other servers:

* Installs Java, Docker, Jenkins on Jenkins EC2 instance
* Configures security settings and starts Jenkins service

Ansible playbooks are stored in the `ansible/` folder.

---

## Step 3: CI/CD Pipeline with Jenkins

The Jenkins pipeline performs:

* Source code checkout from GitHub
* Linting frontend and backend code with ESLint
* Backend tests using Jest
* Docker image build for frontend and backend
* Pushes Docker images to Docker Hub
* (Future) Triggers Kubernetes deployment via Argo CD

---

## Step 4: Docker Containerization

* Dockerfiles exist in `app/frontend` and `app/backend`
* Images are built and pushed to Docker Hub from Jenkins pipeline

---

## Step 5: Kubernetes Deployment on EKS

* Kubernetes manifests are stored in the `kubernetes-k8-manifest/` folder
* Includes Deployments and Services for frontend and backend
* Deployed using `kubectl apply` or Argo CD GitOps syncing with GitHub

---

## Step 6: GitOps with Argo CD

* Argo CD monitors GitHub repo for Kubernetes manifests
* Automatically syncs changes to EKS cluster
* Ensures declarative and automated deployment

---

## Step 7: Monitoring with Prometheus & Grafana

* Prometheus scrapes metrics from Kubernetes cluster and pods
* Grafana provides dashboards for visualizing app and cluster metrics
* Installed in `monitoring/` namespace on EKS cluster
* Access Grafana UI via port-forwarding or LoadBalancer (depending on cluster config)

---

![Argo](images/Screenshot%20(154).png) 


## How to Run

1. **Terraform**

   ```bash
   terraform fmt
   terraform init
   terraform validate
   terraform plan
   terraform apply -auto-approve
   ```

2. **Ansible** (run from control machine)

   ```bash
   ansible-playbook -i inventory.ini playbook.yml
   ```

3. **Jenkins Pipeline**

   * Configure Jenkins with Docker Hub credentials
   * Run pipeline defined in `Jenkinsfile` from GitHub repo

4. **Kubernetes Deployment**

   ```bash
   kubectl apply -f kubernetes-k8-manifest/backend/
   kubectl apply -f kubernetes-k8-manifest/frontend/
   ```

5. **Argo CD Setup**

   * Install Argo CD on EKS
   * Connect Argo CD to GitHub repo with manifests
   * Enable auto-sync for continuous deployment

6. **Access Monitoring Dashboards**

   * Port-forward Grafana:

     ```bash
     kubectl -n monitoring port-forward svc/grafana 3000:3000
     ```
   * Open `http://localhost:3000` in browser

---
---

## Demo

![Demo video](https://youtu.be/nEjO0pGZHCE)

---

## Contact

Developed by Kelly Nkwain
Email: [nkwainkelly872@gmail.com](mailto:kellynkwain72@gmail.com)
GitHub: [https://github.com/devkelzs](https://github.com/devkelzs)

---

