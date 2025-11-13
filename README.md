# 🚀 Terraform AWS Infrastructure Automation

This project demonstrates how to deploy AWS infrastructure securely and efficiently using **Terraform**.  
It uses **S3** for remote state storage and **DynamoDB** for state locking to ensure consistency and prevent concurrent modifications.

---

## 🧩 **Project Overview**

The goal of this project is to automate the provisioning of AWS resources such as **EC2 instances**, **IAM roles**, and **S3 buckets** using Terraform.  
To ensure reliability and data safety, the **Terraform state file** is stored in **AWS S3**, and **DynamoDB** is used for **state locking** — meaning no one can modify the infrastructure while a deployment is in progress.

---

## ⚙️ **Tech Stack**

- **Cloud Provider:** AWS (Amazon Web Services)
- **Operating System:** Linux
- **Infrastructure as Code (IaC):** Terraform
- **Services Used:**
  - **EC2** – Compute instances
  - **S3** – Remote backend for storing Terraform state files
  - **IAM** – Access control and permissions
  - **DynamoDB** – State file locking to prevent concurrent updates

---

## 🏗️ **Project Workflow**

1. **Create IAM Roles & Policies**
   - Configured IAM roles with least privilege access for Terraform.
2. **Configure S3 Backend**
   - Created an S3 bucket to store the Terraform `tfstate` file.
3. **Enable DynamoDB State Locking**
   - Set up a DynamoDB table to manage state locking during Terraform apply.
4. **Write Terraform Scripts**
   - Defined resources for EC2 instances, IAM roles, and networking setup.
5. **Initialize & Apply**
   - Ran:
     ```bash
     terraform init
     terraform plan
     terraform apply
     ```
6. **Automatic Locking**
   - Once Terraform apply runs, DynamoDB automatically locks the state file, ensuring no other user or process can access or modify it until the operation completes.

---

## 🧠 **Key Learnings**

- Understanding **Terraform remote backends** and **state locking mechanisms**
- Managing AWS resources securely with **IAM**
- Automating infrastructure deployments using **IaC principles**
- Enhancing reliability and team collaboration in multi-user environments

---

## 📂 **Project Structure**

