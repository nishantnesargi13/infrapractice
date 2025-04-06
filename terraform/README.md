# Task 1: Provision EKS Cluster Using Terraform

## Overview

In this task, I provisioned an **Elastic Kubernetes Service (EKS)** cluster on AWS using **Terraform**. This involves creating the necessary AWS resources like VPC, subnets, security groups, IAM roles, and the EKS cluster itself.

## Prerequisites

Before you begin, make sure you have the following:

1. **AWS Account**: You need an AWS account. 
2. **AWS CLI**: Ensure you have the AWS CLI installed and configured with your AWS credentials. 
3. **Terraform**: Install Terraform on your machine. 
4. **kubectl**: Install kubectl to interact with your EKS cluster. 



## Steps to Complete:



### 1. **Configure AWS Provider**

In `provider.tf`, configure Terraform to use your AWS credentials and define the region.

### 2. **Define Variables**

The `variables.tf` file contains all the necessary variables such as AWS region, cluster name, and instance type.

### 3. **Provision the EKS Cluster**

The `eks-cluster.tf` file will provision the EKS cluster, including IAM roles, EKS service configurations, and any necessary networking setups.

### 4. **Create VPC and Security Groups**

In `vpc.tf`, we define the Virtual Private Cloud (VPC) and security groups that will isolate and control traffic for the EKS cluster.

### 5. **Deploy Resources**

Run the following commands to initialize, plan, and apply the infrastructure using Terraform:

```bash
terraform init
terraform plan
terraform apply

**Once the resources are created, verify that the EKS cluster is up and running using the AWS console or kubectl**
kubectl get nodes

