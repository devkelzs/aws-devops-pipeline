variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "availability_zone" {
  description = "AZ to use"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
  sensitive   = true
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
  sensitive   = true
}

variable "allowed_ip_blocks" {
  description = "Allowed ingress CIDR blocks"
  type        = list(string)
}
