variable "ami_id" {
    default = "ami-05d2d839d4f73aafb"
    description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
    default = "t3.micro"
    description = "Instance type for the EC2 instance"
}

variable "key_name" {
    default = "Mumbai_region_key_pair"
    description = "Key name for the EC2 instance"
}

variable "region" {
    default = "ap-south-1"
    description = "Region for the EC2 instance"
}
variable "sg_id" {
    type = string
    description = "security group ID"
}

variable "subnet_id" {
    type = string
    description = "subnet ID"
}
