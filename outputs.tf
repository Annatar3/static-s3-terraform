output "bucket_website_url" {
  value = aws_s3_bucket.website_bucket.website_endpoint
  description = "The URL of the static website hosted in the S3 bucket"
}
