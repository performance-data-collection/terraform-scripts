
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| inbound_cidr_blocks | List of CIDR blocks. | list | `<list>` | no |
| instance_type | The type of instance to start. | string | `t2.micro` | no |
| key_file_path | The path to the public key file to use for ssh access. | string | `default.pem.pub` | no |
| key_name | The key name to use for the instance. | string | `terraform-key` | no |
| priv_key_file_path | The path to the private key file to use for ssh access. | string | `default.pem` | no |
| region_ami | The AWS AMI to use for the instance. | string | - | yes |

