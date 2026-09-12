# VPC

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MY-VPC"
  }
}

# PUBLIC SUBNET

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.1.0/24"

  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet"
  }
}


# PRIVATE SUBNET

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.2.0/24"

  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-Subnet"
  }
}


# INTERNET GATEWAY

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "MY-IGW"
  }
}


# PUBLIC ROUTE TABLE

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Public-Route-Table"
  }
}



# PUBLIC ROUTE
# INTERNET GATEWAY

resource "aws_route" "public_internet" {
  route_table_id = aws_route_table.public.id

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = aws_internet_gateway.igw.id
}


# PUBLIC SUBNET
# ROUTE TABLE ASSOCIATION


resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id

  route_table_id = aws_route_table.public.id
}



# PRIVATE ROUTE TABLE

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Private-Route-Table"
  }
}


# PRIVATE SUBNET
# ROUTE TABLE ASSOCIATION

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id

  route_table_id = aws_route_table.private.id
}
