# Configure AWS provider
provider "aws" {
  region     = "us-east-1"
}

resource "aws_s3_bucket" "bucket-1" {
  bucket = "marcus-vieira-tech-bucket"
  acl    = "private"

  tags = {
    Name        = "Marcus Vieira Bucket"
    Environment = "Stage"
  }
}

resource "aws_s3_bucket_object" "object-1" {
  bucket = "${aws_s3_bucket.bucket-1.id}"
  key    = "file.txt"
  source = "file.txt"

  etag = "${filemd5("file.txt")}"
}

output "bucket-id" {
  value = "${aws_s3_bucket.bucket-1.id}"
}

output "etag-file" {
  value = "${aws_s3_bucket_object.object-1.etag}"
}

