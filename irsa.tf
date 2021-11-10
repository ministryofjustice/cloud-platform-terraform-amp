data "aws_iam_policy_document" "irsa_prometheus_document" {
  statement {
    actions = [
      "aps:*",
    ]

    resources = [
      "${aws_prometheus_workspace.amp.arn}",
    ]
  }
}

module "irsa_prometheus" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "4.7.0"
  role_name                     = "${var.amp_alias}-prometheus-irsa"
  provider_url                  = var.oidc_provider_url
  role_policy_arns              = aws_iam_policy.irsa_prometheus_policy.arn
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.namespace}:${var.irsa_prometheus_sa_name}"]
}

resource "aws_iam_policy" "irsa_prometheus_policy" {
  name_prefix = var.amp_alias
  description = "Prometheus policy for ${var.amp_alias}"
  policy      = data.aws_iam_policy_document.irsa_prometheus_document.json
}

resource "kubernetes_service_account" "irsa_prometheus_sa" {
  metadata {
    name      = var.irsa_prometheus_sa_name
    namespace = var.namespace
    annotations = {
      "eks.amazonaws.com/role-arn" = module.irsa_prometheus.iam_role_arn
    }
  }
  automount_service_account_token = true
}
