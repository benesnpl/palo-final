variable "aws_region" {
	default = "eu-west-1"
}

variable "vpc_cidr" {
	default = "10.160.102.0/23"
}

variable "coid" {
	default = "PROT"
}

variable "azs" {
	type = list
	default = ["eu-west-1a", "eu-west-1b"]
}

variable "subnets_cidr_public" {
	type = list
	default = ["10.160.102.128/25","10.160.103.128/25"]
}

variable "subnets_cidr_private" {
	type = list
	default = ["10.160.102.16/28","10.160.103.16/28"]
}

variable "subnets_cidr_mng" {
	type = list
	default = ["10.160.102.0/28","10.160.103.0/28"]
}

variable "subnets_cidr_tgw" {
	type = list
	default = ["10.160.102.64/28","10.160.103.64/28"]
}


variable "subnets_cidr_gwlb" {
	type = list
	default = ["10.160.102.48/28","10.160.103.48/28"]
}

variable "subnets_cidr_gwlbw" {
	type = list
	default = ["10.160.102.32/28","10.160.103.32/28"]
}

