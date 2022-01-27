terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
      
    }
  }
}
provider "aws" {
  access_key = "ASIAXWQUAD5HY5K2EFO7"
  secret_key = "eK/EV0ZixEmFZnuItFztrIA8pRqIFu41kLzvEN7j"
  token      = "IQoJb3JpZ2luX2VjEHYaCXVzLWVhc3QtMSJGMEQCIHZwoVZldTzQKIj1hnoLBzBMw9aUOtNoEAFRp1PkUorjAiAs8uwankQKgeKOaDy9mpl88P+KWKUu+KeW+32LZz/FkCqEAwif//////////8BEAAaDDUyOTM5NjY3MDI4NyIMduLPjvrzlXm9e9WVKtgCgE7va5YNYsleP2fOSuX+Qi+kZyEda8HUdAIjYMWzxXRSqHd8QAXTWs1jrRRIswn5gxykECNFmmkHIPKDduDd68relUDKX7u3Dh0thTG4SkVWfR9wLwD/NYrPIM4aI5y9JgsMTNGlzyeP48POo9Jknm+r9e4yvzWGHAFmqwHUaM0ojVnj1qt+MZXSSHo37OFgD329Fxtoje1/ueRCfGsin8q28zUI7Avdo4vGMgoZOAPt+ECMBniJX+gRxEnNdDtCaHcOfkZ/Kicmwtpdjp4GtS/owXaXTQNZoihpCekaSp597H0XbqQdKfxVO0z9RO1EvswSxtrhTNWy5wfohq9GpYJojSTgxyIoBraLjq3hm0upMciF/HgCfqw9i6LcPkj/AyCzGZMm4O42xV1oIMpn/CmnuQJbrQFe8RxnIOXLZhSU0a6sEsS1vJOqhFV6KUmOpnxdLm3Qy9Awp8PDjwY6pwG9eESBOIWd6VCmMAVaL8echLvhUmqi3Wq0aEz7/zeBruiyImIBP22qny0t2PELCmhmdskNAPu5260+gFRpTWZvITBtXa2ZpLH6p+jC/Z7S62vaBjWXESIvW+JC8gVa7ql6uHpderaVDtCmCjbz7MvYj54e5HB0lRSiPUt53tzcsY5aqRbj1w7yJ/GurA73lvUE+YMhNFPsRuVVkZEmUGzNgCcOCuAxeg=="
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
