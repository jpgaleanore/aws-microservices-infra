output "repository_url_customer" {
  value = aws_ecr_repository.ecr_customer.repository_url
}

output "repository_arn_customer" {
  value = aws_ecr_repository.ecr_customer.arn
}

output "repository_url_employee" {
  value = aws_ecr_repository.ecr_employee.repository_url
}

output "repository_arn_employee" {
  value = aws_ecr_repository.ecr_employee.arn
}
