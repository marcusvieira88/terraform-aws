output "bucket-name" {
  value = "${module.bucket.name}"
}

//Amazon Resource Name (ARN) format to identify any resources in AWS. arn: partition : service : region : namespace : relative-id
output "bucket-arn" { 
  value = "${module.bucket.arn}"
}

