variable "aws_region" {
  description = "The AWS region"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The EKS cluster name"
  default     = "nishant-cluster"
}

variable "node_instance_type" {
  description = "EC2 instance type "
  default     = "t3.micro"
}
