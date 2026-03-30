variable "ami_id" {
    default = "ami-05d2d839d4f73aafb"
    description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
    default = "t3.micro"
    description = "Instance type for the EC2 instance"
}

variable "key_name" {
    default = "ap-south-1"
    description = "Key name for the EC2 instance"
}

variable "sg_id" {
    default = "sg-0123456789abcdef0"
    description = "Security group ID for the EC2 instance"
}

variable "region" {
    default = "ap-south-1"
    description = "Region for the EC2 instance"
}