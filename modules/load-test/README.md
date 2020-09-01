# Terraform module for Jmeter Load testing Running Jmeter Scripts
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.24 |
| null | ~> 2.1.2 |
| time | ~> 0.5.0 |
| tls | ~> 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| null | ~> 2.1.2 |
| time | ~> 0.5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| host | description | `string` | n/a | yes |
| port | description | `number` | `22` | no |
| private\_key | description | `string` | n/a | yes |
| slave\_ips | description | `string` | n/a | yes |
| source\_jmx | description | `list` | `[]` | no |
| user | description | `string` | `"ec2-user"` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
