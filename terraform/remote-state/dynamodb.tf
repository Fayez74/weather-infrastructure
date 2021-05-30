provider "aws" {
    region = "eu-west-1"
}

resource "aws_dynamodb_table" "dynamodb-lock" {
  name = "remote-state-locking-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
