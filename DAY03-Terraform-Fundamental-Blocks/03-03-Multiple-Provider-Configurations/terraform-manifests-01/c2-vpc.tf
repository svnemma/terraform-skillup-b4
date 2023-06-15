
resource "aws_vpc" "vpc-us-east-1" {
  cidr_block = "10.1.0.0/16"
  tags = {
    "Name" = "vpc-us-east-1"
  }
}

resource "aws_vpc" "ap-south-1" {
  provider = aws.mumbai
  cidr_block = "10.1.0.0/16"
  tags = {
    "Name" = "ap-south-1"
  }
}
