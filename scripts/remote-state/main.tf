
# Configure AWS provider
provider "aws" {
  region     = "us-east-1"
}

module "bucket" {
  source = "../modules/s3"

  name       = "${var.bucket-name}-${var.env}"
  versioning = true

  tags = {
    "env" = "${var.env}"
    "name" = "Terraform Remote State"
  }
}
