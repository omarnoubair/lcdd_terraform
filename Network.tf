###################################################################################
###################################################################################
###########                                                   #####################
###########                        VPC                        #####################
###########                                                   #####################
###################################################################################
###################################################################################
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block              = "${var.vpc-cidr}"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "VPC_TF"
  }
}

# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "IGW_TF"
  }
}

# Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.public-subnet-1-cidr}"
  availability_zone       = "${var.subnet-1}"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "Public Subnet tf"
  }
}


# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "private-subnet-1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = "${var.private-subnet-1-cidr}"
  availability_zone        = "${var.subnet-1}"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private Subnet tf"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = "${var.private-subnet-2-cidr}"
  availability_zone        = "${var.subnet-2}"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private Subnet tf"
  }
}

resource "aws_eip" "nat_eip" {
  tags = {
    Name = "IP For Nat"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_internet_gateway.internet-gateway]
}

# Create Route Table and Add Public Route
# terraform aws create route table
resource "aws_route_table" "public-route-table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags       = {
    Name     = "Public Route Table tf"
  }
}
resource "aws_route_table" "public-route-nat" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags       = {
    Name     = "Public Route Table nat tf"
  }
}
# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.public-subnet-1.id
  route_table_id      = aws_route_table.public-route-table.id
}
resource "aws_route_table_association" "public-subnet-1-route-table-association-nat" {
  subnet_id           = aws_subnet.private-subnet-1.id
  route_table_id      = aws_route_table.public-route-nat.id
}
