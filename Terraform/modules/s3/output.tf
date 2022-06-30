output "s3" {
  description = "dados do s3 criado id e name"
  value       = "${aws_s3_bucket.serasa_bucket_teste.id}"
}
