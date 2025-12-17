resource "aws_lb" "this" {
    name               = var.name
    internal           = var.internal
    load_balancer_type = "application"

    security_groups    = var.security_group_ids
    subnets            = var.subnet_ids

    enable_deletion_protection = false

    tags = local.tags
}

# Target Group
resource "aws_lb_target_group" "tg" {
    name     = "${var.name}-tg"
    port     = var.target_port
    protocol = "HTTP"
    vpc_id   = var.vpc_id

    health_check {
      path = "/"
      matcher = "200-399"
      interval = 30
      timeout = 5
      healthy_threshold = 2
      unhealthy_threshold = 2
    }
    
    tags = local.tags
}  

# Listener (port 80)
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

