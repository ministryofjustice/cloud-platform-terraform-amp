locals {
  grafana_ingress = format(
    "%s.%s.%s",
    "grafana",
    var.amp_alias,
    var.cluster_domain_name
  )
  grafana_root = format(
    "%s.%s.%s",
    "https://grafana",
    var.amp_alias,
    var.cluster_domain_name
  )
  prometheus_ingress = format(
    "%s.%s.%s",
    "prometheus",
    var.amp_alias,
    var.cluster_domain_name
  )
  prometheus_root = format(
    "%s.%s.%s",
    "https://prometheus",
    var.amp_alias,
    var.cluster_domain_name
  )
}
