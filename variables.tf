variable "aws_region" {
	default = "us-east-1"
}

variable "aws_access_key_id" {
	default = "nul"
}

variable "aws_secret_access_key" {
	default = "nul"
}


variable "vpc_cidr" {
	default = "10.112.34.0/23"
	
}

variable "coid" {
	default = "SEIX"
}

variable "azs" {
	type = list
	default = ["us-east-1a","us-east-1b"]
}

variable "subnets_cidr_public" {
	type = list
	default = ["10.112.34.128/25","10.112.35.128/25"]
}

variable "subnets_cidr_private" {
	type = list
	default = ["10.112.34.16/28","10.112.35.16/28"]
}

variable "subnets_cidr_mng" {
	type = list
	default = ["10.112.34.0/28","10.112.35.0/28"]
}

variable "subnets_cidr_tgw" {
	type = list
	default = ["10.112.34.32/28","10.112.35.32/28"]
}


variable "subnets_cidr_gwlb" {
	type = list
	default = ["10.112.34.64/28","10.112.35.64/28"]
}

variable "subnets_cidr_gwlbe" {
	type = list
	default = ["10.112.34.48/28","10.112.35.48/28"]
}

variable "rules_inbound_public_sg" {
  default = [
    {
      port = 0
      proto = "-1"
      cidr_block = ["0.0.0.0/0"]
    }
    ]
}

variable "rules_outbound_public_sg" {
  default = [
    {
      port = 0
      proto = "-1"
      cidr_block = ["0.0.0.0/0"]
    }
    ]
}

variable "rules_inbound_private_sg" {
  default = [
    {
      port = 0
      proto = "-1"
      cidr_block = ["10.0.0.0/8","192.168.0.0/16","172.16.0.0/12","100.70.0.0/15"]
    }
    ]
}

variable "rules_outbound_private_sg" {
  default = [
    {
      port = 0
      proto = "-1"
      cidr_block = ["0.0.0.0/0"]
    }
    ]
}

variable "rules_inbound_mgmt_sg" {
  default = [
  
    {
      port = 22
      proto = "tcp"
      cidr_block = ["10.159.94.0/23"]
    },
	
	{
      port = 443
      proto = "tcp"
      cidr_block = ["10.159.94.0/23"]
    },
	
	
	{
      port = 161
      proto = "udp"
      cidr_block = ["10.159.94.0/23"]
    },
	
	{
      port = 8
      proto = "icmp"
      cidr_block = ["10.159.94.0/23"]
    },
	
	{
      port = 22
      proto = "tcp"
      cidr_block = ["100.70.0.0/15"]
    },
	
	{
      port = 443
      proto = "tcp"
      cidr_block = ["100.70.0.0/15"]
    },
	
	
	{
      port = 161
      proto = "udp"
      cidr_block = ["100.70.0.0/15"]
    },
	
	{
      port = 8
      proto = "icmp"
      cidr_block = ["100.70.0.0/15"]
    }
	
	
    ]
}

variable "rules_outbound_mgmt_sg" {
  default = [
    {
      port = 0
      proto = "-1"
      cidr_block = ["0.0.0.0/0"]
    }
    ]
}

variable "il_external" {
	default = "207.223.34.132"
}

variable "fl_external" {
	default = "66.165.187.241"
}

variable "instance_type" {
	default = "m5.xlarge"
}

variable "ssh_key_name" {
	default = "firewall-sei"
}

variable "mgm_ip_address1" {
	default = "10.112.34.10"
}

variable "mgm_ip_address2" {
	default = "10.112.35.10"
}

variable "public_eni_1" {
	default = "10.112.34.135"
}

variable "public_eni_2" {
	default = "10.112.35.135"
}

variable "private_eni_1" {
	default = "10.112.34.20"
}

variable "private_eni_2" {
	default = "10.112.35.20"
}
