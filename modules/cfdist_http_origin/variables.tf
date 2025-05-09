variable "dns_domain_name" {
  type        = string
  description = "The domain name for the website."
}
variable "r53_domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "bucket" {
  type        = string
  description = "The name of the bucket to send cf logs to."
  default     = "skynet-common-cloudfront-logs-awslogbucket-1fbwmkcjg32kk.s3.amazonaws.com"
}

variable "common_tags" {
  description = "Common tags you want applied to all components."
}

variable "acm_certificate_arn" {
  description = "The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution. Specify this, cloudfront_default_certificate, or iam_certificate_id. The ACM certificate must be in US-EAST-1."
  type        = string
  default     = ""
}

variable "aliases" {
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution. (OPTIONAL)"
  type        = list(string)
  default     = []
}

variable "allowed_methods" {
  description = "HTTP methods that CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. Allowed values are: [\"HEAD\", \"GET\"], [\"GET\", \"HEAD\", \"OPTIONS\"], or [\"DELETE\", \"GET\", \"HEAD\", \"OPTIONS\", \"PATCH\", \"POST\", \"PUT\"]."
  type        = list(string)
  default     = ["HEAD", "GET"]
}

variable "bucket_logging" {
  description = "Enable logging to an S3 Bucket. If this is set you must configure below."
  type        = bool
  default     = true
}

variable "cached_methods" {
  description = "HTTP methods for which CloudFront caches responses. Allowed values are: [\"HEAD\", \"GET\"] or [\"GET\", \"HEAD\", \"OPTIONS\"]."
  type        = list(string)
  default     = ["HEAD", "GET"]
}

#variable "cloudfront_default_certificate" {
#  description = "if you want viewers to use HTTPS to request your objects and you're using the CloudFront domain name for your distribution. Specify this, acm_certificate_arn, or iam_certificate_id."
#  type        = string
#  default     = ""
#}

variable "comment" {
  description = "Any comments you want to include about the distribution. (OPTIONAL)"
  type        = string
  default     = ""
}

variable "compress" {
  description = "Indicates whether CloudFront automatically compresses certain files for this cache behavior. (OPTIONAL)"
  type        = bool
  default     = false
}

variable "custom_header" {
  description = "One or more sub-resources with name and value parameters that specify header data that will be sent to the origin. For example: `[{name = \"header1\", value = \"value1\"}]`."
  type        = list(map(string))
  default     = []
}

variable "default_root_object" {
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type        = string
  default     = ""
}

variable "default_ttl" {
  description = "The default time in seconds that objects stay in CloudFront caches before CloudFront forwards another request to your custom origin to determine whether the object has been updated."
  type        = string
  default     = "3600"
}

variable "domain_name" {
  description = "The DNS domain name of either the S3 bucket, or web site of your custom origin."
  type        = string
  default     = ""
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content."
  type        = bool
  default     = true
}

variable "environment" {
  description = "A field used to set the Environment tag on created resources"
  type        = string
  default     = "Development"
}

variable "forward" {
  description = "pecifies whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted_names"
  type        = string
  default     = "all"
}

variable "headers" {
  description = "Specifies the headers that you want Amazon CloudFront to forward to the origin for this cache behavior. (OPTIONAL)"
  type        = list(string)
  default     = []
}

variable "http_port" {
  description = "The HTTP port the custom origin listens on."
  type        = string
  default     = "80"
}

variable "http_version" {
  description = "The maximum HTTP version to support on the distribution. Allowed values are http1.1 and http2. The default is http2."
  type        = string
  default     = "http2"
}

variable "https_port" {
  description = "The HTTPS port the custom origin listens on."
  type        = string
  default     = "443"
}

variable "iam_certificate_id" {
  description = "The IAM certificate identifier of the custom viewer certificate for this distribution if you are using a custom domain. Specify this, acm_certificate_arn, or cloudfront_default_certificate."
  type        = string
  default     = ""
}

variable "include_cookies" {
  description = "Indicates whether CloudFront includes cookies in access logs."
  type        = bool
  default     = false
}

variable "is_ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution. (OPTIONAL)"
  type        = bool
  default     = false
}


