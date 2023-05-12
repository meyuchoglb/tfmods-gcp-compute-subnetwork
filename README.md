# tfmods-gcp-compute-subnetwork

### Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| project_id | The GCP Project ID. | `string` || yes |
| vpc_id | The VPC for the subnetwork with the format `projects/{{project}}/global/networks/{{name}}` | `string` || yes |
| subnets | The subnet properties map. | `map(any)` | {} | no |


### Outputs
| Name | Description |
|------|-------------|
| subnets | GCP subnet properties map. |
