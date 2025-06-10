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
