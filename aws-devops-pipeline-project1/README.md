# 🛠️ DevOps CI/CD Pipeline Project with Terraform, Ansible, Jenkins, and AWS

This project demonstrates how to build a complete DevOps CI/CD pipeline using **Terraform**, **Ansible**, **Jenkins**, and **AWS**. It provisions cloud infrastructure, configures remote servers with ansible, and deploys a sample web application through an automated Jenkins pipeline.

---

## 📦 Tools Used

- **Terraform** – Infrastructure as Code (IaC)
- **Ansible** – Server configuration and app deployment
- **Jenkins** – Continuous Integration/Deployment
- **AWS EC2** – Cloud infrastructure
- **GitHub** – Version control and source code hosting

---

## 📁 Project Structure



aws-devops-pipeline/

├── terraform/                # Terraform configuration files

│   ├── main.tf

│   ├── variables.tf

│   └── outputs.tf
├── ansible/                  # Ansible inventory and playbooks

│   ├── inventory.ini

│   └── playbook.yml
├── jenkins/                  # Jenkinsfile for pipeline definition

│   └── Jenkinsfile
├── app/                      # Sample web application code

│   └── index.html

└── README.md                 # Project documentation



---

## 🔧 Infrastructure Provisioning (Terraform)

All infrastructure is defined in the `terraform/` directory using:

- `main.tf`
- `variables.tf`
- `outputs.tf`

Terraform provisions:

- A **VPC** (or uses the default VPC)
- Two EC2 instances:
  - **Web Server** (Ubuntu): Hosts the sample app
  - **Jenkins Server** (optional): Also Ubuntu, installs Jenkins via `user_data` script
- A **Security Group**: Opens ports 22 (SSH), 80 (HTTP), 8080 (Jenkins)
- A **Key Pair**: For secure SSH access to EC2 instances

### 🛠️ Two Jenkins Setup Options

You can choose between two methods for setting up Jenkins:

1. **Provision EC2 Jenkins Server (via Terraform)**  
   - An Ubuntu EC2 instance is created.
   - Jenkins is automatically installed using a shell script in `user_data`.
   - Use this if you want Jenkins hosted on the cloud.

2. **Use Local Machine for Jenkins & Ansible**  
   - Jenkins runs locally.
   - Local machine also acts as the Ansible control node.
   - Recommended for learning and testing environments.

---

## 🚀 Step-by-Step Deployment Guide

### ✅ 1. Clone the Repository


git clone https://github.com/<your-username>/aws-devops-pipeline.git
cd aws-devops-pipeline/terraform



### 🧱 2. Provision AWS Infrastructure

Inside the `terraform/` directory:

```bash
terraform fmt              # Format the Terraform files
terraform validate         # Validate the configuration
terraform plan             # Preview infrastructure changes
terraform apply            # Apply and create infrastructure
```

**Terraform Outputs:**

* Jenkins EC2 public IP (if used)
* Web Server EC2 public IP

---

### 🧾 3. Configure Ansible Inventory

Go to the `ansible/` directory and update `inventory.ini`:

```ini
[web]
<web_server_public_ip> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/your-key.pem
```

Replace:

* `<web_server_public_ip>` with the actual IP output by Terraform
* `your-key.pem` with the private key used in your Terraform EC2 setup

---

### 🔗 4. Set Up Jenkins Pipeline

#### Jenkins Option A: EC2 Jenkins Server (Provisioned Automatically)

* After Terraform provisioning, Jenkins is pre-installed on the EC2 instance via `user_data`.
* Access Jenkins at `http://<jenkins_public_ip>:8080`
* Use the password from `/var/lib/jenkins/secrets/initialAdminPassword`

#### Jenkins Option B: Local Jenkins Server (Control Node)

* Ensure Jenkins is installed and running on your **local machine**
* Install necessary plugins:

  * Git
  * Pipeline
  * Ansible
  * SSH Agent, etc.
* Make sure Jenkins can run Ansible and access SSH keys

---

### 🧪 5. Create Jenkins Pipeline Job

1. In Jenkins, create a **Pipeline** job.
2. Choose:

   * *Pipeline from SCM*
   * SCM: Git
   * Repo URL: `https://github.com/<your-username>/aws-devops-pipeline.git`
   * Branch: `main`
3. Jenkins will use the `Jenkinsfile` under the `jenkins/` folder.
4. Click **Build Now** to trigger the pipeline.

---

### ⚙️ 6. What the Pipeline Does

* Pulls the code from GitHub
* Uses Ansible to SSH into the **Web EC2 Instance**
* Deploys a simple HTML app onto the web server
* All configurations are handled by the `playbook.yml` and `inventory.ini`

---

### 🌐 7. Access the Deployed Application

```bash
http://<web_server_public_ip>
```

You should see the deployed HTML web page.

---

## 🔐 Security Tips

* Never commit your private SSH keys or AWS credentials to GitHub.
* Use `.gitignore` to exclude sensitive files.
* Use IAM best practices when creating access keys.

---

## 🧠 Final Notes

* This project is ideal for DevOps job seekers and learners
* All provisioning and automation are done with industry-standard tools
* Easily fork and customize for your own use case

---

## 👨‍💻 Author

**Ankiambom Kelly Nkwain**
*DevOps Enthuasist | Cloud Practitioner | Medical Scientist*
GitHub: [devkelzs](https://github.com/devkelzs)

---
