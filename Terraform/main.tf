terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "serasa-test-bucket"
    dynamodb_table = "terraform-state-lock-dynamo"
    key            = "terraform.tfstate"
  }
}
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  tags = {
    Name        = "BU"
    Environment = "Prod"
  }

  attribute {
    name = "LockID"
    type = "S"
  }
}
resource "aws_s3_bucket" "serasa_bucket_teste" {
  bucket = "serasa-test-bucket"


  tags = {
    Name        = "BU"
    Environment = "Prod"
  }
}
resource "aws_s3_bucket_versioning" "bucket_version" {
  bucket = aws_s3_bucket.serasa_bucket_teste.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_acl" "serasa_bucket_teste_acl" {
  bucket = aws_s3_bucket.serasa_bucket_teste.id
  acl    = "private"
}
