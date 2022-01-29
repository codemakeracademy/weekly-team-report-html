terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
      } 
     }
  backend "s3" {
    bucket = "voronkov-bucket-remote-state"
    key    = "calabs/production/us-west-2/rslab/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-state-lock-voronkov"
    encrypt        = true
      }
}
provider "aws" {
  access_key = "ASIAXWQUAD5HYWFZD34V"
  secret_key = "tzBJqT+O7aDPHrphoI+nmrquv9Q4m6afnPfcaVj4"
  token      = "IQoJb3JpZ2luX2VjEL7//////////wEaCXVzLWVhc3QtMSJGMEQCIDosZjvWlPXewKmokeMSJ4izNNyXuNbGo1ch6wDetPAqAiAJVe9v2oywcDq5J/yM0E2TGKS+4dcFED8OZAD7GsElXiqEAwjn//////////8BEAAaDDUyOTM5NjY3MDI4NyIMcaVCD5xEa0suMKuiKtgCT4JtkPRxkbCMqqtMl9mn9SjsaN6lno3E/sZU2t2as1o1aXu4fo4TcaRzRZlXr7TyNV+1gubQItOeD+ovvphPw+vWfIWY7ZLYkCxB/+8QG3PqYYSSfiwmxifHdOAr/tBbRd5GzhIfgiJmkfd2CE4w6IY6NnBWHFt9wQm8R7C+Mr1LSDuk7wjRJ9Erhb3A2uhZJ1LPnPBFmFKeNqPB8Bh43XJ0xVoMkQ6lCwnzeLmcbKMF4Oi2vp46b/USyP+n06QXdoq+X2u7ufyYrI84MhxJVAOO9Ic9PGu3vDk9Y0m4l6LInizt9kFbaT4pFsFHs4mPvQbxPMNSzNoUsJKRwVZiF3LBvrzyq2wP/id5PHM3Z2VjO/aL0rtKM+0iCpv9HUUN2WNQXhvWraVRgxtmoG/5yBQyELNCdkrL854J2KOYqaT2pq8o+TmWOUb2cx9jwM73Q9vqdFEplcQwuK3TjwY6pwFrad47Xf2A37usxa7KfQqJBJ26qR7B9zu+cqhRcBIGMPWrx2YM9mI6OQgZYVf0ZdRgDqBHwm1WnkKuIzWB9NiRjHKpf2uZZViESC1BxQSgP46rH+l2hmc+/1TLY35s2SjC1aGuld3eR0oJgtT5Iu+EqTT4t0oJLbRtIUKjI0nYKUmkSV859s+cd57L/WbUiT9audujxmB5oD+eUTAg6h/SsxxgXofdqA=="
  region = "us-west-2"
}
#resource "aws_s3_bucket" "bucket" {
#  bucket = "mv-lab12345s"
 # policy = file("policy.json")
 # acl = "public-read"
 # 
  #tags = {
 #   Name = "mv-bucket"
 # }
 # website {
  #    index_document = "index.html"
 #     error_document = "/error/index.html"
 # }
#}

#resource "aws_cloudfront_distribution" "s3_distribution" {
 # origin {
 #  domain_name = "mv-lab1234.s3.us-west-2.amazonaws.com"
# origin_id   = "website"
#  }
#  viewer_certificate {
#    cloudfront_default_certificate = true
#  }
#  default_cache_behavior {
#    allowed_methods  = ["GET", "HEAD"]
#    cached_methods   = ["GET", "HEAD"]
#   target_origin_id = "website"
#
#   forwarded_values {
#      query_string = false

#      cookies {
#        forward = "none"
#      }
#    }

#    viewer_protocol_policy = "allow-all"
#    min_ttl                = 0
#   default_ttl            = 0
#    max_ttl                = 0
#    compress = true

#  }
#    enabled             = true
#    is_ipv6_enabled     = true
#    default_root_object = "index.html"
#    restrictions {
#    geo_restriction {
#      restriction_type = "none"
#      }
#  }
#}
resource "aws_dynamodb_table" "dynamodb-terraform-state1" {
  name = "terraform-state-lock-voronkov"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}

#resource "aws_s3_bucket" "bucket-remote-state" {
#  bucket = "voronkov-bucket-remote-state"
#  acl    = "public-read"
#
#  versioning {
#    enabled = true
#  }
#
#  tags = {
#    Name        = "voronkov-bucket-remote-state"
#  }
#
#}
