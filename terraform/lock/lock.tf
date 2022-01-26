provider "aws" {
  region = "us-west-2"
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "lab-dynomodb-daniil"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket = "lab-sthree-daniil"
    key    = "terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt        = true
  }
}