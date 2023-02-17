# cloud-platform-terraform-amp

This Terraform module generates an AWS-managed Prometheus instance for a Cloud Platform cluster.

## Usage

See [example](example/) dir

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_aws.ireland"></a> [aws.ireland](#provider\_aws.ireland) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_irsa_prometheus"></a> [irsa\_prometheus](#module\_irsa\_prometheus) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 4.7.0 |
| <a name="module_prometheus_sns_topic"></a> [prometheus\_sns\_topic](#module\_prometheus\_sns\_topic) | github.com/ministryofjustice/cloud-platform-terraform-sns-topic | 4.3 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.irsa_prometheus_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_prometheus_alert_manager_definition.alertmanager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_alert_manager_definition) | resource |
| [aws_prometheus_rule_group_namespace.self_check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_rule_group_namespace) | resource |
| [aws_prometheus_workspace.amp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_workspace) | resource |
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus_proxy](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_limit_range.monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/limit_range) | resource |
| [kubernetes_namespace.monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_network_policy.allow_alertmanager_api](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.allow_ingress_controllers](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.allow_kube_api](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.default](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_resource_quota.monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/resource_quota) | resource |
| [kubernetes_service_account.irsa_prometheus_sa](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [random_id.session_secret](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_iam_policy_document.irsa_prometheus_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [template_file.prometheus_proxy](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alertmanager_slack_receivers"></a> [alertmanager\_slack\_receivers](#input\_alertmanager\_slack\_receivers) | A list of configuration values for Slack receivers | `list(any)` | n/a | yes |
| <a name="input_amp_alias"></a> [amp\_alias](#input\_amp\_alias) | User-friendly name for the workspace | `string` | n/a | yes |
| <a name="input_cluster_domain_name"></a> [cluster\_domain\_name](#input\_cluster\_domain\_name) | The cluster domain - used by ingresses | `any` | n/a | yes |
| <a name="input_irsa_prometheus_sa_name"></a> [irsa\_prometheus\_sa\_name](#input\_irsa\_prometheus\_sa\_name) | n/a | `string` | `"prometheus-server"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"monitoring"` | no |
| <a name="input_oidc_components_client_id"></a> [oidc\_components\_client\_id](#input\_oidc\_components\_client\_id) | OIDC ClientID used to authenticate to Grafana and Prometheus (oauth2-proxy) | `any` | n/a | yes |
| <a name="input_oidc_components_client_secret"></a> [oidc\_components\_client\_secret](#input\_oidc\_components\_client\_secret) | OIDC ClientSecret used to authenticate to Grafana and Prometheus (oauth2-proxy) | `any` | n/a | yes |
| <a name="input_oidc_issuer_url"></a> [oidc\_issuer\_url](#input\_oidc\_issuer\_url) | Issuer URL used to authenticate to Grafana and Prometheus (oauth2-proxy) | `any` | n/a | yes |
| <a name="input_oidc_provider_url"></a> [oidc\_provider\_url](#input\_oidc\_provider\_url) | https://oidc.eks.eu-west-2./etc/etc | `string` | n/a | yes |
| <a name="input_team_name"></a> [team\_name](#input\_team\_name) | n/a | `string` | `"webops"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_amp_endpoint"></a> [amp\_endpoint](#output\_amp\_endpoint) | n/a |
| <a name="output_amp_id"></a> [amp\_id](#output\_amp\_id) | n/a |

<!--- END_TF_DOCS --->

## Reading Material

[AMP User Guide](https://docs.aws.amazon.com/prometheus/latest/userguide/what-is-Amazon-Managed-Service-Prometheus.html)
