#vpc module
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    name = "vpc-${var.env_name}"
  }
}

resource "aws_subnet" "public" {
  cidr_block        = var.public_cidr
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region_name}a"
  tags = {
    name = "${var.env_name}-subnet-pb"
  }
}

resource "aws_subnet" "private" {
  cidr_block        = var.private_cidr
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region_name}b"
  tags = {
    name = "${var.env_name}_subnet_pt"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    name = "${var.env_name}-igw"
  }
}
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  tags = {
    name = "${var.env_name}-ngw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    name = "${var.env_name}-route_table_pb"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
  tags = {
    name = "${var.env_name}-route_table_pt"
  }
}

# how this subnet value will pass outside- chk with iniyan

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}