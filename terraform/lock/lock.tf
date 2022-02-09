provider "aws" {
  region = "us-west-1"
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-daniil"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket = "lab-sthree-daniil"
    key    = "terraform.tfstate"
    region = "us-west-1"
    dynamodb_table = "terraform-state-lock-daniil"
    encrypt        = true
  }
}