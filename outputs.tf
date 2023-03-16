output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

#output "bucket_region" {
#  value = aws_s3_bucket.example.region
#}

output "bucket_lifecycle_policy" {
  value = jsonencode(aws_s3_bucket.example.lifecycle_rule)
}

output "versioning_status" {
  value = aws_s3_bucket_versioning.versioning_example.versioning_configuration.0.status
}

output "bucket_arn" {
  value = aws_s3_bucket.example.arn
}

output "bucket_default_encryption" {
  value = aws_s3_bucket.example.server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.0.sse_algorithm
}