variable "locations" {
  description = "The two-letter, uppercase country code for a country that you want to include in your blacklist or whitelist."
  type        = list(string)
  default     = ["US"]
}

variable "max_ttl" {
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. (OPTIONAL)"
  type        = string
  default     = "86400"
}

variable "min_ttl" {
  description = "The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. (OPTIONAL)"
  type        = string
  default     = "0"
}

variable "minimum_protocol_version" {
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. See https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#minimum_protocol_version"
  type        = string
  default     = "TLSv1.2_2018"
}

variable "ordered_cache_behavior" {
  description = "An ordered list of cache behaviors resource for this distribution. (OPTIONAL)"
  type        = list(string)
  default     = []
}

variable "origin_access_identity" {
  description = "The CloudFront origin access identity to associate with the origin. You must specify the full origin ID"
  type        = string
  default     = ""
}

variable "origin_id" {
  description = "An identifier for the origin. The value of Id must be unique within the distribution."
  type        = string
}

variable "origin_keepalive_timeout" {
  description = "The Custom KeepAlive timeout, in seconds. By default, AWS enforces a limit of 60. But you can request an increase. (OPTIONAL)"
  type        = string
  default     = "60"
}

variable "origin_path" {
  description = "The path that CloudFront uses to request content from an S3 bucket or custom origin. The combination of the DomainName and OriginPath properties must resolve to a valid path. The value must start with a slash mark (/) and cannot end with a slash mark. (OPTIONAL)"
  type        = string
  default     = ""
}

variable "origin_protocol_policy" {
  description = "The origin protocol policy to apply to your origin. One of http-only, https-only, or match-viewer."
  type        = string
  default     = "https-only"
}

variable "origin_read_timeout" {
  description = "The Custom Read timeout, in seconds. By default, AWS enforces a limit of 60. But you can request an increase. (OPTIONAL)"
  type        = string
  default     = "60"
}

variable "origin_ssl_protocols" {
  description = "he SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS. A list of one or more of SSLv3, TLSv1, TLSv1.1, and TLSv1.2."
  type        = list(string)
  default     = ["TLSv1.2"]
}

variable "path_pattern" {
  description = "The pattern to which an ordered cache behavior applies."
  type        = string
  default     = "*"
}

variable "bucket_prefix" {
  description = "Logging bucket prefix"
  type        = string
  default     = ""
}

variable "price_class" {
  description = "The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100."
  type        = string
  default     = "PriceClass_All"
}

variable "query_string" {
  description = "Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior."
  type        = bool
  default     = false
}

variable "query_string_cache_keys" {
  description = "When specified, along with a value of true for query_string, all query strings are forwarded, however only the query string keys listed in this argument are cached. When omitted with a value of true for query_string, all query string keys are cached. (OPTIONAL)"
  type        = list(string)
  default     = []
}

variable "restriction_type" {
  description = "The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
  type        = string
  default     = "whitelist"
}

variable "smooth_streaming" {
  description = "Indicates whether you want to distribute media files in Microsoft Smooth Streaming format using the origin that is associated with this cache behavior. (OPTIONAL)"
  type        = bool
  default     = false
}

variable "ssl_support_method" {
  description = "Specifies how you want CloudFront to serve HTTPS requests. One of vip or sni-only. Required if you specify acm_certificate_arn or iam_certificate_id. NOTE: vip causes CloudFront to use a dedicated IP address and may incur extra charges."
  type        = string
  default     = "sni-only"
}

variable "tags" {
  description = "Custom tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "target_origin_id" {
  description = "The ID value of the origin to which you want CloudFront to route requests when a request matches the value of the PathPattern property."
  type        = string
}

variable "trusted_signers" {
  description = "The AWS accounts, if any, that you want to allow to create signed URLs for private content. (OPTIONAL)"
  type        = list(string)
  default     = []
}

variable "viewer_protocol_policy" {
  description = "the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https."
  type        = string
  default     = "https-only"
}

variable "web_acl_id" {
  description = "The AWS WAF web ACL to associate with this distribution."
  type        = string
  default     = ""
}

variable "whitelisted_names" {
  description = "If you have specified whitelist to forward, the whitelisted cookies that you want."
  type        = list(string)
  default     = []
}
