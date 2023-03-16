resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  #region = var.region_name

}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"

  }
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "example-entire-bucket" {
  bucket = aws_s3_bucket.example.id
  name   = "EntireBucket"

  
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 60
  }
  
  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = 90
  }
  
}