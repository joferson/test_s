resource "aws_s3_bucket" "serasa_bucket_teste" {
  bucket = "serasa-test-bucket-18162906"
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

data "aws_iam_policy_document" "s3_read_permissions" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:ListBucket",
    ]

    resources = ["arn:aws:s3:::${aws_s3_bucket.serasa_bucket_teste.bucket}"]
  }
}
