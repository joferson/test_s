resource "aws_sqs_queue" "sqs_serasa_teste" {
  name                    = "sqs_serasa_teste_18222906"
  sqs_managed_sse_enabled = true
  tags = {
    Environment = "production"
  }
}

resource "aws_sqs_queue_policy" "sqs_serasa_policy" {
  queue_url = aws_sqs_queue.sqs_serasa_teste.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.sqs_serasa_teste.arn}"
    }
  ]
}
POLICY
}
