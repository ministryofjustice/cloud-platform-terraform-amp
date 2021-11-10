resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = kubernetes_namespace.monitoring.id
  version    = "14.11.1"

  set {
    name  = "serviceAccounts.server.create"
    value = "false"
  }

  set {
    name  = "serviceAccounts.server.name"
    value = "prometheus-server"
  }

  depends_on = [kubernetes_service_account.irsa_prometheus_sa]

}
