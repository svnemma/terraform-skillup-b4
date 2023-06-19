# Resource Block
# Resource-1: Create VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "myvpc"
  }
}

data "aws_ec2_instance_type" "name" {
  instance_type = "t2.micro"
}

