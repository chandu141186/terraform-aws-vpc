resource "aws_vpc" "roboshop" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.roboshop.id

  tags = {
    Name = "main"
  }
  }

  resource "aws_internet_gateway_attachment" "igw" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.roboshop.id
}

resource "aws_subnet" "roboshop_public" {
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}



resource "aws_subnet" "roboshop_public" {
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "roboshop_private" {
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = "10.0.2.0/24"


}

resource "aws_subnet" "roboshop_database" {
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = "10.0.3.0/24"
}


  resource "aws_route_table" "roboshop_public_route" {
  vpc_id = aws_vpc.roboshop.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.igw.id
  }

  
}

  tags = {
    Name = "Main"
  }
}