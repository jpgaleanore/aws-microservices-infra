# ECR repository for customer microservice
resource "aws_ecr_repository" "ecr_customer" {
  name = var.repository_name_customer
  image_scanning_configuration {
    scan_on_push = var.enable_scan_on_push
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Terraform = "true"
    Project   = var.repository_name_customer
  }
}

resource "aws_ecr_repository_policy" "customer_repo_policy" {
  repository = aws_ecr_repository.ecr_customer.name
  policy     = file("repository-policy.json")
}

# ECR repository for employee microservice
resource "aws_ecr_repository" "ecr_employee" {
  name = var.repository_name_employee
  image_scanning_configuration {
    scan_on_push = var.enable_scan_on_push
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Terraform = "true"
    Project   = var.repository_name_employee
  }
}

resource "aws_ecr_repository_policy" "employee_repo_policy" {
  repository = aws_ecr_repository.ecr_employee.name
  policy     = file("repository-policy.json")
}
