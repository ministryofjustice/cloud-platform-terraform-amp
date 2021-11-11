resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = kubernetes_namespace.monitoring.id
  version    = "14.11.1"

  values = [templatefile("${path.module}/templates/prometheus-operator.yaml.tpl", {
    prometheus_endpoint = "${aws_prometheus_workspace.amp.prometheus_endpoint}api/v1/remote_write"
  })]

  depends_on = [kubernetes_service_account.irsa_prometheus_sa]

}
