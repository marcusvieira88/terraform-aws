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

For refresh terrafor state:
- terraform refresh

The command terraform import is used to import resources from AWS that are not in your code.

For visualize the modules structure you can use terraform graph command with GraphViz tool.

A good practice on Terraform is work into workspaces, for handle them use:
- terrform workspace new dev (create a workspace)
- terraform workspace select dev (change workspace)
- terraform workspace show (show the current workspace)
- terraform workspace list (show all workspaces available)
- terraform workspace delete dev (delete workspace)

### Serveless test

To test the serveless architecture, we need to log in to cognito first:

```
POST  https://todos-api-10736960503134048813.auth.us-east-1.amazoncognito.com/oauth2/token?grant_type=client_credentials
```
Basic Auth - client_id and client_secret
Header - Content-Type / application/x-www-form-urlencoded

For Test the API methods, add the Bearer Token - (generated in the step before - Cognito):

```
GET https://j4t20v4nzb.execute-api.us-east-1.amazonaws.com/dev/todos
```

```
POST https://j4t20v4nzb.execute-api.us-east-1.amazonaws.com/dev/todos
```

```
PUT https://j4t20v4nzb.execute-api.us-east-1.amazonaws.com/dev/todos?todoid=2
```

```
DELETE https://j4t20v4nzb.execute-api.us-east-1.amazonaws.com/dev/todos?todoid=2
```

Test trigger lambda by file update event:

```
aws2 s3 cp todo.json s3://terraform-todo-950158b0d4b4522d
```