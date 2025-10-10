resource "aws_security_group" "ec2_sg" {
  name        = "microservices-sg"
  description = "Security group for web EC2 instance"
  vpc_id      = var.vpcid

  # Regla de entrada para puerto 80 desde cualquier IPv4
  ingress {
    description = "Allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regla de entrada para puerto 8080 desde cualquier IPv4
  ingress {
    description = "Allow HTTP access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "microservices_lb" {
  name               = "microservicesLB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ec2_sg.id]
  subnets            = [var.public_subnet1_id, var.public_subnet2_id]
  ip_address_type    = "ipv4"
}

resource "aws_lb_listener" "http_80" {
  load_balancer_arn = aws_lb.microservices_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg_customer_two.arn
  }
}

resource "aws_lb_listener_rule" "admin_path_rule" {
  listener_arn = aws_lb_listener.http_80.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg_employee_two.arn
  }

  condition {
    path_pattern {
      values = ["/admin/*"]
    }
  }
}

resource "aws_lb_listener" "http_8080" {
  load_balancer_arn = aws_lb.microservices_lb.arn
  port              = 8080
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg_customer_one.arn
  }
}

resource "aws_lb_listener_rule" "admin_path_rule_8080" {
  listener_arn = aws_lb_listener.http_8080.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg_employee_one.arn
  }

  condition {
    path_pattern {
      values = ["/admin/*"]
    }
  }
}
