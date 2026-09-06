# VPC

data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = ["MY-VPC"]
  }
}


# Subnet

data "aws_subnet" "my_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.my_vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["Public-Subnet"]
  }
}


# Outputs

output "vpc_id" {
  value = data.aws_vpc.my_vpc.id
}

output "vpc_cidr" {
  value = data.aws_vpc.my_vpc.cidr_block
}

output "subnet_id" {
  value = data.aws_subnet.my_subnet.id
}
