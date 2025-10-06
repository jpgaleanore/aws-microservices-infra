variable "region" {
  type    = string
  default = "us-east-1"
}

variable "repository_name_customer" {
  type    = string
  default = "microservices/customer2"
}

variable "repository_name_employee" {
  type    = string
  default = "microservices/employee2"
}

variable "enable_scan_on_push" {
  type    = bool
  default = true
}
