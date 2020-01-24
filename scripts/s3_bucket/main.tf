
# Configure AWS provider
provider "aws" {
  region     = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "marcus-vieira-tech-bucket"
  acl    = "private"

  tags = {
    Name        = "Marcus Vieira Bucket"
    Environment = "Stage"
  }
}
