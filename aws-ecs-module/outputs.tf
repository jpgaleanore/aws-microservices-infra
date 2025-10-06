output "ecs_cluster_name" {
  description = "ECS Cluster name"
  value       = aws_ecs_cluster.microservices_serverlesscluster.name
}

output "ecs_cluster_arn" {
  description = "ECS Cluster ARN"
  value       = aws_ecs_cluster.microservices_serverlesscluster.arn
}
