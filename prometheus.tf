resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = kubernetes_namespace.monitoring.id
  version    = "14.11.1"

  values = [templatefile("${path.module}/templates/prometheus-values.yaml.tpl", {
    prometheus_endpoint = "${aws_prometheus_workspace.amp.prometheus_endpoint}api/v1/remote_write"
  })]

  depends_on = [kubernetes_service_account.irsa_prometheus_sa]

}

# Prometheus proxy
# Ref: https://github.com/evry/docker-oidc-proxy
resource "random_id" "session_secret" {
  byte_length = 16
}

data "template_file" "prometheus_proxy" {
  template = file("${path.module}/templates/oauth2-proxy.yaml.tpl")

  vars = {
    upstream      = "http://prometheus-server:80"
    hostname      = local.prometheus_ingress
    exclude_paths = "^/-/healthy$"
    issuer_url    = var.oidc_issuer_url
    client_id     = var.oidc_components_client_id
    client_secret = var.oidc_components_client_secret
    cookie_secret = random_id.session_secret.b64_std
    clusterName   = var.amp_alias
  }
}

resource "helm_release" "prometheus_proxy" {
  name       = "prometheus-proxy"
  namespace  = kubernetes_namespace.monitoring.id
  repository = "https://charts.helm.sh/stable"
  chart      = "oauth2-proxy"
  version    = "3.2.2"

  values = [
    data.template_file.prometheus_proxy.rendered,
  ]

  depends_on = [
    random_id.session_secret,
  ]

  lifecycle {
    ignore_changes = [keyring]
  }
}
