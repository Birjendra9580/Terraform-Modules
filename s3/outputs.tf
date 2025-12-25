output "bucket_id" {
    description = "s3 bucket id"
    value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
    description = "s3 bucket arn"
    value       = aws_s3_bucket.this.arn
}

output "bucket_domain_name" {
    description = "s3 bucket domain name"
    value = aws_s3_bucket.this.bucket_domain_name
}