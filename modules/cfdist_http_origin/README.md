# Static Site

## Setup

You will need to import the r53 zone before starting else this will create the zone from scratch and ACM will not be able to verify properly.

`aws route53 list-hosted-zones-by-name --dns-name example.com`

Get the HostedZoneId

`terraform import aws_route53_domain.main $HostedZoneId`
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0.0 |
| <a name="provider_aws.acm_provider"></a> [aws.acm\_provider](#provider\_aws.acm\_provider) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.ssl_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudfront_distribution.cf_distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_route53_record.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.root-a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution. Specify this, cloudfront\_default\_certificate, or iam\_certificate\_id. The ACM certificate must be in US-EAST-1. | `string` | `""` | no |
| <a name="input_aliases"></a> [aliases](#input\_aliases) | Extra CNAMEs (alternate domain names), if any, for this distribution. (OPTIONAL) | `list(string)` | `[]` | no |
| <a name="input_allowed_methods"></a> [allowed\_methods](#input\_allowed\_methods) | HTTP methods that CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. Allowed values are: ["HEAD", "GET"], ["GET", "HEAD", "OPTIONS"], or ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]. | `list(string)` | <pre>[<br>  "HEAD",<br>  "GET"<br>]</pre> | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The name of the bucket to send cf logs to. | `string` | `"skynet-common-cloudfront-logs-awslogbucket-1fbwmkcjg32kk.s3.amazonaws.com"` | no |
| <a name="input_bucket_logging"></a> [bucket\_logging](#input\_bucket\_logging) | Enable logging to an S3 Bucket. If this is set you must configure below. | `bool` | `true` | no |
| <a name="input_cached_methods"></a> [cached\_methods](#input\_cached\_methods) | HTTP methods for which CloudFront caches responses. Allowed values are: ["HEAD", "GET"] or ["GET", "HEAD", "OPTIONS"]. | `list(string)` | <pre>[<br>  "HEAD",<br>  "GET"<br>]</pre> | no |
| <a name="input_comment"></a> [comment](#input\_comment) | Any comments you want to include about the distribution. (OPTIONAL) | `string` | `""` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags you want applied to all components. | `any` | n/a | yes |
| <a name="input_compress"></a> [compress](#input\_compress) | Indicates whether CloudFront automatically compresses certain files for this cache behavior. (OPTIONAL) | `bool` | `false` | no |
| <a name="input_custom_header"></a> [custom\_header](#input\_custom\_header) | One or more sub-resources with name and value parameters that specify header data that will be sent to the origin. For example: `[{name = "header1", value = "value1"}]`. | `list(map(string))` | `[]` | no |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL. | `string` | `""` | no |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | The default time in seconds that objects stay in CloudFront caches before CloudFront forwards another request to your custom origin to determine whether the object has been updated. | `string` | `"3600"` | no |
| <a name="input_dns_domain_name"></a> [dns\_domain\_name](#input\_dns\_domain\_name) | The domain name for the website. | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The DNS domain name of either the S3 bucket, or web site of your custom origin. | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether the distribution is enabled to accept end user requests for content. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | A field used to set the Environment tag on created resources | `string` | `"Development"` | no |
| <a name="input_forward"></a> [forward](#input\_forward) | pecifies whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted\_names | `string` | `"all"` | no |
| <a name="input_headers"></a> [headers](#input\_headers) | Specifies the headers that you want Amazon CloudFront to forward to the origin for this cache behavior. (OPTIONAL) | `list(string)` | `[]` | no |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | The HTTP port the custom origin listens on. | `string` | `"80"` | no |
| <a name="input_http_version"></a> [http\_version](#input\_http\_version) | The maximum HTTP version to support on the distribution. Allowed values are http1.1 and http2. The default is http2. | `string` | `"http2"` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | The HTTPS port the custom origin listens on. | `string` | `"443"` | no |
| <a name="input_iam_certificate_id"></a> [iam\_certificate\_id](#input\_iam\_certificate\_id) | The IAM certificate identifier of the custom viewer certificate for this distribution if you are using a custom domain. Specify this, acm\_certificate\_arn, or cloudfront\_default\_certificate. | `string` | `""` | no |
| <a name="input_include_cookies"></a> [include\_cookies](#input\_include\_cookies) | Indicates whether CloudFront includes cookies in access logs. | `bool` | `false` | no |
| <a name="input_is_ipv6_enabled"></a> [is\_ipv6\_enabled](#input\_is\_ipv6\_enabled) | Whether the IPv6 is enabled for the distribution. (OPTIONAL) | `bool` | `false` | no |
| <a name="input_locations"></a> [locations](#input\_locations) | The two-letter, uppercase country code for a country that you want to include in your blacklist or whitelist. | `list(string)` | <pre>[<br>  "US"<br>]</pre> | no |
| <a name="input_max_ttl"></a> [max\_ttl](#input\_max\_ttl) | The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. (OPTIONAL) | `string` | `"86400"` | no |
| <a name="input_min_ttl"></a> [min\_ttl](#input\_min\_ttl) | The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. (OPTIONAL) | `string` | `"0"` | no |
| <a name="input_minimum_protocol_version"></a> [minimum\_protocol\_version](#input\_minimum\_protocol\_version) | The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. See <https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#minimum_protocol_version> | `string` | `"TLSv1.2_2018"` | no |
| <a name="input_ordered_cache_behavior"></a> [ordered\_cache\_behavior](#input\_ordered\_cache\_behavior) | An ordered list of cache behaviors resource for this distribution. (OPTIONAL) | `list(string)` | `[]` | no |
| <a name="input_origin_access_identity"></a> [origin\_access\_identity](#input\_origin\_access\_identity) | The CloudFront origin access identity to associate with the origin. You must specify the full origin ID | `string` | `""` | no |
| <a name="input_origin_id"></a> [origin\_id](#input\_origin\_id) | An identifier for the origin. The value of Id must be unique within the distribution. | `string` | n/a | yes |
| <a name="input_origin_keepalive_timeout"></a> [origin\_keepalive\_timeout](#input\_origin\_keepalive\_timeout) | The Custom KeepAlive timeout, in seconds. By default, AWS enforces a limit of 60. But you can request an increase. (OPTIONAL) | `string` | `"60"` | no |
| <a name="input_origin_path"></a> [origin\_path](#input\_origin\_path) | The path that CloudFront uses to request content from an S3 bucket or custom origin. The combination of the DomainName and OriginPath properties must resolve to a valid path. The value must start with a slash mark (/) and cannot end with a slash mark. (OPTIONAL) | `string` | `""` | no |
| <a name="input_origin_protocol_policy"></a> [origin\_protocol\_policy](#input\_origin\_protocol\_policy) | The origin protocol policy to apply to your origin. One of http-only, https-only, or match-viewer. | `string` | `"https-only"` | no |
| <a name="input_origin_read_timeout"></a> [origin\_read\_timeout](#input\_origin\_read\_timeout) | The Custom Read timeout, in seconds. By default, AWS enforces a limit of 60. But you can request an increase. (OPTIONAL) | `string` | `"60"` | no |
| <a name="input_origin_ssl_protocols"></a> [origin\_ssl\_protocols](#input\_origin\_ssl\_protocols) | he SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS. A list of one or more of SSLv3, TLSv1, TLSv1.1, and TLSv1.2. | `list(string)` | <pre>[<br>  "TLSv1.2"<br>]</pre> | no |
| <a name="input_path_pattern"></a> [path\_pattern](#input\_path\_pattern) | The pattern to which an ordered cache behavior applies. | `string` | `"*"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Indicates whether CloudFront includes cookies in access logs. | `string` | `""` | no |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | The price class for this distribution. One of PriceClass\_All, PriceClass\_200, PriceClass\_100. | `string` | `"PriceClass_All"` | no |
| <a name="input_query_string"></a> [query\_string](#input\_query\_string) | Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior. | `bool` | `false` | no |
| <a name="input_query_string_cache_keys"></a> [query\_string\_cache\_keys](#input\_query\_string\_cache\_keys) | When specified, along with a value of true for query\_string, all query strings are forwarded, however only the query string keys listed in this argument are cached. When omitted with a value of true for query\_string, all query string keys are cached. (OPTIONAL) | `list(string)` | `[]` | no |
| <a name="input_r53_domain_name"></a> [r53\_domain\_name](#input\_r53\_domain\_name) | The domain name for the website. | `string` | n/a | yes |
| <a name="input_restriction_type"></a> [restriction\_type](#input\_restriction\_type) | The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist. | `string` | `"whitelist"` | no |
| <a name="input_smooth_streaming"></a> [smooth\_streaming](#input\_smooth\_streaming) | Indicates whether you want to distribute media files in Microsoft Smooth Streaming format using the origin that is associated with this cache behavior. (OPTIONAL) | `bool` | `false` | no |
| <a name="input_ssl_support_method"></a> [ssl\_support\_method](#input\_ssl\_support\_method) | Specifies how you want CloudFront to serve HTTPS requests. One of vip or sni-only. Required if you specify acm\_certificate\_arn or iam\_certificate\_id. NOTE: vip causes CloudFront to use a dedicated IP address and may incur extra charges. | `string` | `"sni-only"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Custom tags to apply to all resources. | `map(string)` | `{}` | no |
| <a name="input_target_origin_id"></a> [target\_origin\_id](#input\_target\_origin\_id) | The ID value of the origin to which you want CloudFront to route requests when a request matches the value of the PathPattern property. | `string` | n/a | yes |
| <a name="input_trusted_signers"></a> [trusted\_signers](#input\_trusted\_signers) | The AWS accounts, if any, that you want to allow to create signed URLs for private content. (OPTIONAL) | `list(string)` | `[]` | no |
| <a name="input_viewer_protocol_policy"></a> [viewer\_protocol\_policy](#input\_viewer\_protocol\_policy) | the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https. | `string` | `"https-only"` | no |
| <a name="input_web_acl_id"></a> [web\_acl\_id](#input\_web\_acl\_id) | The AWS WAF web ACL to associate with this distribution. | `string` | `""` | no |
| <a name="input_whitelisted_names"></a> [whitelisted\_names](#input\_whitelisted\_names) | If you have specified whitelist to forward, the whitelisted cookies that you want. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_active_trusted_signers"></a> [active\_trusted\_signers](#output\_active\_trusted\_signers) | The key pair IDs that CloudFront is aware of for each trusted signer, if the distribution is set up to serve private content with signed URLs. |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN (Amazon Resource Name) for the distribution. |
| <a name="output_caller_reference"></a> [caller\_reference](#output\_caller\_reference) | Internal value used by CloudFront to allow future updates to the distribution configuration. |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | The domain name corresponding to the distribution. |
| <a name="output_etag"></a> [etag](#output\_etag) | The current version of the distribution's information. |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. |
| <a name="output_id"></a> [id](#output\_id) | The identifier for the distribution. |
| <a name="output_in_progress_validation_batches"></a> [in\_progress\_validation\_batches](#output\_in\_progress\_validation\_batches) | The number of invalidation batches currently in progress. |
| <a name="output_last_modified_time"></a> [last\_modified\_time](#output\_last\_modified\_time) | The date and time the distribution was last modified. |
| <a name="output_status"></a> [status](#output\_status) | The current status of the distribution. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
