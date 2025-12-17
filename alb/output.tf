output "alb_dns_name" {
    description = "DNS name of ALB"
    value = aws_lb.this.dns_name
}

output "alb_arn" {
    description = "ARN of the ALB"
    value = aws_lb.this.arn
}

output "target_group_arn" {
    description = "Target Group ARN"
    value = aws_lb_target_group.tg.arn
}