locals {
  grafana_ingress = format(
    "%s.%s.%s",
    "grafana",
    var.amp_alias,
    var.cluster_domain_name,
  )
  grafana_root = format(
    "%s.%s.%s",
    "https://grafana",
    var.amp_alias,
    var.cluster_domain_name,
  )
}
