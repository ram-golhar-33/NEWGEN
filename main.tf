# Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "terraform-ec2-sg"
  description = "Allow SSH and HTTP traffic"

  # Port 22 - SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Port 80 - HTTP
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-EC2-SG"
  }
}


# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  # No key pair
  # key_name is intentionally not used

  tags = {
    Name = "Terraform-EC2"
  }
}
