# Using Terraform with AWS Services

To configure Terrraform:
- Download the terraform in https://www.terraform.io/downloads.html.
- Move it to /usr/local/bin/terraform
- Check if it is working with the command: terraform --version

To use AWS:

- Create free account
- Create programatic user for terraform in AIM (create a user group for it)
- Download and save the user creadentials
- Install AWS CLI:
    - Configure the credential into AWS CLI tool using command: aws configure 

Terraform AWS provider documentation: https://www.terraform.io/docs/providers/aws/index.html

To execute the script:
- Go to the script path(e.g. s3_bucket)
- Execute terraform init
- For check what will be create you can use terraform plan
- For create the resource on AWS use terraform apply

For update a resource you can update the script and execute terraform apply.

To see the resources created by Terraform you can use terraform show.

For delete a resource use terraform destroy.

If you need to force a resource to be recreated you can use:
- terraform taint aws_s3_bucket_object.object

For inspect the terraform resource values you can use:
- terraform console
    - aws_s3_bucket_object.object-1.id
    - aws_s3_bucket_object.object-1.bucket

To apply value to variables during execution you can use the -var property:
- terraform apply -var "instance_type=t2.micro"    

Or you can use files that contains the values:
- terraform plan -var-file="dev.tfvars"

The Terraform supports other variables types such as list and map.

For avoid to type "yes" during the apply command you can use the -auto-approve parameter.
- terraform apply -auto-approve    

To format the code you can use:
- terraform fmt

The command terraform import is used to import resources from AWS that are not in your code.

For visualize the modules structure you can use terraform graph command with GraphViz tool.

A good practice on Terraform is work into workspaces, for handle them use:
- terrform workspace new dev (create a workspace)
- terraform workspace select dev (change workspace)
- terraform workspace show (show the current workspace)
- terraform workspace list (show all workspaces available)
- terraform workspace delete dev (delete workspace)


