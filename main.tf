provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main_vpc" {
  cidr_block       					         = "10.160.102.0/23"
  tags = {
    Name = join("", [var.coid, "-VPC"])
  }
}

resource "aws_subnet" "public" {
  count = length(var.subnets_cidr_public)
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = element(var.subnets_cidr_public,count.index)
  availability_zone = element(var.azs,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = ("Public-AZ${count.index+1}")
  }
}

resource "aws_subnet" "Private" {
  count = length(var.subnets_cidr_private)
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = element(var.subnets_cidr_private,count.index)
  availability_zone = element(var.azs,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = ("Private-AZ${count.index+1}")
  }
}

resource "aws_subnet" "MNG" {
  count = length(var.subnets_cidr_mng)
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = element(var.subnets_cidr_mng,count.index)
  availability_zone = element(var.azs,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = ("MNG-AZ${count.index+1}")
  }
}

resource "aws_subnet" "TGW" {
  count = length(var.subnets_cidr_tgw)
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = element(var.subnets_cidr_tgw,count.index)
  availability_zone = element(var.azs,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = ("TGW-AZ${count.index+1}")
  }
}

resource "aws_subnet" "GWLB" {
  count = length(var.subnets_cidr_gwlb)
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = element(var.subnets_cidr_gwlb,count.index)
  availability_zone = element(var.azs,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = ("GWLB-AZ${count.index+1}")
  }
}

resource "aws_subnet" "GWLBE" {
  count = length(var.subnets_cidr_gwlbe)
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = element(var.subnets_cidr_gwlbe,count.index)
  availability_zone = element(var.azs,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = ("GWLBE-AZ${count.index+1}")
  }
}

resource "aws_ec2_transit_gateway" "main_tgw" {
  description = "TGW"
  auto_accept_shared_attachments = "enable"
  tags = {
   Name = join("", [var.coid, "-TGW"])
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-main" {
  depends_on = [aws_subnet.TGW,aws_ec2_transit_gateway.main_tgw]
  subnet_ids         = "${aws_subnet.TGW.*.id}"
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  vpc_id             = aws_vpc.main_vpc.id
  appliance_mode_support = "enable"
  tags = {
   Name = join("", [var.coid, "-SecVPC"])
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = join("", [var.coid, "-IGW"])
  }
}
