# Configure AWS provider
provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "marcus-vieira-terraform-remote-state-dev"
    key = "s3/s3.tfstate"
    region = "us-east-1"
  }
}

resource "random_id" "random-value" {
  byte_length = 8
}

resource "random_id" "random-value2" {
  byte_length = 8
}

module "bucket-1" {
  source = "./s3"

  name       = "my-bucket-${random_id.random-value.hex}"
  versioning = true

  tags = {
    "name" = "Test Marcus Vieira"
  }

  create_object = true
  object_key    = "files/${random_id.random-value.dec}.txt"
  object_source = "file.txt"
}


module "bucket-2" {
  source = "./s3"

  name = "my-bucket-2-${random_id.random-value2.hex}"
}


