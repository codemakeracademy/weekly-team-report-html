terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
      } 
     }
  #backend "s3" {
  #  bucket = "voronkov-bucket-remote-state"
  #  key    = "calabs/production/us-west-2/rslab/terraform.tfstate"
  #  region = "us-west-2"
  #  dynamodb_table = "terraform-state-lock-voronkov"
  #  encrypt        = true
  #    }
}
provider "aws" {
  access_key = "ASIAXWQUAD5H7T3VEWOP"
  secret_key = "EUFI4xSWUycSGQWlLPh7zO/rWSIhdcktzaOfyd2X"
  token      = "IQoJb3JpZ2luX2VjEMX//////////wEaCXVzLWVhc3QtMSJGMEQCIBKihMpwFxKTdkQo/vxssGDuF+DVQ0HS5ba4KBJKV0kjAiB+R7XmDSISlLb/XSxEDApTOIhl6sGihCj1VNKpmH0ScCqEAwj+//////////8BEAAaDDUyOTM5NjY3MDI4NyIMoP2xTekEeTCVifWcKtgCcP6b2XYuxhb9hMkAhKYbHiDafvHjg3cdTkvBtY+on3tzIHP7hohDp7EiVznOFg8yGWRNEzIiBmhym993qlUOIa95TlzqcYPv/+pUAPz+Iw25EoH/cwgLZklA8myIOhSwouw2RHJ1CEucdg63vF0rTPU0fXB1Wrsu/irhr+DBeEt2QGJIeo2WHJWd1Sj2rEJA02FZc11BoDw0JjqugSpE2JdmqL4LrTGZQHKgfDltCcNr8tnDJSM7xahFn7M66p9TUCwCq6j+KeykYz75vMjDbw4NGambcTDL7C+qs2IC0ejNmRC+S5qyV87+M3bvip08futkUoIOdJohP/9RURZFipMCC5aNZJOFEJjZirU60ZSFaTYA0XBfb363WLeOwC2JW2KZPfnIaUGYZaBDcvm5t1nJBMM13aaBxOqRaJ2BCXJ6VLgs9eIp+R8vcEuI9x2UCRUGrggXRQsw7IqNkAY6pwEFup8z6TLxYPzgn/xd9/+L7wSj3zQvrFsEDZBNwNGgEPHX3mPqxfo0uT+eYaaJzsJtBosy8cCUg/TPd6xVgqAohoaG5MeH4pBVdqxnt9KzAItZLGKIitSSlsn8nNspfMDXuBqOiBRztdIO2NlF4imHo6AxUFIASUBfpaijqOfyI4KXX2dDbVx+J51LaavcrDBRip6Jpi/JNIDswrgq+Q8mV520WYyFjQ=="
  region = "us-west-2"
}
resource "aws_s3_bucket" "bucket" {
  bucket = "mv-lab12345s"
  policy = file("policy.json")
  acl = "public-read"
  
  tags = {
    Name = "mv-bucket"
  }
  website {
      index_document = "index.html"
      error_document = "/error/index.html"
  }
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
   domain_name = "mv-lab1234.s3.us-west-2.amazonaws.com"
 origin_id   = "website"
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
   target_origin_id = "website"

   forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
   default_ttl            = 0
    max_ttl                = 0
    compress = true

  }
    enabled             = true
    is_ipv6_enabled     = true
    default_root_object = "index.html"
    restrictions {
    geo_restriction {
      restriction_type = "none"
      }
  }
}
resource "aws_dynamodb_table" "dynamodb-terraform-state" {
  name = "terraform-state-lock-voronkov"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
    tags = {
    Name        = "voronkov-bucket-remote-state"
  }
  }
}

resource "aws_s3_bucket" "bucket-remote-state" {
  bucket = "voronkov-bucket-remote-state"
  acl    = "public-read"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "voronkov-bucket-remote-state"
  }

}
#resource "aws_s3_bucket" "bucket-remote-state123" {
#  bucket = "voronkov-bucket-remote-state132"
#  acl    = "public-read"
#
#  versioning {
#    enabled = true
#  }

#  tags = {
#    Name        = "voronkov-bucket-remote-state123"
#  }

#}
