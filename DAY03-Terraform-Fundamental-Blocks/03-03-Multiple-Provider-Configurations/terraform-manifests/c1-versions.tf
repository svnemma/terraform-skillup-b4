# Terraform Block
terraform {
  required_version = "~> 1.3.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider-1 for us-east-1 (Default Provider)
provider "aws" {
  region = "us-east-1"
}


# Provider-2 for us-west-1
provider "aws" {
  region = "ap-south-1"
  profile = "dev"
  alias = "mumbai"
}



