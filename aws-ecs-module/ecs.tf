resource "aws_ecs_cluster" "microservices_serverlesscluster" {
  name = var.ecs_cluster_name

  tags = {
    Name        = var.ecs_cluster_name
    Environment = var.environment
  }
}

resource "aws_ecs_cluster_capacity_providers" "fargate_provider" {
  cluster_name = aws_ecs_cluster.microservices_serverlesscluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
  }
}