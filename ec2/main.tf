resource "aws_instance" "this" {
    ami           = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    key_name = var.key_name
    associate_public_ip_address = var.enable_public_ip
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    tags = merge(
        local.common_tages,
        {Name = local.instance_name_formatted}
    )
}