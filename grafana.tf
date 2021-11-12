resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = kubernetes_namespace.monitoring.id
  version    = "6.17.5"

  values = [templatefile("${path.module}/templates/grafana-values.yaml.tpl", {
    grafana_ingress     = local.grafana_ingress
    grafana_root        = local.grafana_root
  })]

  depends_on = [kubernetes_service_account.irsa_prometheus_sa]

}
