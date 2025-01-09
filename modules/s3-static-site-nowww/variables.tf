variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
}


variable "logging_bucket_name" {
  type        = string
  description = "The name of the bucket to send cf logs to."
  default     = "common-cloudfront-logs-awslogbucket-1"
}

variable "common_tags" {
  description = "Common tags you want applied to all components."
}
