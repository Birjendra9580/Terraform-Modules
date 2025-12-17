output "instance_id" {
    description = "Ec2 Instance Id"
    value = aws_instance.this.id 
}

output "instance_public_ip" {
    description = "ec2 instance public ip"
    value = aws_instance.this.public_ip
}

output "instance_private_ip" {
    description = "ec2 instance private ip"
    value = aws_instance.this.private_ip
}