resource "aws_instance" "EC2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.sg_id]
    associate_public_ip_address = true

    # Block Device Mapping
    root_block_device {
        volume_size = 20
        volume_type = "gp3"
    }
    tags = {
        Name = "Terraform_EC2"
    }
}

