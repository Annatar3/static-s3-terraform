variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "epam-final-aws"
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-east-1"
}
