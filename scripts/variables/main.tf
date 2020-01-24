# Configure AWS provider
provider "aws" {
  region = "${var.region}"
}

data "aws_ami" "ubuntu" {
  owners = ["amazon"]
  most_recent = true
  name_regex = "ubuntu"
}

locals {
  ami = "${data.aws_ami.ubuntu.id}"
}

resource "aws_instance" "web" {
  ami = "${local.ami}"
  instance_type = "${var.instance_type}"
}
