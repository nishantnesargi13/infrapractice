

---

### **README for Task 2: Deploying a Hello World Application with Secrets Management**

# **Task 2: Deploy a Hello World Application and Manage Secrets in EKS**

## **Overview**

In this task, I deployed a simple **Hello World** application to the **EKS cluster** and managed sensitive data using **AWS Secrets Manager** and **External Secrets Operator**. Additionally, I exposed the application via **Ingress** so that it could be accessed externally.

## **Prerequisites**

1. **Working EKS Cluster**: You need an **EKS cluster** set up from Task 1, which is accessible via `kubectl`.
2. **kubectl**: Install `kubectl` to interact with the Kubernetes cluster. 
3. **Helm**: Helm is a package manager for Kubernetes that simplifies the installation of many tools, including the **External Secrets Operator**.
4. **AWS Secrets Manager**: You need to have an **AWS Secret** created in **Secrets Manager**. This will hold sensitive information like passwords or API keys.
5. **Ingress Controller**: Ensure you have an **Ingress Controller** (like **Nginx** or **ALB Ingress Controller**) set up in your EKS cluster. This is necessary for routing traffic to the application.




### Step-by-Step Instructions



### **1. **Install the External Secrets Operator****

The **External Secrets Operator** is a Kubernetes operator that fetches secrets from external services like AWS Secrets Manager. It allows Kubernetes to manage sensitive data securely.

1. **Install the CRDs (Custom Resource Definitions)**:

   The operator requires custom resources to work with secrets, so first install the CRDs:

   ```bash
   kubectl apply -f https://github.com/external-secrets/external-secrets/releases/download/v0.6.0/external-secrets-crds.yaml

   
   
#******2**. Create a Secret in AWS Secrets Manager******************

In AWS Secrets Manager, create a new secret to store sensitive data. For example:

Secret Name: MySecret

Key-Value Pair: password = mysecretpassword

Make sure to note the Secret ARN for use in the next step.



#******3. Create Kubernetes Resources to Manage Secrets**************

Create a SecretStore: This is a custom resource that defines how Kubernetes will connect to AWS Secrets Manager.

Create an ExternalSecret: This resource references the AWS secret and tells Kubernetes to create a Kubernetes Secret from it.

These resources ensure that Kubernetes pulls the secrets from AWS and securely injects them into the application.



#******4. Deploy the Hello World Application**********
Create a Deployment: The application to be deployed is a simple Nginx container that serves a "Hello World" page.

Create a Service: This service exposes the Hello World app within the Kubernetes cluster.

#******5. Expose the Application Using Ingress**********
   
Create an Ingress Resource: The Ingress resource allows external access to the application via a domain or public IP. This is configured to route traffic to the Nginx-based Hello World app.

**
#********6. Apply the Resources**********

Once the manifests for the secrets, deployments, services, and ingress are ready, use kubectl to apply them to the cluster:


**kubectl apply -f secretstore.yaml

kubectl apply -f externalsecret.yaml

kubectl apply -f hello-world-deployment.yaml

kubectl apply -f hello-world-service.yaml

kubectl apply -f hello-world-ingress.yaml**


#******7. Verify the Deployment**************

Check the pods:

kubectl get pods

Verify the Ingress to check if the application is exposed:

kubectl get ingress hello-world-ingress
**
