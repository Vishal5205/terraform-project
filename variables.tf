variable "region" {
    default = "ap-south-1"
    description = "Region for the EC2 instance"
}

variable "ami_id" {
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
