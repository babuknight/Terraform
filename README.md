<<<<<<< HEAD
Terraform AWS Cloud Project: VPC + EC2 + ALB + ASG
This project provisions a complete AWS infrastructure using Terraform, including:

Remote state storage using S3
A custom VPC with public and private subnets
An EC2 Auto Scaling Group behind an Application Load Balancer
Terraform AWS Setup Prerequisites
Before using Terraform to provision AWS infrastructure, you must set up an IAM user with the appropriate permissions and retrieve access credentials. Below are the required steps:

🚀 Prerequisites
Create and IAM user for Terraform (e.g., terraform-user) and attach the AdministratorAccess policy for managing the AWS resources your Terraform configuration requires (e.g., EC2, VPC, S3, etc.)
Create Access Key ID and Secret Access Key and save them in secured place
Install and Configure AWS CLI with the IAM profile
aws configure --profile terraform-user
Manually create the S3 bucket and update the details in backend.tf file
create a file terraform.tfvars in the Project root directory and update these variables based your preference
Update Variables on terraform.tfvars
region                         = "YOUR_REGION"
iam_profile                    = "terraform-user"
vpc_cidr_block                 = "10.0.0.0/16"
public_subnet_count            = "2"
private_subnet_count           = "2"
webserver_launch_template_name = "ec2-launch-template"
webserver_ec2_instance_type    = "t2.micro"
webserver_asg_desired_capacity = "2"
webserver_asg_min_size         = "1"
webserver_asg_max_size         = "3"
app_port                       = "80"
webserver_tg_name              = "webserver-target-group"
websever_lb_sg_name            = "websever-lb-security-group"
To Initiate Terraform
export AWS_PROFILE=terraform-user
terraform init
terraform plan
terraform apply
terraform destroy
=======
Terraform Infrastructure: VPC, Subnets, Instance Module, and Security Group
This Terraform setup creates the following AWS infrastructure components:

A VPC
Two subnets: one public and one private
An instance module with one EC2 instance
A security group
The configuration uses variables to define key values, which you need to set when deploying.

Update this values in terraform.tfvars file:
region_name = ""

env_name = ""

vpc_cidr = ""

public_cidr = ""

private_cidr = ""

instance_type = ""

ami_id = ""
>>>>>>> work
