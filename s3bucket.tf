terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
  backend "s3" {
    bucket = "voronkov-bucket-remote-state"
    key    = "calabs/production/us-west-2/rslab/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-state-lock-voronkov"
    encrypt        = true
  }    
    }
  }
}
provider "aws" {
  access_key = "ASIAXWQUAD5H6L3H6XOB"
  secret_key = "YKYn411xyhd/skcAmYZAQx+peFTCeoBH4u/3ub+Y"
  token      = "IQoJb3JpZ2luX2VjEJT//////////wEaCXVzLWVhc3QtMSJGMEQCIAEPyUfEarQH1fki2SYyj4ogYsK2E8/vvLVfUhb5Qzd6AiAOZCBh+O3VgNvXlpalOOSI5e3UJV7Yl8dGUihq1yb7XyqEAwi9//////////8BEAAaDDUyOTM5NjY3MDI4NyIM3fNq1yz312V/6r14KtgCijDQt07twX2mIpwZTC6sz00laCpFt6hXt+tA9kh0b0dUoFsOPl1ZaC75w5D1zU658h5Ab4XMBaaH1kleuWMvILsAq3zs7smFFZmtD0e0WlM+e1PQKz9yDCTtNPVubBT36iGKTTIf/6vWz5tqMCpmKKNIzVi7rRALJPc3u/bqloY+5ccfnUrDvtUi56cwyoy75kR0s01zUipBqq0hV7j2AggCx+5IIg2/+fiUgOzj4uFDKJumA+PQbhA7KxmTeWoRcRbz23qoOsacLubIVRa20vH4kv7dftybAj6pCvfiYH6LNazrT8WtbYAkTiy2eIn/08VtWYksra7WoR6IVkPUYrQ6KDRIDLQw/5m6ppqjwfpDctRKRX3uutXH+GcpB5mePJrPEOvncoe5Cq3Roh761yxfTDgYqWXQzh4uGgkm0fX6Sp0voO6gJgol53ZgZVPoDfq/Jw8Y9awwhYrKjwY6pwFLOJ43IGuS0o+txRu1ZjVbL7yw1nfvJZPJ9wFGWeGGgc4c8baVQCipdu2pT8c0Rol89HX+62xiQSz9ARCJYibEbV6KyNzeX4/is4njQ4WRoMgga3m/hiuFgge08ma5rIfE89zlxId18FrmP9m1HouJashwsplScZGF0rwjN94RUFC7g4mVzWr7zbmNarOLlK65S/71+RR1RG18Q8rmb8EOFS4rMskCeg=="
  region = "us-west-2"
}
resource "aws_s3_bucket" "bucket" {
  bucket = "mv-lab12345s"
  policy = file("policy.json")
  acl = "public-read"
  
  tags = {
    Name = "mv-bucket1234s"
  }
  website {
      index_document = "index.html"
      error_document = "/error/index.html"
  }
}

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
resource "aws_dynamodb_table" "dynamodb-terraform-state" {
  name = "terraform-state-lock-voronkov"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
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
