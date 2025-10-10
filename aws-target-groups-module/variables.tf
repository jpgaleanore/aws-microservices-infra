variable "vpcid" {
  type = string
  description = "The ID of the VPC where the target group will be created"
  default = "vpc-09ddc02f7696931ab"
}

variable "instance_id" {
  type = string
  description = "The ID of the EC2 instance to attach to the target group"
  default = "i-086778dffc4a60b14"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "public_subnet1_id" {
  type = string
  description = "The ID of the first public subnet for the load balancer"
  default = "subnet-011cdd99c772c7f12"
}

variable "public_subnet2_id" {
  type = string
  description = "The ID of the second public subnet for the load balancer"
  default = "subnet-069a3f23d3a011707"
}