# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.66.0"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "us-east-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  #ami           = "ami-0be2609ba883822ec" # Amazon Linux in us-east-1, update as per your region
  ami = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
}


output "ec2_instance_publicip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.ec2demo.instance_state
}