<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.44.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.www](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appname"></a> [appname](#input\_appname) | Application Name | `string` | `""` | no |
| <a name="input_custname"></a> [custname](#input\_custname) | Customer name | `string` | `""` | no |
| <a name="input_envname"></a> [envname](#input\_envname) | Environment name - sbox, dev, test, prod | `string` | `""` | no |
| <a name="input_external_proxy_ip"></a> [external\_proxy\_ip](#input\_external\_proxy\_ip) | External Proxy IP | `string` | `"10.0.0.233"` | no |
| <a name="input_internal_proxy_ip"></a> [internal\_proxy\_ip](#input\_internal\_proxy\_ip) | Internal Proxy IP | `string` | `"10.0.0.233"` | no |
| <a name="input_public_service"></a> [public\_service](#input\_public\_service) | Public or private | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.44.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.www](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appname"></a> [appname](#input\_appname) | Application Name | `string` | `""` | no |
| <a name="input_custname"></a> [custname](#input\_custname) | Customer name | `string` | `""` | no |
| <a name="input_envname"></a> [envname](#input\_envname) | Environment name - sbox, dev, test, prod | `string` | `""` | no |
| <a name="input_external_proxy_ip"></a> [external\_proxy\_ip](#input\_external\_proxy\_ip) | External Proxy IP | `string` | `"10.0.0.233"` | no |
| <a name="input_internal_proxy_ip"></a> [internal\_proxy\_ip](#input\_internal\_proxy\_ip) | Internal Proxy IP | `string` | `"10.0.0.233"` | no |
| <a name="input_public_service"></a> [public\_service](#input\_public\_service) | Public or private | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
