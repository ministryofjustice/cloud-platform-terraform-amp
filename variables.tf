variable "amp_alias" {
  description = "User-friendly name for the workspace"
  type        = string
}

variable "team_name" {
  type    = string
  default = "webops"
}

variable "namespace" {
  type    = string
  default = "monitoring"
}

variable "irsa_prometheus_sa_name" {
  type    = string
  default = "prometheus-server"
}

variable "oidc_provider_url" {
  description = "https://oidc.eks.eu-west-2./etc/etc"
  type        = string
}

variable "cluster_domain_name" {
  description = "The cluster domain - used by ingresses"
}

variable "alertmanager_slack_receivers" {
  description = "A list of configuration values for Slack receivers"
  type        = list(any)
}

variable "oidc_components_client_id" {
  description = "OIDC ClientID used to authenticate to Grafana and Prometheus (oauth2-proxy)"
}

variable "oidc_components_client_secret" {
  description = "OIDC ClientSecret used to authenticate to Grafana and Prometheus (oauth2-proxy)"
}

variable "oidc_issuer_url" {
  description = "Issuer URL used to authenticate to Grafana and Prometheus (oauth2-proxy)"
}
