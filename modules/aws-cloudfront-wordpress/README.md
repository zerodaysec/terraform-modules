# CLoudFront WordPress Terraform module

[![Help Contribute to Open Source](https://www.codetriage.com/soroushatarod/terraform-cloudfront-wordpress/badges/users.svg)](https://www.codetriage.com/soroushatarod/terraform-cloudfront-wordpress)

Terraform module which creates the CloudFront distribution for a WordPress website with pre-configured settings.


## Example

```hcl
module "cloudfront_wordpress" {
   source = "soroush/cloudfront_wordpress/aws"
   cnames = ["www.example.com"]
   domain_name = "example.com"
   origin_id = "E22XRTe7wQ72"
   enabled = true
   origin_protocol_policy = "http-only"
   acm_certificate_arn = "arn:aws:acm:us-east-1:20:certificate/9489-60"
   tags = {
     name = "production"
   }
}
```



## Terraform version

Terraform version 0.11.7 or newer is required for this module to work.



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.cdn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | SSL Certificate ARN | `any` | n/a | yes |
| <a name="input_cnames"></a> [cnames](#input\_cnames) | CNAME records which you would later add the cloudfront DNS name to it | `list(string)` | n/a | yes |
| <a name="input_cookies_whitelisted_names"></a> [cookies\_whitelisted\_names](#input\_cookies\_whitelisted\_names) | List of cookies to be whitelisted. | `list(string)` | <pre>[<br>  "comment_author_*",<br>  "comment_author_email_*",<br>  "comment_author_url_*",<br>  "wordpress_*",<br>  "wordpress_logged_in_*",<br>  "wordpress_test_cookie",<br>  "wp-settings-*"<br>]</pre> | no |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | The default amount of time an object is ina CloudFront cache before it sends another request in absence of Cache-Control | `number` | `300` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain of your origin. This is usually the root domain example.com | `any` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set the status of the distribution | `any` | n/a | yes |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | The HTTP port which Cloudfront should connect to the origin | `number` | `80` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | The HTTPS port which the | `number` | `443` | no |
| <a name="input_max_ttl"></a> [max\_ttl](#input\_max\_ttl) | The maxium amount of seconds you want CloudFront to cache the object, before feching it from the origin | `number` | `31536000` | no |
| <a name="input_min_ttl"></a> [min\_ttl](#input\_min\_ttl) | The minimum time you want objects to stay in CloudFront | `number` | `0` | no |
| <a name="input_minimum_protocol_version"></a> [minimum\_protocol\_version](#input\_minimum\_protocol\_version) | The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. | `string` | `"TLSv1.1_2016"` | no |
| <a name="input_origin_id"></a> [origin\_id](#input\_origin\_id) | Unique identifier of the origin | `any` | n/a | yes |
| <a name="input_origin_protocol_policy"></a> [origin\_protocol\_policy](#input\_origin\_protocol\_policy) | Either one of them (http-only, https-only,match-viewer) | `any` | n/a | yes |
| <a name="input_origin_ssl_protocols"></a> [origin\_ssl\_protocols](#input\_origin\_ssl\_protocols) | The SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS. A list of one or more  of SSLv3, TLSv1, TLSv1.1, and TLSv1.2. | `list(string)` | <pre>[<br>  "TLSv1.2",<br>  "TLSv1.1"<br>]</pre> | no |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | The price class for this distribution. One of PriceClass\_All, PriceClass\_200, PriceClass\_100 | `string` | `"PriceClass_All"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to identify the Cloudfront distribution | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name for the distribution |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | The domain name for the distribution |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set |
| <a name="output_id"></a> [id](#output\_id) | The identifier for the distribution |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->




## Authors

Maintained by [Soroush Atarod](https://github.com/soroushatarod). Find out more, please visit [InfinityPP](https://www.infinitypp.com/amazon-aws/terraform-cloudfront-wordpress-module/)

## License

Apache 2 Licensed. See LICENSE for full details.
