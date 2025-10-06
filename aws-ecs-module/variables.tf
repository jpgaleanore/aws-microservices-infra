variable "region" {
  description = "AWS region to deploy the ECS cluster"
  type        = string
  default     = "us-east-1"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS Cluster"
  type        = string
  default     = "microservices-serverlesscluster"
}

variable "environment" {
  description = "Environment tag (e.g., dev, prod, lab)"
  type        = string
  default     = "lab"
}
