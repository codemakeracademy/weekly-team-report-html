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
  access_key = "ASIAXWQUAD5HZGUAX66F"
  secret_key = "tlXiu5PwrcrnY0QWhuRDbKyExXjntkICQcul/+dq"
  token      = "IQoJb3JpZ2luX2VjEN3//////////wEaCXVzLWVhc3QtMSJHMEUCICeK6PIQikBdmjo4otzOH3/k+7rqCC7BAvFL7qU/RWtOAiEAp6+LWYwCgAyCAI7LgdM+rygYsD9kHGv8oVGcN4g0WQgq+wIIJhAAGgw1MjkzOTY2NzAyODciDLEh4cMlWVpepfboKirYAj6g4wOsVYsmylr3NZA4vb4AHDWnKSrCaqlaC5ONcWYxMgzx2c0C2IKIt1I9Z3p4ZPGhHiwC/JfEqQCtdi3X0Zew5CGfNl0oTWFRunhd4l0kDbzmGmh5pNVqT9qbyXtoOGfPI0SMDbzEheJ3S/i4TfoI7nlbqN83hR8/5OhkqNVJ9AWT3629KExOrEIBYvxrNFIOuHFuM+n+v1fVm6boya+0WFgnIRaoq6PXkliuyRjzXmbPzig7uDNYHoJPfrVAxoe965yd3D+AX+PZyukCvlo6HMJ+G4U6EkmFIe+D17EUhYxeA0r3EhgOuuAbiUkI/Le1TzauiWc3yPmYoaj+F01K/p9vhfWU+nOZmJgWIPRpUTFDckGxrpoTEVjqWukjpguefvDVnNpadNwWRoKFDRD49pWGCIuakMTwySDnxJY4oGEexIZrluNbvcDeydSeIfiVpkXHVOsQMI2wkpAGOqYBqZnvxbAvSp4DBPggYu+nEFn2tG/H/r/2QMgIE8dGMQzUkwr5FFmdA0F1QzJBle/7ABI0vTUsfwlnpnfioMW3f44rCj4PJ3Y79yd5Jn/kbypwtgGmwWR5JPK4T0s7ocH2TzmFZMXRJM6Wwfaz9ovRl4LA4+fNpJMDnLkeceI3tpR6DeU0/S+a34dcUYJzUeXF4RFpnsp4Hi/H+emc3S21F2x8G2dmdw=="
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
