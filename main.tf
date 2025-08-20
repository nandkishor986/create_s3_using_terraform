provider "aws" {
  region = var.aws_region # Update this to the region which is closest to us EX - Asia Pacific Mumbai. 
}

resource "random_string" "suffix" {
  length  = 6
  lower   = true
  upper   = false
  special = false
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "techno-unique-bucket-${random_string.suffix.result}" # Ensure this bucket name is globally unique.
  
  tags = {
    Environment = "Development"
  }
}

resource "aws_s3_bucket_public_access_block" "my_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

# Enable S3 Bucket Versioning

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Uploading a Object to a Bucket:

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.my_bucket.id # Reference the Bucket ID.
  key    = "images/download.png"      # Provide Path - where should this image will be stored in the bucket and by what name. 
  source = "download.png"             # Local File Path.
}
