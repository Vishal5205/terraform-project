output "ec2_public_ip" {
    value = module.ec2.public_ip    
}

output "s3-bucket_name" {
    value = aws_s3_bucket.bucket.bucket
}