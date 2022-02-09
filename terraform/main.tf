terraform {
  backend "s3" {
    bucket = "trogaev-bucket-remote-state"
    #key    = "calabs/production/us-west-2/rslab/terraform.tfstate"
    key    = "terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-state-lock-trogaev"
    encrypt        = true
  }
}

provider "aws" {
  region  = "us-west-2" # Oregon
#  profile = "PowerUserAccess-529396670287"
}

resource "aws_s3_bucket" "trogaev-bucket-lab" {
  bucket = "trogaev-bucket-lab"
  acl    = "public-read"
#  policy = file("policy.json")
#  policy = aws_s3_bucket_policy.trogaev-bucket-1
  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::trogaev-bucket-lab/*"
    }
  ]
}
EOF

  tags = {
    Name        = "trogaev-bucket-lab"
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_cloudfront_distribution" "trogaev_distribution" {
  origin {
    domain_name = aws_s3_bucket.trogaev-bucket-lab.bucket_regional_domain_name
    origin_id   = "trogaev-origin-lab"

    #s3_origin_config {
    #  origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    #}
  }

  enabled             = true
  is_ipv6_enabled     = true
  #comment             = "Some comment"
  default_root_object = "index.html"

  #logging_config {
  #  include_cookies = false
  #  bucket          = "mylogs.s3.amazonaws.com"
  #  prefix          = "myprefix"
  #}

  #aliases = ["mysite.example.com", "yoursite.example.com"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "trogaev-origin-lab"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
  
  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
