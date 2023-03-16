
output "bucket_name" {
  value = aws_s3_bucket.example[0].id
}

output "bucket_region" {
  value = aws_s3_bucket.example[0].region
}

output "bucket_lifecycle_policy" {
  value = jsonencode(aws_s3_bucket.example[0].lifecycle_rule)
}

output "versioning_status" {
  value = aws_s3_bucket_versioning.versioning_example[0].versioning_configuration.0.status
}

output "bucket_arn" {
  value = aws_s3_bucket.example[0].arn
}

output "bucket_default_encryption" {
  value = aws_s3_bucket.example[0].server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.0.sse_algorithm
}

