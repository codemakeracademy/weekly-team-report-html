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
  access_key = "ASIAXWQUAD5H5ROJ5HOH"
  secret_key = "02lTuVP1+M4XX54diMezG1iKm7FFY9G9usyszIzd"
  token      = "IQoJb3JpZ2luX2VjEN7//////////wEaCXVzLWVhc3QtMSJGMEQCIC3l/FmZkxmuQ9JGbfOCRnlYkP2f1puuCteZ944t1PR/AiAhO1oKaOY/lTOvK6gk71Cw4AmqMrfswcosk3jzKZQvfSr7AggnEAAaDDUyOTM5NjY3MDI4NyIMRU7USMPMX6vmhEUEKtgClfswIK4shiUSr1tagOZ9oMB5CPrRIQw9tNFxwPXnTT0sbpZyKaA/rkVoABhLi8RYl0YtRU3CYSHwlx7AXo0A9JCQBXon3z82wxv5kCR3HeQtUeS9ciNdjyxRQnlgjaomXpqlwDbjmQBcGVupNcatm48bV6RCUxxycb/Wu0opTKKt8wUwB3D6Epw4xUPD1W6wWSmetC6QDGvQTeGpnKcyAYgtJ0XeyKJZo9hLqDwVlgnRBoje4FBNcLtnU2l998eCDPWoMaiHOCAb63GgM+DiaIGleS/f7QiyztHlE1bLheCCtzsmUzKC9C3ccApvmbYUV9VRQDGdJFR64vq/W4bIaqxMzNOE1kw2/CXbBtdIClBCn7tgTC1+5oUz/Z6zUmx4HqHhccAWObzdlgg3soUXnDn8nQwGYYeM5Irz+cPilxgK+Nz3ADsMv0+wHr+0TOP8S05cJHkNAoYwvcKSkAY6pwGRVORh7hn8KTNOrTI9U4b9QznO9pfYtYKED5/MbaYTwkOe1ZX6ERUH80FiCrLuJ8aCJoHZFiegVzODFUD+26f/MhFrs/eKP2xJwsvoOVraXXr8/GI9fo5UWJvLjRvATL9fX4URWVHPB4juYSAmDoPfZL1WVHSnRhikLmySLpUFMasN4Xv1fOHlE6THJH5M+iJ3mP5zju1kBk8e5m6UJXN0NfdzJeSe2w=="
  region = "us-west-2"
}
#resource "aws_s3_bucket" "bucket" {
#  bucket = "mv-lab12345s"
#  policy = file("policy.json")
#  acl = "public-read"
  
#  tags = {
#    Name = "mv-bucket"
#  }
#  website {
#      index_document = "index.html"
#      error_document = "/error/index.html"
#  }
#}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
   domain_name = "mv-lab12345s.s3.us-west-2.amazonaws.com"
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
#resource "aws_dynamodb_table" "dynamodb-terraform-state" {
#  name = "terraform-state-lock-voronkov"
#  hash_key = "LockID"
#  read_capacity = 20
#  write_capacity = 20

#  attribute {
#    name = "LockID"
#    type = "S"
#  }
#    tags = {
#      Name        = "voronkov-bucket-remote-state"
#  }
  
#}

#resource "aws_s3_bucket" "bucket-remote-state" {
#  bucket = "voronkov-bucket-remote-state"
#  acl    = "public-read"

#  versioning {
#    enabled = true
#  }

#  tags = {
#    Name        = "voronkov-bucket-remote-state"
#  }

#}
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
