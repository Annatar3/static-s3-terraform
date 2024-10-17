provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  force_destroy = true 
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "${aws_s3_bucket.website_bucket.arn}/*"
    }]
  })
}

resource "aws_s3_object" "index_html" { 
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html" 
  source = "index.html" 
  acl    = "public-read"
}

output "website_url" {
  value = aws_s3_bucket.website_bucket.website_endpoint
}
