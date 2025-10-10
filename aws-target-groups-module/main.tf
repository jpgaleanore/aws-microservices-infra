terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

########## First target group for customer one ##########
resource "aws_lb_target_group" "web_tg_customer_one" {
  name        = "customer-tg-one"
  port        = 8080                   # Puerto de tu aplicación en EC2
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpcid

  health_check {
    path = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200-399"
  }

}

resource "aws_lb_target_group_attachment" "web_attachment" {
  target_group_arn = aws_lb_target_group.web_tg_customer_one.arn
  target_id        = var.instance_id # ID de la instancia EC2
  port             = 8080 # Puerto que escucha tu aplicación
}

########## Second target group for customer two ##########
resource "aws_lb_target_group" "web_tg_customer_two" {
  name        = "customer-tg-two"
  port        = 8080                   # Puerto de tu aplicación en EC2
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpcid

  health_check {
    path = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200-399"
  }

}

resource "aws_lb_target_group_attachment" "web_attachment_two" {
  target_group_arn = aws_lb_target_group.web_tg_customer_two.arn
  target_id        = var.instance_id # ID de la instancia EC2
  port             = 8080 # Puerto que escucha tu aplicación
}

########## First target group for employee two ##########
resource "aws_lb_target_group" "web_tg_employee_one" {
  name        = "employee-tg-one"
  port        = 8080                   # Puerto de tu aplicación en EC2
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpcid

  health_check {
    path = "/admin/suppliers"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200-399"
  }

}

resource "aws_lb_target_group_attachment" "web_attachment_three" {
  target_group_arn = aws_lb_target_group.web_tg_employee_one.arn
  target_id        = var.instance_id # ID de la instancia EC2
  port             = 8080 # Puerto que escucha tu aplicación
}

########## Second target group for employee two ##########
resource "aws_lb_target_group" "web_tg_employee_two" {
    name        = "employee-tg-two"
    port        = 8080                   # Puerto de tu aplicación en EC2
    protocol    = "HTTP"
    target_type = "instance"
    vpc_id      = var.vpcid

    health_check {
        path = "/admin/suppliers"
        protocol            = "HTTP"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 3
        unhealthy_threshold = 2
        matcher             = "200-399"
    }
}

resource "aws_lb_target_group_attachment" "web_attachment_four" {
  target_group_arn = aws_lb_target_group.web_tg_employee_two.arn
  target_id        = var.instance_id # ID de la instancia EC2
  port             = 8080 # Puerto que escucha tu aplicación
}



