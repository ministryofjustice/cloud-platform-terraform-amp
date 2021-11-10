variable "amp_alias" {
  description = "User-friendly name for the workspace"
  type        = string
}

variable "team_name" {
  type = string
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
