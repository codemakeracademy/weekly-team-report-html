terraform {
  backend "s3" {
    bucket = "trogaev-bucket-lab"
    #key    = "calabs/production/us-west-2/rslab/terraform.tfstate"
    key    = "terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-state-lock-trogaev"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-trogaev" {
  name = "terraform-state-lock-trogaev"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}