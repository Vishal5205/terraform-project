provider "aws" {
    region = var.region
  
}

# VPC
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "terraform-vpc"
    }
}

#Subnet
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "terraform-subnet"
    }
  
}
# Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "terraform-igw"
    }
  
}

# Route Table
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "terraform-rt"
    }
  
}

# Route Table Association
resource "aws_route_table_association" "public_rt_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id

 
}

resource "aws_security_group" "sg" {
    name = "aws_sg"

    vpc_id = aws_vpc.main.id

    tags = {
        Name = "terraform-sg"
    }


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

module "ec2" {
    source = "./modules/ec2"
    
    
    ami_id = "ami-05d2d839d4f73aafb"
    instance_type = "t3.micro"
    key_name = "ap-south-1"
   
    sg_id = aws_security_group.sg.id
    subnet_id = aws_subnet.public_subnet.id
   
}