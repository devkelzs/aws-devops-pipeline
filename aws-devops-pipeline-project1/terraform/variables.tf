variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "key_name" {
  description = "The name of the AWS key pair"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}
