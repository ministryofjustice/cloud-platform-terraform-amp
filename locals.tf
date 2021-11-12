locals {
  grafana_ingress = format(
    "%s.%s",
    "grafana",
    var.cluster_domain_name,
  )
  grafana_root = format(
    "%s.%s",
    "https://grafana",
    var.cluster_domain_name,
  )
}
