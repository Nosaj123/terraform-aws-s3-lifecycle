resource "aws_s3_bucket" "example" {
  #bucket = var.bucket_name[0]
  #region = var.region_name

  count  = length(var.bucket_name)
  bucket = var.bucket_name[count.index]

}

resource "aws_s3_bucket_acl" "example" {
  count  = length(var.bucket_name)
  bucket = aws_s3_bucket.example[count.index].id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count  = length(var.bucket_name)
  bucket = aws_s3_bucket.example[count.index].id
  versioning_configuration {
    status = "Enabled"

  }
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "example-entire-bucket" {
  count  = length(var.bucket_name)
  bucket = aws_s3_bucket.example[count.index].id
  name   = "EntireBucket"


  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 90
  }

  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = 180
  }

}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  count  = length(var.bucket_name)
  bucket = aws_s3_bucket.example[count.index].id

  rule {
    id = "log"

    expiration {
      days = 90
    }

    filter {
      and {
        prefix = "log/"

        tags = {
          rule      = "log"
          autoclean = "true"
        }
      }
    }

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }

  rule {
    id = "tmp"

    filter {
      prefix = "tmp/"
    }

    expiration {
      date = "2023-01-13T00:00:00Z"
    }

    status = "Enabled"
  }
}
