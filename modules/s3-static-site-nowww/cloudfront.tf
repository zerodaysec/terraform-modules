# Cloudfront S3 for redirect to www.
resource "aws_cloudfront_distribution" "root_s3_distribution" {
  origin {
    domain_name = aws_s3_bucket_website_configuration.root_bucket.website_endpoint
    origin_id   = "S3-${var.bucket_name}"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  logging_config {
    include_cookies = false
    bucket          = "${var.logging_bucket_name}.s3.amazonaws.com"
    prefix          = var.bucket_name
  }

  enabled         = true
  is_ipv6_enabled = true

  aliases = [var.bucket_name]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${var.bucket_name}"

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }

      headers = ["Origin"]
    }
    # 3600 - 1hr
    # 86400 - 1day
    # 604800 - 1 week
    # 2592000 - 1 month
    # 31536000 - 1 yr
    #tfsec:ignore:aws-cloudfront-enforce-https
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.cert_validation.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  tags = var.common_tags
}
