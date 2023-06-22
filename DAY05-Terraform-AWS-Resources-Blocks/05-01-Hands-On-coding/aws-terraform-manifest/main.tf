
resource "aws_security_group" "asg" {
  name        = "terrasgb"
  description = "test"
  vpc_id      = "vpc-06f4255c5722106aa"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terra_ec2" {
  ami = "ami-0f5ee92e2d63afc18"
  associate_public_ip_address = true
  availability_zone = "ap-south-1b"
  instance_type = "t2.micro"
  #subnet_id = "subnet-00d2838782fa3ecee"
  vpc_security_group_ids = [aws_security_group.asg.id]
  root_block_device {
    delete_on_termination = true
  }

  user_data = <<EOF
        #!/bin/bash
        sudo apt update
        sudo apt install httpd -y
        sudo systemctl enable httpd
        sudo systemctl start httpd
  EOF

  tags = {
    Environment = "DEV"
  }
}
