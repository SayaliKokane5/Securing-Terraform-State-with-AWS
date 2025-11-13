resource "aws_s3_bucket" "my_bucket" {
  bucket = var.aws_s3_bucket

  tags = {
    Name = "devinecount-7-7-1997"
  }

  force_destroy = true  # optional: allows deletion if not empty
}

resource "aws_dynamodb_table" "my-aws_dynamodb_table" {
    name = var.aws_dynamodb_table
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      
      name = "LockID"
      type = "S"
    }
    tags = {
        Name = var.aws_dynamodb_table
    }
  
}

