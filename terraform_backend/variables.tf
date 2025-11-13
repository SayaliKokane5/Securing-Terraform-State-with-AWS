variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"
}


variable "aws_s3_bucket" {
    default = "devinecount-7-7-1997"
    description = "devinecount-7-7-1997"
}

variable "aws_dynamodb_table" {
  default = "my-secret-dynamo-20252027"
  description = "my-secret-dynamo-20252027"
}