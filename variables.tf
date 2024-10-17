variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "my-personal-website-bucket"
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-east-1"
}
