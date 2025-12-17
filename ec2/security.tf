resource "aws_security_group" "ec2_sg" {
    name        = "${local.instance_name_formatted}-sg"
    description = "security group for ec2 instance"
    vpc_id      = var.vpc_id

    dynamic "ingress" {
        for_each = var.allowed_ssh_ips
        
        # allow ssh only
        content {
            description = "Allow SSH from trusted IP"
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = [ingress.value]
            # this cidr provider by the developer and it is storein variable.tf file
            # we pass it in terraform.tfvar
            # Then we used in security.tf
        }
    }

    # llow internal VPC communication
    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = [data.aws_vpc.selectd.cidr_block]
    }

    # allow outbound traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(local.common_tages, {
        Name = "${local.instance_name_formatted}-sg"
    })
}