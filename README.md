# Terraform module for Jmeter Load testing
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | AMI image for Jmeter | `string` | n/a | yes |
| cidr\_blocks | VPC CIDR | `string` | n/a | yes |
| instance\_type | description | `string` | `"m5.large"` | no |
| key\_name | Key Name | `string` | n/a | yes |
| slaves\_instance\_count | Slave count | `number` | `1` | no |
| subnet\_id | Subnet IDs | `list` | n/a | yes |
| vpc\_id | VPC ID | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
