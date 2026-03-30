provider "aws" {
    region = var.region
  
}

resource "aws_security_group" "sg" {
    name = "aws_sg"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
     
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_s3_bucket" "bucket" {
    bucket = "vishal-devops-2026"
    tags = {
        name = "Devops_bucket"
    }
}

module "ec2" {
    source = "./modules/ec2"
    
    
    ami_id = "ami-05d2d839d4f73aafb"
    instance_type = "t3.micro"
    key_name = "ap-south-1"
    sg_id = aws_security_group.sg.id
  
}