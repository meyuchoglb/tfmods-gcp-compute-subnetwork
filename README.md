# tfmods-gcp-compute-subnetwork

### Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| project_id | The GCP Project ID. | `string` || yes |
| vpc_id | The VPC for the subnetwork with the format `projects/{{project}}/global/networks/{{name}}` | `string` || yes |
| subnets | The subnet properties map. | `map(any)` | {} | no |
| mtu | The GCP Project ID. | `string` | 1460 | yes |


### Outputs
| Name | Description |
|------|-------------|
| vpc_network_self_link | VPC selflink |
| vpc_network_id | The identifier with the format `projects/{{project}}/global/networks/{{name}}`|
