variable "aws_region" {
  description = "This is region specific for AWS"
  default     = "ap-south-1"
}

variable "aws_ec2_ami_id" {
  description = "This is AMI ID for EC2 Ubuntu instance"
  default     = "ami-0a716d3f3b16d290c"
}

variable "aws_instance_type" {
  description = "This is instance type"
  default     = "t3.micro"
}

variable "aws_root_volume_size" {
  description = "This is a root volume size"
  default     = 10
}

variable "aws_instance_count" {
  description = "Count of AWS instances"
  default     = 2
}



locals {
  instances = {
    instance1 = "instance1"
    instance2 = "instance2"
  }
}

