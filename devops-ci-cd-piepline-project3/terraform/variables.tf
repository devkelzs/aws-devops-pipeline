variable "project_name" {
  default = "ecommerce-devops"
}

variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  description = "Name of your AWS EC2 key pair"
  type        = string
}
