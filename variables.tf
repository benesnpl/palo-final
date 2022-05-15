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
