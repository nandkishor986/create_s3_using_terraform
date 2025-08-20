# 🚀 Launch S3 Buckets with Terraform

## 📌 Project Overview
This beginner-friendly project demonstrates how to use **Terraform** to automate the creation and management of **Amazon S3 Buckets**.  

No prior Terraform or Infrastructure as Code (IaC) experience is required. By the end of this project, you’ll know how to:  

- Install & configure Terraform.  
- Configure AWS credentials in your terminal.  
- Create and manage S3 Buckets with Terraform.  
- Upload files to an S3 Bucket — **without touching the AWS Console**.  

This project highlights Terraform’s ability to **automate infrastructure management**, ensuring **consistency**, reducing **manual errors**, and enabling **scalable deployments**.  

---

## 🎯 Learning Goals
By completing this project, you will:  
- Understand the fundamentals of Infrastructure as Code.  
- Learn how Terraform configuration files define infrastructure.  
- Automate the creation & management of AWS S3 Buckets.  
- Gain hands-on experience with Terraform providers, state files, and configuration management.  

---

## ⚙️ What You’ll Do
1. Install and configure Terraform.  
2. Configure AWS CLI and credentials.  
3. Create S3 Buckets using Terraform.  
4. Upload files to the bucket (✨ secret mission).  
5. Manage resources with Terraform commands.  
6. Destroy resources to clean up.  

---

## 🧩 What is Terraform?
Terraform is an **Infrastructure as Code (IaC)** tool that allows us to define, deploy, and manage cloud resources using configuration files.  

Instead of manually creating resources in the AWS Console or using CLI commands, Terraform:  
- Reads configuration files.  
- Compares them with existing infrastructure.  
- Creates, updates, or deletes resources to match the desired state.  

This ensures **automation, repeatability, and consistency** across deployments.  

---

## 📂 Why Configuration Files?
Terraform configuration files are **blueprints** for infrastructure.  

✅ Benefits:  
- **Consistency**: Always get the same outcome across environments.  
- **Reusability**: Share configurations across teams.  
- **Error Reduction**: Avoid human mistakes (e.g., missed settings in console or mistyped CLI flags).  

Example mistakes avoided:  
- Forgetting to uncheck a setting in the AWS Console.  
- Typing the wrong parameter in AWS CLI.  

With Terraform, everything is predefined in a `.tf` file — reliable and repeatable.  

---

## 🛠️ Project Setup

### Step 1: Install Terraform

1. Download Terraform from the [official site](https://developer.hashicorp.com/terraform/downloads).  
2. Add the binary to your system’s `PATH`.  
3. Verify installation:
  
```bash
  terraform version
```

* Create Project Directory and move into the Project Directory

  ```bash
  mkdir terraform-s3-project
  cd terraform-s3-project
  touch main.tf
  ```

Step 3: Define Infrastructure as in the (main.tf)

Step 4: Initialize Terraform

```bash
   terraform init
```

* It Downloads provider plugins and Prepares the working directory.

Step 5: Plan Changes

```bash
  terraform plan
```

* It Shows what Terraform will create/update/delete.

Save a plan to a file:

```bash
  terraform plan -out execution_plan
```

Step 6: Apply Changes

```bash
  terraform apply "execution_plan"
```

Confirm with yes to create the S3 bucket.

🕵️ Secret Mission: Upload Files to S3

Add this to your main.tf:

```hcl
resource "aws_s3_object" "my_file" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "image.png"
  source = "image.png"
}
```

Run:

```bash
  terraform plan
  terraform apply
```

✅ The file will be uploaded to your S3 bucket.

🔧 Troubleshooting

❌ If encountered an Error like : No valid credential sources found

* Fix: Configure AWS CLI.

```bash
  aws configure
```

Enter:

AWS Access Key ID

AWS Secret Access Key

Default Region

Make sure IAM user has proper S3 and Terraform permissions.


🧹 Cleaning Up

To avoid charges:

Delete objects first:

```bash
  terraform destroy -target=aws_s3_object.my_file
```

* Then Destroy all resources:

```bash
  terraform destroy
```

* Remove AWS access keys (security best practice):

```bash
  aws iam delete-access-key --access-key-id <your-access-key-id>
```

📜 Project Recap

* Services Used: Terraform, AWS S3, AWS CLI, AWS IAM.

* Concepts Learned: Infrastructure as Code, Providers, State Files, Configuration Management.

* Secret Mission Completed: Uploading files to S3 with Terraform.


💡 Reflection

- Most Challenging Part: Customizing S3 settings using Terraform Registry documentation.

- Most Rewarding Part: Watching a local file successfully upload to the S3 bucket via Terraform automation.
